# Bash Script for System Setup

## Description
This script automates the setup process for a logging and monitoring system. It prompts the user to enter the IP addresses of the logging server and the syslog server, as well as the SNMP community string. It then performs the following tasks:

- Creates a script named **'SystemUpdate.sh'** that updates the system packages.
- Makes the **'SystemUpdate.sh'** script executable.
- Moves the **'SystemUpdate.sh'** script to the **'/usr/local/sbin directory'**.
- Adds a crontab job to run the **'SystemUpdate.sh'** script every Tuesday, Thursday, and Saturday at 00:30 am.
- Installs the syslog-ng package for remote syslog functionality.
- Configures syslog-ng to export syslogs to the logging server.
- Restarts the syslog-ng service.
- Installs the SNMP package.
- Configures SNMP to send traps to the SNMP server.
- Restarts the SNMP daemon.

## Features
- Uses color variables to enhance readability in the terminal.
- Prompts the user to enter the necessary information for configuring the logging and monitoring system.
- Creates and executes a script (SystemUpdate.sh) for updating system packages.
- Sets up a cron job to automatically run the system update script at specific intervals.
- Installs and configures syslog-ng for exporting syslogs to the logging server.
- Installs and configures SNMP for sending traps to the SNMP server.
- Provides feedback messages indicating the successful completion of the setup process.

## Installation

To install and run the script on your system, follow these steps:

**Clone the repository to your local machine:**

```
git clone https://github.com/CyberOneTechnologies/DebianSetup.git
```

**Navigate to the cloned directory:**

```
cd DebianSetup
```

**Make the script file executable:**

```
chmod +x debiansetup.sh
```


**Run the script with root privileges:**

```
sudo ./debiansetup.sh
```


## Troubleshooting
If you encounter any issues during the installation or setup process, try the following troubleshooting steps:

**1. Permission Denied:** If you receive a "Permission denied" error when running the script, ensure that you have the necessary permissions to execute the script. You can try running it with the sudo command.

**2. Package Installation:** If the script fails to install necessary packages, make sure you have an active internet connection and that the package repositories are properly configured.

**3. Crontab Job:** If the crontab job for the system updates doesn't run as expected, verify that the cron service is running and that the job is correctly added to the crontab file. You can check the cron logs for any error messages.

**4. Syslog Configuration:** If the syslog configuration fails, double-check the IP address of the syslog server and ensure that the necessary syslog-ng package is installed. You can also check the syslog-ng logs for any error messages.

**5. SNMP Configuration:** If the SNMP configuration doesn't work, verify that the SNMP community string and SNMP server IP address are correct. Check the SNMP configuration file and restart the SNMP service.

If the issue persists, feel free to open an issue on GitHub, providing detailed information about the problem you encountered.

## License
This project is licensed under the MIT License.


This README.md file provides an overview of the script, instructions for install
