# bin/bash

SOURCE=${HOME}/Documents/wiener_kaufmannschaft/img
TARGET=${HOME}/Documents/wiener_kaufmannschaft/img_flat
IMG=${HOME}/Documents/wiener_kaufmannschaft/img_small
echo $SOURCE
ls $SOURCE

cp $SOURCE/*/*.jpg -n $TARGET
for f in $TARGET/*.jpg; do  echo "Converting $f to $IMG/$(basename "$f" .jpg).jpg"; convert  -quality 50% "$f"  "$IMG/$(basename "$f" .jpg).jpg"; done