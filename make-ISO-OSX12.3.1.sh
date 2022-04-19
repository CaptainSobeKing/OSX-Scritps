#!/usr/bin/env bash
#===========================================================================
# Works only with the official image available in the Mac App Store.
# Make sure you download the official installer before running this script.
# Create OS X 12.3.1 Monterey ISO
#===========================================================================

# Change this at your desire. Sometimes this works out of the box, sometimes not.
# Default size: ~16 GB
DISK_SIZE="15361m"

#===========================================================================

hdiutil create -o /tmp/Monterey.cdr -size $DISK_SIZE -layout SPUD -fs HFS+J

hdiutil attach /tmp/Monterey.cdr.dmg -noverify -mountpoint /Volumes/install_build

sudo "/Applications/Install macOS Monterey.app/Contents/Resources/createinstallmedia"  --volume /Volumes/install_build --nointeraction

hdiutil detach "/Volumes/Shared Support 1"

hdiutil detach "/Volumes/Shared Support"

hdiutil detach "/Volumes/Install macOS Monterey"

hdiutil convert /tmp/Monterey.cdr.dmg -format UDTO -o /tmp/Monterey.iso

mv /tmp/Monterey.iso.cdr ~/Desktop/Monterey.iso

rm /tmp/Monterey.cdr.dmg
