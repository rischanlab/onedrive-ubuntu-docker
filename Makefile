PROJECT_ID := onedrive

SHELL := /bin/bash

# ----------------------------------------------------------------------------
#    P R O D U C T I O N     C O M M A N D S
# ----------------------------------------------------------------------------
run: build permissions

deploy: run 
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Bringing up fresh instance "
	@echo "------------------------------------------------------------------"

build:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Building in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) build data

permissions:
	# Probably we want something more granular here....
	# Your sudo password will be needed to set the file permissions
	# on logs, media, static and pg dirs
	@if [ ! -d "logs" ]; then mkdir logs; fi
	@if [ ! -d "onedrive" ]; then mkdir onedrive; fi
	@if [ ! -d "data" ]; then mkdir data; fi
	@if [ -d "logs" ]; then sudo chmod -R a+rwx logs; fi
	@if [ -d "onedrive" ]; then sudo chmod -R a+rwx onedrive; fi
	@if [ -d "data" ]; then sudo chmod -R a+rwx data; fi

up:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Running data continer"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) up -d data

kill:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Killing in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) kill

rm: kill
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Removing production instance!!! "
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) rm

logs:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Showing data logs in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) logs data

shell:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Shelling in in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) run data /bin/bash

configure:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Configure onedrive setting"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) run data onedrive-pref

run_daemon:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Running Onedrive daemon"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) run data onedrive-d start