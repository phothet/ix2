ifw=/home/phothet/Downloads/ix2-200-3.2.14.30167.tgz
ofw=${ifw%.tgz}-decrypted.tar.gz
ix2=${ifw%.tgz}-files
usb=/mnt/test

mkdir -p $ix2/images
mkdir -p $ix2/update
mkdir -p $ix2/apps

openssl enc -d -aes-128-cbc -in $ifw -k "EMCNTGSOHO" -out $ofw
tar xzvf $ofw -C $ix2/update/

imgs=$(find $ix2/update/)
for img in ${imgs} ; do
	if [ -f $img.md5 ] ; then
	  mv $img $ix2/images/
		mv $img.md5 $ix2/images/
	fi
done

mount -o loop,ro $ix2/images/apps $ix2/apps
cp -p $ix2/apps/usr/local/cfg/config.gz $ix2/images/
umount $ix2/apps
gunzip $ix2/images/config.gz

img=$ix2/images/config
md5=$(md5sum $img)
md5=${md5% *}
md5=${md5% }
echo "$md5" > $img.md5

cd $ix2/images/
tar czvf ../ix2-boot.tgz *
			
# ix2-200d_images doesn't work
# https://www.technopat.net/sosyal/konu/upgrading-iomega-ix2-200-to-cloud-edition.2651/
mkdir -p $usb/emctools/ix2-200_images/
cp $ix2/ix2-boot.tgz $usb/emctools/ix2-200_images/
