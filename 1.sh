cd /tmp
git clone https://github.com/webpwnized/mutillidae
if [ $? -ne '0' ]; then
    exit 1
fi
  
if [ -d "/var/www/html/mutillidae.backup" ]; then
    sudo rm -rf /var/www/html/mutillidae.backup
fi
  
if [ -d "/var/www/html/mutillidae" ]; then
    sudo mv /var/www/html/mutillidae /var/www/html/mutillidae.backup
fi
  
sudo mkdir /var/www/html/mutillidae
sudo mv mutillidae*/* /var/www/html/mutillidae/
sudo sed -i "s/'DB_PASSWORD', 'mutillidae'/'DB_PASSWORD', ''/" /var/www/html/mutillidae/includes/database-config.inc
   
sudo chown -R www-data:www-data /var/www/html/mutillidae/
   
sudo rm -rf mutillidae*
   
cd
