#!/usr/bin/env bash
#===========================================================================
# Works only with the official image available in the Mac App Store.
# Make sure you download the official installer before running this script.
#===========================================================================

hdiutil create -o /tmp/Catalina.cdr -size 9000m -layout SPUD -fs HFS+J
hdiutil attach /tmp/Catalina.cdr.dmg -noverify -mountpoint /Volumes/install_build
sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia  --volume /Volumes/install_build --nointeraction
hdiutil detach "/Volumes/Install macOS Catalina"
hdiutil convert /tmp/Catalina.cdr.dmg -format UDTO -o /tmp/Catalina.iso
mv /tmp/Catalina.iso.cdr ~/Desktop/Catalina.iso
rm /tmp/Catalina.cdr.dmg
