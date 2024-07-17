# How to use:
We need to unpack, customize and rebuild the debian images to have a fully automated installation

./unpack   | creates the work environment from a debian-installer.iso <br>
./install  | copies custom grub config to the build environment <br>
./build    | builds the new installer debian-preseed.iso <br>
./generate | runs the previous three commands to do everything, useful for updating the installer images

# Customizing entries
edit the custom/boot/grub/grub.cfg 
### Change the menu entries
```
menuentry --hotkey=d 'Default' {
    set background_color=black
    linux    /install.amd/vmlinuz vga=788 --- quiet auto=true priority=critical preseed/url=https://github.url/preseedfile
    initrd   /install.amd/initrd.gz
}
```
#### For Ex.
```
menuentry --hotkey=d 'Default' {
    set background_color=black
    linux    /install.amd/vmlinuz vga=788 --- quiet auto=true priority=critical preseed/url=https://raw.githubusercontent.com/kylernocturnalnerd/preseed/master/preseeds/default.cfg
    initrd   /install.amd/initrd.gz
}
```

# Preseed Files
All go inside the preseed folder
Can make as many as you like for different things
### For ex.
./preseed/default.cfg - This preseed was given the above grub menu entry but I can create a second:

./preseed/with-vim.cfg - That contains an installer that auto installs vim
then create another entry:
```
menuentry --hotkey=v 'vim' {
    set background_color=black
    linux    /install.amd/vmlinuz vga=788 --- quiet auto=true priority=critical preseed/url=https://raw.githubusercontent.com/kylernocturnalnerd/preseed/master/preseeds/with-vim.cfg
    initrd   /install.amd/initrd.gz
}
```