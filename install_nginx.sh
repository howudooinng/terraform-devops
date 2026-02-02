#!/bin/bash

sudo apt-get update
sudo apt-get install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1> Terraform in one shot </h1>" | sudo tee /var/www/html/index.html