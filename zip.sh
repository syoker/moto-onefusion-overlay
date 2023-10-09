#!/bin/bash

filename="moto-onefusion-overlay.zip"

files=("META-INF" "system" "install.sh" "module.prop" "uninstall.sh")

7z a "$filename" "${files[@]}" -xr!"system/product/overlay/treble-overlay-moto-onefusion/" -xr!"system/product/overlay/treble-overlay-moto-onefusion-lockscreen/" -xr!"system/product/overlay/treble-overlay-moto-onefusion-systemui/"