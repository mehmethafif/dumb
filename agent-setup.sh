#! /bin/bash

function install-tools {
	sudo apt-get update
	sudo apt-get install python -y
	sudo apt install python3-pip -y
	pip3 install requests
	sudo apt-get install git -y
	git clone https://github.com/jseidl/GoldenEye.git
	sudo apt-get install hping3 -y
	sudo apt-get install slowhttptest -y
	sudo apt-get install mz -y
}

function install-metricbeat {
	curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.11.1-amd64.deb
	sudo dpkg -i metricbeat-7.11.1-amd64.deb
	wget <config-url> -P /etc/metricbeat/
	sudo systemctl start metricbeat
	sudo systemctl enable metricbeat
}

install-tools
install-metricbeat

