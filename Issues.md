# Problems
These are some problems I ran into while configuring bspwm, so I wrote down the solutions in case I need them in the future

### bluetooth/other similar hardware issues
* in windows disable fast startup (control panel -> hardware options)
* then make sure you shut down every time after using windows **not restart**

### rofi error setting locale: ###
* in `/etc/profile` add a line saying `export LC_ALL=C`

### picom kawase blur not working: ###
* change `backend` to `glx` in picom.conf

### rofi power menu doesnt have permissions: ###
* do `sudo EDITOR=nano visudo`
* add somewhere the line: `(username) ALL=(ALL:ALL) NOPASSWD: (path to power-menu script)`
* replace (username) with your username
* in powermenu script go to the `run_cmd` function and change all the necessary commands to have `sudo` in front of them

### startup taking too long due to time out for waiting for a network interface (eg wlp1s0): ###
* delete the file entry from `/sys/class/net`
* for example: `sudo rm /sys/class/net/wlp1s0`

### audio adjustment doesnt work ###
* install `alsa-util`, `alsa-firmware`, and `sof-firmware`
* use command `amixer set Master 5%{+or-}`
* also install `pulseaudio` and set the volume of speaker at 100% before adjusting with keys 	

### change icons in polybar config/use icons in text form: ###
* install `fontmatrix` and select the font you need and copy the icon you need

### change individual application icon: ###
* go to `/usr/share/applications`
* find the `.desktop` file of the application
* open the file and change the icon
* if you want to add a custom icon change the icon variable value to the path to the icon

### bluetooth error "br-connect-profile unavailable" or something: ###
* go to `/etc/bluetooth/main.conf`
* change `ControllerMode` to `bredr`
* install `pulseaudio-bluetooth`
* restart
* trust the device with `bluetoothctl`
* connect to the device

### spotify firewall error: ###
* remove the spotify app `yay -R spotify`
* delete `.config/spotify`
* reinstall spotify (cleanbuild)

### installed a group and want to remove unused packages/applications: ###
* `yay -Rsu {group name}`
* for example:
* `yay -Syu xorg`
* to remove unused package from the xorg group: `yay -Rsu xorg`

### thunar theme doesnt change: ###
* install the materia dark theme and select it in the first panel of lxappearance

### touchpad scrolling is reversed
* create/open /etc/X11/xorg.conf.d/30-touchpad.conf
* ``` 
  Section "InputClass"
    Identifier "touchpad"
    MatchIsTouchpad "on"
    Driver "libinput"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
  EndSection
  ```
* paste the above into it and logout/login

### firefox transparency on tabs
* set up a transparent theme like materia and enable it in lxappearance
* enable a theme and then press disable

### wifi is not stable/working properly
* install networkmanager (use hotspot if necessary)
* connect with `nmcli device wifi connect SSID password PASSWORD`
* it should work

### iwctl says NetworkConfigurationEnabled: Disabled
* edit `/etc/iwd/main.conf` to include the line `EnableNetworkConfiguration=true`
* if there is no `main.conf` create one and copy the following:
* ```
  [General]
  EnableNetworkConfiguration=true
  ```

### Refind issue (invalid loader):
* chroot into new arch system and mount efi partition on there, then run refind-install
* go into refind_linux.conf (in /boot on new arch system) and change the UUIDs to the one found in /etc/fstab
(on new arch system)

### Messaged about sof-firmware issues during startup (terminal arch)
* install `sof-firmware` from the aur

### Speakers not detected / pulseaudio not working properly ###
* delete `.config/pulse`
* reboot

### firefox time is not correct ###
* enable ntp service
* `sudo timedatectl set-ntp true`

### laptop speaker disappears from outputs in pavucontrol ###
* go to configuration and choose different profile with speaker in it
