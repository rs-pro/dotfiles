#!/bin/bash
#
# type cmd `xinput`, it shows my device X input information as follow
#
# ➜  ~ xinput
# ⎡ Virtual core pointer                      id=2    [master pointer  (3)]
# ⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
# ⎜   ↳ ETPS/2 Elantech Touchpad                  id=14   [slave  pointer  (2)]
# ⎣ Virtual core keyboard                     id=3    [master keyboard (2)]
#     ↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
#     ↳ Power Button                              id=6    [slave  keyboard (3)]
#     ↳ Asus Wireless Radio Control               id=7    [slave  keyboard (3)]
#     ↳ Video Bus                                 id=8    [slave  keyboard (3)]
#     ↳ Video Bus                                 id=9    [slave  keyboard (3)]
#     ↳ Sleep Button                              id=10   [slave  keyboard (3)]
#     ↳ ASUS USB2.0 Webcam                        id=11   [slave  keyboard (3)]
#     ↳ Asus WMI hotkeys                          id=12   [slave  keyboard (3)]
#     ↳ AT Translated Set 2 keyboard              id=13   [slave  keyboard (3)]
#
# So my touchpad's ID is 14, then use `xinput disable 14` and `xinput enable 14` for toggling~
#
# Following bash script is referred to this askubuntu question:
# http://askubuntu.com/questions/751413/how-to-disable-enable-toggle-touchpad-in-a-dell-laptop
# https://gist.github.com/iamkissg/50513b294c65dd20a82a807a85b58f7a

if xinput list-props 13 | grep "Device Enabled (187):.*1" >/dev/null
then
    xinput disable 13
    notify-send -u low -i mouse "Trackpad disabled"
else
    xinput enable 13
    notify-send -u low -i mouse "Trackpad enabled"
fi
