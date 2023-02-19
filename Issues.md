# Problems
These are some problems I ran into while configuring bspwm, so I wrote down the solutions in case I need them in the future

rofi error setting locale:
	in /etc/profile add a line saying export LC_ALL=C

picom kawase blur not working:
	change backend to glx in picom.conf

rofi power menu doesnt have permissions:
	do 'sudo EDITOR=nano visudo'
	add somewhere the line: '(username) ALL=(ALL:ALL) NOPASSWD: (path to power-menu script)'
	replace (username) with your username
	in powermenu script go to the run_cmd function and change all the necessary commands to have sudo in front of them

startup taking too long due to time out for waiting for wlp1s0(or any other network interface name like wlan0 etc):
	delete the file entry from /sys/class/net
	for example: sudo rm /sys/class/net/wlp1s0

rofi lock button doesnt do anything
	install i3lock

audio adjustment doesnt work
	install alsa-util, alsa-firmware, and sof-firmware
	use command 'amixer set Master 5%{+or-}'
	also install pulseaudio and set the volume of speaker (last card in gui) at 100% (amixer cannot go farther) 
	this is so that you can adjust volume with amixer all the way up to 100%, since it takes 5% of the current audio level 
	and cannot go past the audio level that was set before using amixer	

change icons in polybar config/use icons from fonts such as feathers in text form:
	install fontmatrix and select the font you need and copy the icon you need

change individual application icon:
	go to /usr/share/applications
	find the .desktop file of the application
	open the file and change the icon
	if you want to add a custom icon change the icon variable value to the path to the icon

bluetooth error "br-connect-profile unavailable" or something:
	go to /etc/bluetooth/main.conf
	change ControllerMode to bredr
	install pulseaudio-bluetooth
	restart
	trust the device in bluetoothctl
	connect to the device

spotify firewall error:
	remove the spotify app (yay -R)
	delete .config/spotify
	reinstall spotify (cleanbuild)

installed a group and want to remove unused packages/applications:
	yay -Rsu {group name(s)}
	for example:
	you have installed yay -Syu xorg plasma plasma-wayland-session kde-applications
	to remove unused packages do the same command but with yay -Rsu	

thunar theme doesnt change:
	install a theme and select it in the first panel that shows up (it shows raleigh by default)

trouble finding a suitable file manager theme:
	install thunar and lxappearance
	install materia transparent theme (aur)
	select the materia theme in lxappearance
	optional: install windows icons	
