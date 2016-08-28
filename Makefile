.SILENT:

install:
	echo "Creating directory for blocklets"
	mkdir -p ~/.local/share/i3blocks/
	echo "Copying blocklets"
	rsync --exclude=Makefile * ~/.local/share/i3blocks/

uninstall:
	rm ~/.local/share/i3blocks/*

