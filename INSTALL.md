# OS Installation

## 1. Live disk

Boot up a live disk and delete `root` and `swap` partition.
Remove grub boot record from `EFI` partition

## 2. Debian installation

Launch debian-disk and procede with normal installation
Make a new `root` and `swap` partition from free space

## 3. Root installation

Make shivkar2n a sudouser

```bash
	usermod -aG sudo shivkar2n
```

## 4. Connection to internet

Connection to wifi using following commands

Create a file `wpa_supplicant.conf` in `/etc/wpa_supplicant`

```bash
	touch /etc/wpa_supplicant/wpa_supplicant.conf
```

Add following contents to `wpa_supplicant.conf`

```bash
	network={
		ssid="Redmi5Plus"
		psk="Krishnapriya2020"
	}
```

Connect to wifi and Get ip address from network, then install network manager

```bash
	dhclient wlp0s20f3
	sudo apt install network-manager-gnome
```

## 5. i3-gaps Installation

Install `git` and then clone and build `i3-gaps` with this [script](https://github.com/maestrogerardo/i3-gaps-deb)

## 6. Install packages

Install packages for system, refer to packages [list](obsidian://open?vault=Obsidian%20Vault&file=Linux%20Packages)
Remember to install flatpak packages with flag `--user`

## 7. Mount home directory into root

Change `fstab` file and mount `/home` directory refer to this [article](https://www.tecmint.com/move-home-directory-to-new-partition-disk-in-linux/)

## 8. Update lockscreen, grub bootloader

Update the [grub bootloader theme](https://github.com/vinceliuice/grub2-themes) and [sddm theme](https://www.opencode.net/phob1an/card)
Remove annoying beep sound, edit `/etc/inputrc`

```bash
	set bell-style none
```

Add the following to `.zshrc`

```
if [ -n "$DISPLAY" ]; then
  xset b off
fi
```

To check bell settings in Xorg execute command:
`xset q | grep bell`

## 9. Extra configuration
Set default terminal to [kitty](https://www.how2shout.com/linux/how-to-set-kitty-as-default-terminal-in-ubuntu-22-04-or-20-04/)
Set mime-types accordingly in `~/.config/mimeapps.list`

## Bugs
- Sometimes `i3-resurrect` may not work with ulauncher as it is installed locally
- Make sure to disable beep sound
