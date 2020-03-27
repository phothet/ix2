1. usb stick (1GB - /dev/sdb) needs to be formatted as fat32 type c

```
fdisk /dev/sdb
```
- press `p` to print and check if there's any existing partition
- press `d` to remove any existing partitions
- otherwise just hit `c` to create new parition
- select `p` to set new partition as primary
- `enter` to accept default
- another `enter` to accept default
- `t` to set the type 
- `c` to set fat32
- `w` to write and save the config

2. after formatting the stick, don't forget to run mkfs.vfat

```
mkfs.vfat /dev/sdb1/
```
3. just run the script as root user

```
chmod 700 mkix2fw2usb.sh
./mkix2fw2usb.sh
```

4. make sure all the folders and the files need to be owned by root user and group

```
chown -R root:root /usb_mounted_path/emctools/
ls -l /usb_mounted_path/emctools/
ls -l /usb_mounted_path/emctools/ix2-200_images/
```
5. using ix2-200d_images directory doesn't work and had to change the path to ix2-200_images

Ref #1
http://iomega.nas-central.org/wiki/Category:Ix2-200-usb-init
https://web.archive.org/web/20190401094139/iomega.nas-central.org/wiki/Category:Ix2-200-usb-init <Archive.org>

Ref #2
https://www.technopat.net/sosyal/konu/upgrading-iomega-ix2-200-to-cloud-edition.2651/

Ref #3
http://download.lenovo.com/lenovoemc/na/en/app/answers/detail/a_id/26789.html

