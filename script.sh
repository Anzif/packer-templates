sudo yum install httpd git -y
sudo git clone https://github.com/Anzif/devopsfiles.git /var/git/
sudo cp -r /var/git/* /var/www/html/
sudo chown -R apache:apache /var/www/html/
sudo service httpd restart
sudo chkconfig httpd on
