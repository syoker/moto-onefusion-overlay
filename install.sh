SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

REPLACE="
"

android_check() {
 if (( $API < 30 || $API > 33)); then
    ui_print "• Sorry, support for Android 11, 12, 12.1 & 13 only."
    ui_print ""
    sleep 2
    exit 1
 fi
}

edit_buildprop_file() {
  BUILD_PROP_SYSTEM_PRODUCT_PATH=""
  BUILD_PROP_MODPATH_PRODUCT_PATH=""
  BUILD_PROP_SYSTEM_SYSTEM_PATH=""
  BUILD_PROP_MODPATH_SYSTEM_PATH=""
  BUILD_PROP_SYSTEM_SYSTEM_EXT_PATH=""
  BUILD_PROP_MODPATH_SYSTEM_EXT_PATH=""
  BUILD_PROP_SYSTEM_SYSTEM_DLKM_PATH=""
  BUILD_PROP_MODPATH_SYSTEM_DLKM_PATH=""

  if [ -f "/system/product/etc/build.prop" ]; then
    mkdir -p $MODPATH/system/product/etc
    BUILD_PROP_SYSTEM_PRODUCT_PATH="/system/product/etc/build.prop"
    BUILD_PROP_MODPATH_PRODUCT_PATH="$MODPATH/system/product/etc/build.prop"
  fi

  if [ -f "/system/product/build.prop" ]; then
    mkdir -p $MODPATH/system/product
    BUILD_PROP_SYSTEM_PRODUCT_PATH="/system/product/build.prop"
    BUILD_PROP_MODPATH_PRODUCT_PATH="$MODPATH/system/product/build.prop"
  fi

  if [ -f "/system/build.prop" ]; then
    mkdir -p $MODPATH/system
    BUILD_PROP_SYSTEM_SYSTEM_PATH="/system/build.prop"
    BUILD_PROP_MODPATH_SYSTEM_PATH="$MODPATH/system/build.prop"
  fi

  if [ -f "/system/system_ext/etc/build.prop" ]; then 
    mkdir -p $MODPATH/system/system_ext/etc
    BUILD_PROP_SYSTEM_SYSTEM_EXT_PATH="/system/system_ext/etc/build.prop"
    BUILD_PROP_MODPATH_SYSTEM_EXT_PATH="$MODPATH/system/system_ext/etc/build.prop"
  fi

  if [ -f "/system/system_dlkm/etc/build.prop" ]; then
    mkdir -p $MODPATH/system/system_dlkm/etc
    BUILD_PROP_SYSTEM_SYSTEM_DLKM_PATH="/system/system_dlkm/etc/build.prop"
    BUILD_PROP_MODPATH_SYSTEM_DLKM_PATH="$MODPATH/system/system_dlkm/etc/build.prop"
  fi

  BRAND_PRODUCT="ro.product.product.brand=motorola"
  DEVICE_PRODUCT="ro.product.product.device=astro"
  MANUFACTURER_PRODUCT="ro.product.product.manufacturer=motorola"
  MODEL_PRODUCT="ro.product.product.model=motorola one fusion"
  NAME_PRODUCT="ro.product.product.name=astro_retail"

  if [ $BUILD_PROP_SYSTEM_PRODUCT_PATH != "" ]; then
    sed -e "/^ro.product.product.brand/c\\$BRAND_PRODUCT" \
        -e "/^ro.product.product.device/c\\$DEVICE_PRODUCT" \
        -e "/^ro.product.product.manufacturer/c\\$MANUFACTURER_PRODUCT" \
        -e "/^ro.product.product.model/c\\$MODEL_PRODUCT" \
        -e "/^ro.product.product.name/c\\$NAME_PRODUCT" $BUILD_PROP_SYSTEM_PRODUCT_PATH > $BUILD_PROP_MODPATH_PRODUCT_PATH
  fi

  BRAND_SYSTEM="ro.product.system.brand=motorola"
  DEVICE_SYSTEM="ro.product.system.device=astro"
  MANUFACTURER_SYSTEM="ro.product.system.manufacturer=motorola"
  MODEL_SYSTEM="ro.product.system.model=motorola one fusion"
  NAME_SYSTEM="ro.product.system.name=astro_retail"
  
  # For Project Elixir
  RO_BUILD_PRODUCT="ro.build.product=motorola one fusion"
  ORG_ELIXIR_DEVICE="org.elixir.device=motorola one fusion"

  if [ $BUILD_PROP_SYSTEM_SYSTEM_PATH != "" ]; then
    sed -e "/^ro.product.system.brand/c\\$BRAND_SYSTEM" \
        -e "/^ro.product.system.device/c\\$DEVICE_SYSTEM" \
        -e "/^ro.product.system.manufacturer/c\\$MANUFACTURER_SYSTEM" \
        -e "/^ro.product.system.model/c\\$MODEL_SYSTEM" \
        -e "/^ro.product.system.name/c\\$NAME_SYSTEM" \
        -e "/^org.elixir.device/c\\$ORG_ELIXIR_DEVICE" \
        -e "/^ro.build.product/c\\$RO_BUILD_PRODUCT" $BUILD_PROP_SYSTEM_SYSTEM_PATH > $BUILD_PROP_MODPATH_SYSTEM_PATH
  fi

  BRAND_SYSTEM_EXT="ro.product.system_ext.brand=motorola"
  DEVICE_SYSTEM_EXT="ro.product.system_ext.device=astro"
  MANUFACTURER_SYSTEM_EXT="ro.product.system_ext.manufacturer=motorola"
  MODEL_SYSTEM_EXT="ro.product.system_ext.model=motorola one fusion"
  NAME_SYSTEM_EXT="ro.product.system_ext.name=astro_retail"

  if [ $BUILD_PROP_SYSTEM_SYSTEM_EXT_PATH != "" ]; then
    sed -e "/^ro.product.system_ext.brand/c\\$BRAND_SYSTEM_EXT" \
        -e "/^ro.product.system_ext.device/c\\$DEVICE_SYSTEM_EXT" \
        -e "/^ro.product.system_ext.manufacturer/c\\$MANUFACTURER_SYSTEM_EXT" \
        -e "/^ro.product.system_ext.model/c\\$MODEL_SYSTEM_EXT" \
        -e "/^ro.product.system_ext.name/c\\$NAME_SYSTEM_EXT" $BUILD_PROP_SYSTEM_SYSTEM_EXT_PATH > $BUILD_PROP_MODPATH_SYSTEM_EXT_PATH
  fi

  BRAND_SYSTEM_DLKM="ro.product.system_dlkm.brand=motorola"
  DEVICE_SYSTEM_DLKM="ro.product.system_dlkm.device=astro"
  MANUFACTURER_SYSTEM_DLKM="ro.product.system_dlkm.manufacturer=motorola"
  MODEL_SYSTEM_DLKM="ro.product.system_dlkm.model=motorola one fusion"
  NAME_SYSTEM_DLKM="ro.product.system_dlkm.name=astro_retail"

  if [ $BUILD_PROP_SYSTEM_SYSTEM_DLKM_PATH != "" ]; then
    sed -e "/^ro.product.system_dlkm.brand/c\\$BRAND_SYSTEM_DLKM" \
        -e "/^ro.product.system_dlkm.device/c\\$DEVICE_SYSTEM_DLKM" \
        -e "/^ro.product.system_dlkm.manufacturer/c\\$MANUFACTURER_SYSTEM_DLKM" \
        -e "/^ro.product.system_dlkm.model/c\\$MODEL_SYSTEM_DLKM" \
        -e "/^ro.product.system_dlkm.name/c\\$NAME_SYSTEM_DLKM" $BUILD_PROP_SYSTEM_SYSTEM_DLKM_PATH > $BUILD_PROP_MODPATH_SYSTEM_DLKM_PATH
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
  
  edit_buildprop_file

  case $API in
    30)
      ui_print "- Android 11 detected"
      cp -f $MODPATH/system/product/overlay/overlay-redvelvetcake.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
      cp -f $MODPATH/system/product/overlay/overlay-redvelvetcake-systemui.apk $MODPATH/system/product/overlay/SystemUI__auto_generated_rro_product.apk
    ;;
    31)
      ui_print "- Android 12 detected"
      cp -f $MODPATH/system/product/overlay/overlay-snowcone.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
      cp -f $MODPATH/system/product/overlay/overlay-snowcone-systemui.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-systemui.apk
      cp -f $MODPATH/system/product/overlay/overlay-snowcone-lockscreen.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-lockscreen.apk
    ;;
    32)
      ui_print "- Android 12.1 detected"
      cp -f $MODPATH/system/product/overlay/overlay-snowcone.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
      cp -f $MODPATH/system/product/overlay/overlay-snowcone-systemui.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-systemui.apk
      cp -f $MODPATH/system/product/overlay/overlay-snowcone-lockscreen.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-lockscreen.apk
    ;;
    33)
      ui_print "- Android 13 detected"
      cp -f $MODPATH/system/product/overlay/overlay-tiramisu.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion.apk
      cp -f $MODPATH/system/product/overlay/overlay-tiramisu-systemui.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-systemui.apk
      cp -f $MODPATH/system/product/overlay/overlay-tiramisu-lockscreen.apk $MODPATH/system/product/overlay/treble-overlay-moto-onefusion-lockscreen.apk
    ;;
  esac

  rm $MODPATH/system/product/overlay/overlay-redvelvetcake.apk
  rm $MODPATH/system/product/overlay/overlay-redvelvetcake-systemui.apk
  rm $MODPATH/system/product/overlay/overlay-snowcone.apk
  rm $MODPATH/system/product/overlay/overlay-snowcone-systemui.apk
  rm $MODPATH/system/product/overlay/overlay-snowcone-lockscreen.apk
  rm $MODPATH/system/product/overlay/overlay-tiramisu.apk
  rm $MODPATH/system/product/overlay/overlay-tiramisu-systemui.apk
  rm $MODPATH/system/product/overlay/overlay-tiramisu-lockscreen.apk
  
  ui_print "- Extracting module files"
  ui_print "- Deleting package cache"
  rm -rf /data/system/package_cache/*
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}