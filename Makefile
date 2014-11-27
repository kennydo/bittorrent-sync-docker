# Make sure this matches the port specified by EXPOSE and in the btsync.conf
BTSYNC_PORT = 7422

# The directory that will hold the btsync'd folders and btsync.conf
BTSYNC_DIR = /var/btsync/

##############################################################################

SHELL = /bin/bash

build:
	docker build --rm -t kennydo/btsync btsync-image

start:
	if [[ $$(docker ps -a | grep -E '\bbtsync\s*$$' | wc -l) = "1" ]]; \
	then \
		echo "Starting existing btsync container"; \
		docker start btsync; \
	else \
		echo "Starting new btsync container"; \
		docker run -d --name btsync -p $(BTSYNC_PORT):$(BTSYNC_PORT) -v $(BTSYNC_DIR):/btsync/ kennydo/btsync; \
	fi

stop:
	docker stop btsync
