#!/bin/bash

mkdir /backups
BACKUP_DIR="/backups"
LOG_FILE="/backups/backup_verification.log"

echo "Checking installed web servers..."

# Check Apache
if rpm -q httpd >/dev/null 2>&1
then
    echo "Apache already installed"
    APACHE_INSTALLED=true
else
    echo "Apache not installed. Installing..."
    sudo dnf install -y httpd
    sudo systemctl enable httpd
    sudo systemctl start httpd
    APACHE_INSTALLED=true
fi

# Check Nginx
if rpm -q nginx >/dev/null 2>&1
then
    echo "Nginx already installed"
    NGINX_INSTALLED=true
else
    echo "Nginx not installed. Installing..."
    sudo dnf install -y nginx
    sudo sed -i 's/listen 80;/listen 8080;/g' /etc/nginx/nginx.conf
    sudo sed -i 's/listen \[::\]:80;/listen [::]:8080;/g' /etc/nginx/nginx.conf
    sudo nginx -t
    sudo systemctl enable nginx
    sudo systemctl restart nginx

    NGINX_INSTALLED=true
fi

echo "Creating backup directory..."
sudo mkdir -p $BACKUP_DIR

# Create Apache Backup Script
cat << 'EOF' | sudo tee /usr/local/bin/apache_backup.sh
#!/bin/bash

DATE=$(date +%F)
BACKUP_FILE="/backups/apache_backup_$DATE.tar.gz"

tar -czf $BACKUP_FILE /etc/httpd /var/www/html

echo "Verifying Apache backup..."
tar -tzf $BACKUP_FILE >> /backups/backup_verification.log
EOF

# Create Nginx Backup Script
cat << 'EOF' | sudo tee /usr/local/bin/nginx_backup.sh
#!/bin/bash

DATE=$(date +%F)
BACKUP_FILE="/backups/nginx_backup_$DATE.tar.gz"

tar -czf $BACKUP_FILE /etc/nginx /usr/share/nginx/html

echo "Verifying Nginx backup..."
tar -tzf $BACKUP_FILE >> /backups/backup_verification.log
EOF

sudo chmod +x /usr/local/bin/apache_backup.sh
sudo chmod +x /usr/local/bin/nginx_backup.sh

echo "Backup scripts created."

echo "Setup completed."
