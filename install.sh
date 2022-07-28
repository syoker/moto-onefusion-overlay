SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

REPLACE="
"

android_check() {
 if [[ $API < 30 ]]; then
    ui_print "• Sorry, support for Android 11, 12 & 12.1 only."
    ui_print ""
    sleep 2
    exit 1
 fi
 if [[ $API > 32 ]]; then
    ui_print "• Sorry, support for Android 11, 12 & 12.1 only."
    ui_print ""
    sleep 2
    exit 1
  fi
}

print_modname() {
  ui_print ""
  ui_print "•••••••••••••••••••••••••••••••••••"
  ui_print "    Motorola One Fusion Overlay"
  ui_print "•••••••••••••••••••••••••••••••••••"
  ui_print ""
  ui_print "• Module by Syoker"
  ui_print ""

  sleep 2
}

on_install() {

  android_check

  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  ui_print "- Extracting module files"

  if [[ $API == 30 ]]; then
    mkdir -p $MODPATH/system/product/overlay
    mv -f $MODPATH/system/product/overlay/overlay30_1.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
    mv -f $MODPATH/system/product/overlay/overlay30_2.apk $MODPATH/system/product/overlay/SystemUI__auto_generated_rro_product.apk
    rm $MODPATH/system/product/overlay/overlay31_1.apk
    rm $MODPATH/system/product/overlay/overlay31_2.apk
    rm $MODPATH/system/product/overlay/overlay31_3.apk
    rm $MODPATH/system/product/overlay/overlay32_1.apk
    rm $MODPATH/system/product/overlay/overlay32_2.apk
    rm $MODPATH/system/product/overlay/overlay32_3.apk
  else
    if [[ $API == 31 ]]; then
      mkdir -p $MODPATH/system/product/overlay
      mv -f $MODPATH/system/product/overlay/overlay31_1.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
      mv -f $MODPATH/system/product/overlay/overlay31_2.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-systemui.apk
      mv -f $MODPATH/system/product/overlay/overlay31_3.apk $MODPATH/system/product/overlay/SystemUI__auto_generated_rro_vendor.apk
      rm $MODPATH/system/product/overlay/overlay30_1.apk
      rm $MODPATH/system/product/overlay/overlay30_2.apk
      rm $MODPATH/system/product/overlay/overlay32_1.apk
      rm $MODPATH/system/product/overlay/overlay32_2.apk
      rm $MODPATH/system/product/overlay/overlay32_3.apk
    else
      mv -f $MODPATH/system/product/overlay/overlay32_1.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
      mv -f $MODPATH/system/product/overlay/overlay32_2.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-systemui.apk
      mv -f $MODPATH/system/product/overlay/overlay32_3.apk $MODPATH/system/product/overlay/SystemUI__auto_generated_rro_vendor.apk
      rm $MODPATH/system/product/overlay/overlay30_1.apk
      rm $MODPATH/system/product/overlay/overlay30_2.apk
      rm $MODPATH/system/product/overlay/overlay31_1.apk
      rm $MODPATH/system/product/overlay/overlay31_2.apk
      rm $MODPATH/system/product/overlay/overlay31_3.apk
    fi
  fi

  ui_print "- Deleting package cache"
  rm -rf /data/system/package_cache/*
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}