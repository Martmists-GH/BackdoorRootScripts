# Boot Images

This folder contains magisk-patched boot images for devices.

Format: `magisk_boot_<Manufacturer>_<Model>_<ROM>_<VERSION>.img`

To install these, find the location of your boot image (e.g. `/dev/block/bootdevice/by-name/boot` on OnePlus 3T)

Then copy a compatible image to your phone and from there run `dd if=/path/to/magisk_boot.img of=/path/to/boot` AT YOUR OWN RISK.

**I am not responsible for any bricked devices due to this.**
