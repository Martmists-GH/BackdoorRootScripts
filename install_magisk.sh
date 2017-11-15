# cd to dir
cd /data/magisk/

# Create images
./magisk --createimg magisk.img 64
mv magisk.img ..

./magisk --createimg xbin.img 64

./magisk --mountimg xbin.img xbin

# Set up xbin
cp /system/xbin/* xbin/
cp magisk xbin
umount xbin
rmdir xbin

# mount xbin to system
./magisk --mountimg xbin.img /system/xbin

# init magisk
magisk --post-fs
magisk --post-fs-data
magisk --service
