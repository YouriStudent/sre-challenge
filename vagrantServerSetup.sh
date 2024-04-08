#!/bin/bash

# Update package lists
sudo apt-get update
# Upgrade the system so it is up to date
sudo apt-get upgrade

# Install required packages
sudo apt-get install -y python3-pip python3-venv git

# Clone the application to the server
git clone -b dev $GIT_URL /home/vagrant/application/

# Create a new virtual environment
python3 -m venv env

# Activate the virtual environment
source env/bin/activate

# Install Flask and other dependencies
pip install -r /home/vagrant/application/requirements.txt

# Create a Gunicorn systemd service file
sudo sh -c "cat << EOF > /etc/systemd/system/flask.service
[Unit]
Description=Flask Application
After=network.target

[Service]
User=vagrant
WorkingDirectory=/home/vagrant/application/app
ExecStart=/home/vagrant/env/bin/gunicorn --bind 0.0.0.0:5000 application:app
EnvironmentFile=/home/vagrant/.env
Restart=always

[Install]
WantedBy=multi-user.target
EOF"

# Enable and start the Flask service
sudo systemctl enable flask
sudo systemctl start flask

# Open the firewall port
sudo ufw allow 5000/tcp

echo "Flask application deployed and running on http://localhost:5000"