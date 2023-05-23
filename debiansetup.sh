#! /bin/bash

####################################################################################
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░DebianSetup░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░Developed by Aarsyth░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░░░░░░░░░GitHub Repository: https://github░com/CyberOneTechnologies/░░░░░░░░░░░#
#░░░░░░░░░░░░░░░░░For support, reach out on Discord: Aarsyth#0563░░░░░░░░░░░░░░░░░░#
####################################################################################
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░█████╗░██╗░░░██╗██████╗░███████╗██████╗░░█████╗░███╗░░██╗███████╗░░░░░░░░░░░░░#
#░░░██╔══██╗╚██╗░██╔╝██╔══██╗██╔════╝██╔══██╗██╔══██╗████╗░██║██╔════╝░░░░░░░░░░░░░#
#░░░██║░░╚═╝░╚████╔╝░██████╦╝█████╗░░██████╔╝██║░░██║██╔██╗██║█████╗░░░░░░░░░░░░░░░#
#░░░██║░░██╗░░╚██╔╝░░██╔══██╗██╔══╝░░██╔══██╗██║░░██║██║╚████║██╔══╝░░░░░░░░░░░░░░░#
#░░░╚█████╔╝░░░██║░░░██████╦╝███████╗██║░░██║╚█████╔╝██║░╚███║███████╗░░░░░░░░░░░░░#
#░░░░╚════╝░░░░╚═╝░░░╚═════╝░╚══════╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝╚══════╝░░░░░░░░░░░░░#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
####################################################################################
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
####################################################################################
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░Description:░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#----------------------------------------------------------------------------------#
#░This script automates the setup process for a logging and monitoring system. It░░# 
#░prompts the user to enter the IP addresses of the logging server and the syslog░░#
#░server, as well as the SNMP community string. It then performs the following░░░░░#
#░tasks:░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░1. Creates a script named SystemUpdate.sh that updates the system packages.░░░░░░#
#░2. Makes the SystemUpdate.sh script executable.░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░3. Moves the SystemUpdate.sh script to the /usr/local/sbin directory.░░░░░░░░░░░░#
#░4. Adds a crontab job to run the SystemUpdate.sh script every Tuesday, Thursday,░#
#░░░░and Saturday at 00:30 am.░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░5. Installs the syslog-ng package for remote syslog functionality.░░░░░░░░░░░░░░░#
#░6. Configures syslog-ng to export syslogs to the logging server.░░░░░░░░░░░░░░░░░#
#░7. Restarts the syslog-ng service.░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░8. Installs the SNMP package.░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░9. Configures SNMP to send traps to the SNMP server.░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░10. Restarts the SNMP daemon.░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░Features:░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#----------------------------------------------------------------------------------#
#░- Uses color variables to enhance readability in the terminal.░░░░░░░░░░░░░░░░░░░#
#░- Prompts the user to enter the necessary information for configuring the░░░░░░░░#
#░░░logging and monitoring system.░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░- Creates and executes a script (SystemUpdate.sh) for updating system packages.░░#
#░- Sets up a cron job to automatically run the system update script at specific░░░#
#░░░intervals.░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░- Installs and configures syslog-ng for exporting syslogs to the logging server.░#
#░- Installs and configures SNMP for sending traps to the SNMP server░░░░░░░░░░░░░░#
#░- Provides feedback messages indicating the successful completion of the setup░░░#
#░░░process.░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░Let's get started!░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
#░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░#
####################################################################################



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
chmod +x SystemUpdate.sh

# Move SystemUpdate.sh to /usr/local/sbin
sudo cp SystemUpdate.sh /usr/local/sbin/SystemUpdate.sh

# Add crontab job to run SystemUpdate.sh every Tue, Thur, and Sat at 00:30 am
echo "30 0 * * 2,4,6 root /usr/local/sbin/SystemUpdate.sh" >> /etc/crontab

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
