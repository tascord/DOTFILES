#!/bin/sh
set -e
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
echo "Setting up Noto Emoji font..."
# 1 - install  noto-fonts-emoji package
pacman -S noto-fonts-emoji --needed
# 2 - add font config to /etc/fonts/conf.d/01-notosans.conf
echo "<?xml version=\"1.0\" ?>
<!DOCTYPE fontconfig SYSTEM \"fonts.dtd\">
<fontconfig>
  <match target=\"scan\">
    <test name=\"family\">
      <string>Noto Color Emoji</string>
    </test>
    <edit name=\"scalable\" mode=\"assign\">
      <bool>true</bool>
    </edit>
    <edit name=\"pixelsize\" mode=\"assign\">
      <double>17</double>
    </edit>
  </match>

  <match target=\"pattern\">
    <test name=\"prgname\">
      <string>chrome</string>
    </test>
    <edit name=\"family\" mode=\"prepend_first\">
      <string>Noto Color Emoji</string>
    </edit>
  </match>
</fontconfig>
" > /etc/fonts/conf.d/01-notosans.conf
# 3 - update font cache via fc-cache
fc-cache
echo "Noto Emoji Font installed! You may need to restart applications like chrome. If chrome displays no symbols or no letters, run the following commands:"
echo "sudo mv /etc/fonts/conf.d/01-notosans.conf /etc/fonts/conf.d/58-notosans.conf"
echo "fc-cache"
echo "If it still wont work, locate the number prefix for the font you are currently using as system font and change the notosans to one after it."

