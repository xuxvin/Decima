
Debian
====================
This directory contains files used to package decimad/decima-qt
for Debian-based Linux systems. If you compile decimad/decima-qt yourself, there are some useful files here.

## decima: URI support ##


decima-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install decima-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your decimaqt binary to `/usr/bin`
and the `../../share/pixmaps/decima128.png` to `/usr/share/pixmaps`

decima-qt.protocol (KDE)

