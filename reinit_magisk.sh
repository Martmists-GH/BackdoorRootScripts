cd /data/magisk

# mount xbin to system
./magisk --mountimg xbin.img /system/xbin

# reinit magisk
magisk --post-fs
magisk --post-fs-data
magisk --service
