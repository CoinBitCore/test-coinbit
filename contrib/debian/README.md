
Debian
====================
This directory contains files used to package coinbitd/coinbit-qt
for Debian-based Linux systems. If you compile coinbitd/coinbit-qt yourself, there are some useful files here.

## coinbit: URI support ##


coinbit-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install coinbit-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your coinbit-qt binary to `/usr/bin`
and the `../../share/pixmaps/coinbit128.png` to `/usr/share/pixmaps`

coinbit-qt.protocol (KDE)

