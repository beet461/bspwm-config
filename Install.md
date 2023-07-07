# Install
This is a list of the basic steps needed to install arch linux **with rEFInd** on UEFI systems. 

Note: this doesn't cover how to install/set up rEFInd, which is also necessary.

## Existing OS
If there is already another installation of arch linux present you can start directly from step 3 below.

## Live USB
If there is no other linux/arch linux installation present, then use this method.

### 1. Flash iso
* Download latest arch linux iso file
* Flash it to your usb stick

### 2. Boot into usb
* Go into your computers BIOS and select boot from USB

### 3. Disk partition and format
* Make a new disk partition with the `fdisk` utility or any other disk utility
* Format it to `ext4` with `mkfs.ext4 /dev/{partition block id}`
* Replace `{partition block id}` with the block id of the newly created partition, which you can find via `fdisk -l`

### 4. Connect to wifi
* Connect to wifi with iwctl or another network utility

### 5. Install arch linux
* Mount the partition with `mount /dev/{partition block id} /mnt`
* Run `pacstrap /mnt base linux linux-firmware nano refind...` and whatever other packages you want to install from the AUR
* Generate an fstab file with `genfstab -U /mnt >> /mnt/etc/fstab`

### 6. Configure the arch system
* Run `arch-chroot /mnt` to chroot into the newly created arch system
* Enable modules like iwd etc so you can connect to wifi later

### 7. Refind entry
* Mount the EFI partition containing the bootloader into `/boot/efi` (create efi folder)
* Run `refind-install`
* Open `/etc/fstab` with an editor like nano and note down the UUID of your partition
* Open `/boot/refind_linux.conf` (should be created by refind-install) and replace the UUIDs there with the one you found in the fstab file
* This should mean there is now another entry for your new arch linux system when you go into the rEFInd boot menu

### 8. Create user/set password
* To set the root password run `passwd` and set your password
* If you want you can also create users.

### 9. Restart
* Restart and select the new entry for arch linux in the refind menu
* Login to root or a user you created
* Now you can configure the rest of the arch system!