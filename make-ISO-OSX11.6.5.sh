#!/usr/bin/env bash
#===========================================================================
# Works only with the official image available in the Mac App Store.
# Make sure you download the official installer before running this script.
# Create OS X 11.6.5 BigSur ISO
#===========================================================================

# Change this at your desire. Sometimes this works out of the box, sometimes not.
# Default size: ~13.5 GB
DISK_SIZE="13000m"

#===========================================================================

hdiutil create -o /tmp/BigSur.cdr -size $DISK_SIZE -layout SPUD -fs HFS+J

hdiutil attach /tmp/BigSur.cdr.dmg -noverify -mountpoint /Volumes/install_build

sudo "/Applications/Install macOS Big Sur.app/Contents/Resources/createinstallmedia"  --volume /Volumes/install_build --nointeraction

hdiutil detach "/Volumes/Shared Support 1"

hdiutil detach "/Volumes/Shared Support"

hdiutil detach "/Volumes/Install macOS Big Sur"

hdiutil convert /tmp/BigSur.cdr.dmg -format UDTO -o /tmp/BigSur.iso

mv /tmp/BigSur.iso.cdr ~/Desktop/BigSur.iso

rm /tmp/BigSur.cdr.dmg
