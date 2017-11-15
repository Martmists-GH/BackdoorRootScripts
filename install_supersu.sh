# Only use this file if you don't want to have Magisk
# Requirements:
# wget, unzip, adb


# Start the exploit by getting ADB root access
adb shell am start -n com.android.engineeringmode/.qualcomm.DiagEnabled --es "code" "angela"

# Make a magisk folder
adb shell mkdir /data/supersu

# Download and extract SuperSU
wget https://s3-us-west-2.amazonaws.com/supersu/download/zip/SuperSU-v2.82-201705271822.zip
unzip SuperSU-v2.82-201705271822.zip -d SuperSU

chmod +x SuperSU/arm64/su

adb push {SuperSU/arm64/*,SuperSU/common/*} /data/supersu/

adb shell mkdir /data/supersu/xbin
adb shell cp /system/xbin/* xbin/
adb shell cp supersu xbin

mount -o bind /data/supersu/xbin /system/xbin

echo "Now install the SuperSU app from the play store"
echo "To reapply after a reboot, run 'mount -o bind /data/supersu/xbin /system/xbin'"
