#!/system/bin/sh

if [ -z "$KSU" ]; then
    ui_print "! This module only supports KernelSU"
    abort
fi

set_perm_recursive "$MODPATH/bin" 0 0 0755 0755

mv -f "$MODPATH/bin/ipset" "/data/adb/ksu/bin/"
rm -rf "$MODPATH/bin"

[ -d "$MODPATH/netfilter" ] && {
    rm -rf "/data/adb/netfilter"
    mv "$MODPATH/netfilter" "/data/adb/"
    chmod -R 755 "/data/adb/netfilter"
    ui_print "- IP-SET has been installed"
}