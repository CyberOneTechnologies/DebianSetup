#! /bin/bash


#
#	░█████╗░██╗░░░██╗██████╗░███████╗██████╗░░█████╗░███╗░░██╗███████╗
#	██╔══██╗╚██╗░██╔╝██╔══██╗██╔════╝██╔══██╗██╔══██╗████╗░██║██╔════╝
#	██║░░╚═╝░╚████╔╝░██████╦╝█████╗░░██████╔╝██║░░██║██╔██╗██║█████╗░░
#	██║░░██╗░░╚██╔╝░░██╔══██╗██╔══╝░░██╔══██╗██║░░██║██║╚████║██╔══╝░░
#	╚█████╔╝░░░██║░░░██████╦╝███████╗██║░░██║╚█████╔╝██║░╚███║███████╗
#	░╚════╝░░░░╚═╝░░░╚═════╝░╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝╚══════╝
#


# Set color variables for better readability
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
reverse=$(tput rev)
bold=$(tput bold)
reset=$(tput sgr0)

# Prompt for IP Address of the Logging Server
read -p "${yellow}Enter IP Address of the Logging Server: ${reset}" logging_server_ip

# Prompt for IP Address of the Syslog server
read -p "${yellow}Enter IP Address of the Syslog server: ${reset}" syslog_server_ip

# Prompt for SNMP Community String
read -p "${yellow}Enter SNMP Community String: ${reset}" snmp_community

# Create SystemUpdate.sh script
cat > SystemUpdate.sh <<EOF
#!/bin/bash
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
EOF

# Make SystemUpdate.sh executable
sudo chmod +x SystemUpdate.sh

# Move SystemUpdate.sh to /usr/local/sbin
sudo mv -p SystemUpdate.sh /usr/local/sbin/SystemUpdate.sh

# Add crontab job to run SystemUpdate.sh every Tue, Thur, and Sat at 00:30 am
(crontab -l 2>/dev/null; echo "30 0 * * 2,4,6 /usr/local/sbin/SystemUpdate.sh") | crontab -

# Install necessary packages for remote syslog tool
echo "${green}${bold}Installing syslog-ng...${reset}"
sudo apt-get update
sudo apt-get install -y syslog-ng

# Configure syslog-ng to export syslogs to the Logging Server
echo "${green}${bold}Configuring syslog-ng...${reset}"
sudo sed -i "s|destination d_syslog {.*|destination d_syslog { tcp(\"$logging_server_ip\"); };|g" /etc/syslog-ng/syslog-ng.conf
sudo systemctl restart syslog-ng

# Install necessary packages for SNMP
echo "${green}${bold}Installing SNMP...${reset}"
sudo apt-get install -y snmp snmpd

# Configure SNMP to send traps to the SNMP server
echo "${green}${bold}Configuring SNMP...${reset}"
sudo sed -i "s|agentAddress udp:127.0.0.1:161|#agentAddress udp:127.0.0.1:161|g" /etc/snmp/snmpd.conf
echo "trapsink $syslog_server_ip $snmp_community" | sudo tee -a /etc/snmp/snmpd.conf
sudo systemctl restart snmpd

echo "${green}${bold}Setup completed successfully!${reset}"
