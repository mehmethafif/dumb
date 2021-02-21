#! /bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
function install-tools {
	echo -e "${GREEN}## apt-get update ${NC}"
	sudo apt-get update
	echo -e "${GREEN}## installing python ${NC}"
	sudo apt-get install python -y
	echo -e "${GREEN}## installing python3-pip ${NC}"
	sudo apt install python3-pip -y
	echo -e "${GREEN}## installing python requests ${NC}"
	pip3 install requests
	echo -e "${GREEN}## installing git ${NC}"
	sudo apt-get install git -y
	echo -e "${GREEN}## installing GoldenEye ${NC}"
	git clone https://github.com/jseidl/GoldenEye.git
	echo -e "${GREEN}## installing hping3 ${NC}"
	sudo apt-get install hping3 -y
	echo -e "${GREEN}## installing slowhttptest ${NC}"
	sudo apt-get install slowhttptest -y
	echo -e "${GREEN}## installing mz ${NC}"
	sudo apt-get install mz -y
}

function install-metricbeat {
	echo -e "${GREEN}## downloading metricbeat ${NC}"
	curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.11.1-amd64.deb
	echo -e "${GREEN}## installing metricbeat ${NC}"
	sudo dpkg -i metricbeat-7.11.1-amd64.deb
	echo -e "${GREEN}## downloading metricbeat configuration file ${NC}"
	wget <config-url> -P /etc/metricbeat/
	echo -e "${GREEN}## starting metricbeat service ${NC}"
	sudo systemctl start metricbeat
	sudo systemctl enable metricbeat
}

install-tools
install-metricbeat

