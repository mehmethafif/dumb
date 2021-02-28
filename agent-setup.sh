#! /bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
FAIL=0
install-tools() {
	echo -e "${GREEN}## apt-get update ${NC}"
	sudo apt-get update || FAIL=1
	echo -e "${GREEN}## installing python ${NC}"
	sudo apt-get install python -y || FAIL=1
	echo -e "${GREEN}## installing python3-pip ${NC}"
	sudo apt install python3-pip -y || FAIL=1
	echo -e "${GREEN}## installing python requests ${NC}"
	pip3 install requests || FAIL=1
	echo -e "${GREEN}## installing git ${NC}"
	sudo apt-get install git -y || FAIL=1
	echo -e "${GREEN}## installing GoldenEye ${NC}"
	git clone https://github.com/jseidl/GoldenEye.git || FAIL=1
	echo -e "${GREEN}## installing hping3 ${NC}"
	sudo apt-get install hping3 -y || FAIL=1
	echo -e "${GREEN}## installing slowhttptest ${NC}"
	sudo apt-get install slowhttptest -y || FAIL=1
	echo -e "${GREEN}## installing mz ${NC}"
	sudo apt-get install mz -y || FAIL=1
}

install-metricbeat() {
	echo -e "${GREEN}## downloading metricbeat ${NC}"
	curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.11.1-amd64.deb || FAIL=1
	echo -e "${GREEN}## installing metricbeat ${NC}"
	sudo dpkg -i metricbeat-7.11.1-amd64.deb || FAIL=1
	echo -e "${GREEN}## downloading metricbeat configuration file ${NC}"
	wget https://raw.githubusercontent.com/mehmethafif/dumb/main/metricbeat.yml -P /etc/metricbeat/ || FAIL=1
	echo -e "${GREEN}## starting metricbeat service ${NC}"
	sudo systemctl start metricbeat || FAIL=1
	sudo systemctl enable metricbeat || FAIL=1
}

install-tools
install-metricbeat

if [ $FAIL -eq 0 ]
then
	touch setup-success
else
	touch setup-fail
fi