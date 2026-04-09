#!/system/bin/sh
cd /data/adb/netfilter || exit

i() { ksud debug insmod "$@"; }

i ipset/ip_set.ko

for m in bitmap_ip bitmap_ipmac bitmap_port; do
    i ipset/ip_set_$m.ko
done

for m in ip ipmac ipmark ipport ipportip ipportnet mac net netiface netnet netport netportnet; do
    i ipset/ip_set_hash_$m.ko
done

i ipset/ip_set_list_set.ko
i xt_set.ko
i xt_addrtype.ko