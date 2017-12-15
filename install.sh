# Requires: 
# ADB
# wget
# unzip


# Start the exploit by getting ADB root access
adb shell am start -n com.android.engineeringmode/.qualcomm.DiagEnabled --es "code" "angela"

# Make a magisk folder
adb shell mkdir /data/magisk

# Get magisk; TODO: Support Beta stream and DON'T USE direct XDA link
wget https://github.com/topjohnwu/Magisk/archive/v14.5_2.zip
unzip v14.5_2.zip -d Magisk

# Magisk is not executable due to Linux security, so chmod it
chmod +x Magisk/arm64/magisk

# We now have a `magisk` folder, let's push to the device
adb push {Magisk/arm64/*,Magisk/common/*} /data/magisk/

# Get busybox and push it
wget https://github.com/haruue/MagiskBusybox/releases/download/1.26.2-1/busybox-armv6l.zip
unzip busybox-armv6l.zip -d busybox-armv6l
adb push busybox-armv6l/system/xbin/busybox /data/magisk/

# Install MagiskManager
wget https://github.com/topjohnwu/MagiskManager/releases/download/v5.4.3/MagiskManager-v5.4.3.apk
adb install MagiskManager-v5.4.3.apk

chmod +x install_magisk.sh
chmod +x reinit_magisk.sh

adb push install_magisk.sh /data/magisk
adb push reinit_magisk.sh /data/magisk

adb shell /data/magisk/install_magisk.sh
