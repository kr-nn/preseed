debian_name="Debian 12.6.0 amd64 n" # change name if image name changes
orig_iso="./debian-installer.iso"
new_files="./debian-installer-build"
new_iso="./debian-preseed.iso"
mbr_template=isohdpfx.bin
dd if="$orig_iso" bs=1 count=432 of="$mbr_template"

# check and make sure the xorriso command hasn't changed between image versions
xorriso -as mkisofs \
   -r -V $debian_name \
   -o "$new_iso" \
   -J -J -joliet-long -cache-inodes \
   -isohybrid-mbr "$mbr_template" \
   -b isolinux/isolinux.bin \
   -c isolinux/boot.cat \
   -boot-load-size 4 -boot-info-table -no-emul-boot \
   -eltorito-alt-boot \
   -e boot/grub/efi.img \
   -no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus \
   "$new_files"
