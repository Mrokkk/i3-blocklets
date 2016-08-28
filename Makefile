.SILENT:

install:
	if [ ! -e ~/.i3blocks.conf ]; then echo "Not existing i3blocks.conf"; exit 1; fi
	echo "Creating directory for blocklets"
	mkdir -p ~/.local/share/i3blocks/
	echo "Copying blocklets"
	rsync --exclude=Makefile * ~/.local/share/i3blocks/
	line=$$(grep 'command.*share.*' ~/.i3blocks.conf);  \
	if [ -z "$$line" ]; then \
		echo "Updating i3blocks.conf"; \
		cp ~/.i3blocks.conf ~/.i3blocks.conf.old; \
		sed -i '/^command=.*$$BLOCK_NAME/ s/$$/ || ~\/\.local\/share\/i3blocks\/\$$BLOCK_NAME/' ~/.i3blocks.conf; \
	fi


uninstall:
	if [ ! -e ~/i3blocks.conf.old ]; then echo "No old i3blocks.conf"; exit 1; fi
	rm ~/.local/share/i3blocks/*
	mv ~/.i3blocks.conf.old ~/.i3blocks.conf

