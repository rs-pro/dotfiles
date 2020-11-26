
## Basic info

Fish Shell, i3, neovim

## How to use

You probably can't clone it as your ~ is not empty. Do this instead:

```
# Step 0: backup your ~ directory (!)
cd ~
git init
git remote add origin git@github.com:rs-pro/dotfiles.git
git pull origin master
# delete any files git complains about and repeat until previous command succeeds
git branch --set-upstream-to=origin/master master
git pull
```
## Expected packages

(adjust as you need)

```
pacman -S pkgfile gparted firefox gimp whois react-native-debugger atom zip unzip paprefs smplayer-themes smplayer-skins smtube youtube-dl mplayer smplayer bluez bluez-utils usbutils alsa-utils mpg123 imlib2 libcdio libcddb deadbeef unarchiver unrar kimageformats kipi-plugins kamera gwenview kio-extras discord the_silver_searcher nodejs go npm ruby python2 python docker samba flameshot xscreensaver libreoffice-fresh yarn dbeaver memcached redis elasticsearch postgresql xfce4-notifyd blueman wget telegram-desktop breeze-icons ark scite kate krename kdiff3 p7zip gnome-keyring neovim-qt dmenu xorg-xsetroot binutils os-prober zsh fish xorg-xrdb nvidia nvidia-settings rxvt-unicode urxvt-perls i3-wm git vim neovim mc tmux

pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S xkb-switch spotify android-studio pa-applet-git skypeforlinux-stable-bin j4-dmenu-desktop
```
