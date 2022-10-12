SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=false
LATESTARTSERVICE=false

REPLACE="
"

android_check() {
 if (( $API < 30 )); then
    ui_print "• Sorry, support for Android 11, 12, 12.1 & 13 only."
    ui_print ""
    sleep 2
    exit 1
 fi
 if (( $API > 33 )); then
    ui_print "• Sorry, support for Android 11, 12, 12.1 & 13 only."
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

  if [[ $API == 30 ]]; then
    ui_print "- Android 11 detected"
    mkdir -p $MODPATH/system/product/overlay
    mv -f $MODPATH/system/product/overlay/overlay-redvelvetcake.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
    mv -f $MODPATH/system/product/overlay/overlay-redvelvetcake-systemui.apk $MODPATH/system/product/overlay/SystemUI__auto_generated_rro_product.apk
    rm $MODPATH/system/product/overlay/overlay-snowcone.apk
    rm $MODPATH/system/product/overlay/overlay-snowcone-systemui.apk
    rm $MODPATH/system/product/overlay/overlay-snowcone-lockscreen.apk
    rm $MODPATH/system/product/overlay/overlay-tiramisu.apk
    rm $MODPATH/system/product/overlay/overlay-tiramisu-systemui.apk
  else
    if [[ $API == 31 ]]; then
      ui_print "- Android 12 detected"
      mkdir -p $MODPATH/system/product/overlay
      mv -f $MODPATH/system/product/overlay/overlay-snowcone.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
      mv -f $MODPATH/system/product/overlay/overlay-snowcone-systemui.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-systemui.apk
      mv -f $MODPATH/system/product/overlay/overlay-snowcone-lockscreen.apk $MODPATH/system/product/overlay/SystemUI__auto_generated_rro_vendor.apk
      rm $MODPATH/system/product/overlay/overlay-redvelvetcake.apk
      rm $MODPATH/system/product/overlay/overlay-redvelvetcake-systemui.apk
      rm $MODPATH/system/product/overlay/overlay-tiramisu.apk
      rm $MODPATH/system/product/overlay/overlay-tiramisu-systemui.apk
    else
      if [[ $API == 32 ]]; then
        ui_print "- Android 12.1 detected"
        mkdir -p $MODPATH/system/product/overlay
        mv -f $MODPATH/system/product/overlay/overlay-snowcone.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
        mv -f $MODPATH/system/product/overlay/overlay-snowcone-systemui.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-systemui.apk
        mv -f $MODPATH/system/product/overlay/overlay-snowcone-lockscreen.apk $MODPATH/system/product/overlay/SystemUI__auto_generated_rro_vendor.apk
        rm $MODPATH/system/product/overlay/overlay-redvelvetcake.apk
        rm $MODPATH/system/product/overlay/overlay-redvelvetcake-systemui.apk
        rm $MODPATH/system/product/overlay/overlay-tiramisu.apk
        rm $MODPATH/system/product/overlay/overlay-tiramisu-systemui.apk
      else 
        ui_print "- Android 13 detected"
        mv -f $MODPATH/system/product/overlay/overlay-tiramisu.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
        mv -f $MODPATH/system/product/overlay/overlay-tiramisu-systemui.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-systemui.apk
        rm $MODPATH/system/product/overlay/overlay-redvelvetcake.apk
        rm $MODPATH/system/product/overlay/overlay-redvelvetcake-systemui.apk
        rm $MODPATH/system/product/overlay/overlay-snowcone.apk
        rm $MODPATH/system/product/overlay/overlay-snowcone-systemui.apk
        rm $MODPATH/system/product/overlay/overlay-snowcone-lockscreen.apk
      fi
    fi
  fi
  
  ui_print "- Extracting module files"
  ui_print "- Deleting package cache"
  rm -rf /data/system/package_cache/*
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}