#!/bin/bash

set -e

project="../"
outdir="$project/system/product/overlay"

dir="$project/system/product/overlay/treble-overlay-moto-onefusion"
aapt package -f -F "$outdir/treble-overlay-moto-onefusion-unsigned.apk" -M "$dir/AndroidManifest.xml" -S "$dir/res" -I android.jar

dir="$project/system/product/overlay/treble-overlay-moto-onefusion-systemui"
aapt package -f -F "$outdir/treble-overlay-moto-onefusion-systemui-unsigned.apk" -M "$dir/AndroidManifest.xml" -S "$dir/res" -I android.jar

dir="$project/system/product/overlay/treble-overlay-moto-onefusion-lockscreen"
aapt package -f -F "$outdir/treble-overlay-moto-onefusion-lockscreen-unsigned.apk" -M "$dir/AndroidManifest.xml" -S "$dir/res" -I android.jar