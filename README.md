# LinuxAssignment

1st - Run this script file- **install_monitoring_tools.sh** to install monitoring tools on the linux machine (as I am using RHEL systems so i am using RHEL commands also this file required run via sudo or root)

2nd - Run this script file - **monitor.sh** to store the CPU and Memory usage, Disk usage, Top Processes to **monitor.log** at your home directory. 

3rd - Run this script file - **monitor2.sh** to check CPU, Memory via HTOP & NMON command - It will take user input and load commands of those Software.

4th - Run this script file - **user_setup.sh** to Creating users Sarah and Mike, Create workspace directories, Set ownership, Set folder permissions to user only, Set password expiry policy to 30 days and check its is set or not.

5th - Run this script file - **password_policy.sh** to set password policy.

6th - Run this script file - **setup_web_backup.sh**  to install Apache web server and Nginx services, enable services, start services, change Nginx Port to 8080, Creating backup directory, Create BACKUP_FILE to = "/backups/"

7th - Run this command to schedule backups - 
sudo crontab -e
add to 
0 0 * * 2 /usr/local/bin/apache_backup.sh
5 0 * * 2 /usr/local/bin/nginx_backup.sh
save and exit
