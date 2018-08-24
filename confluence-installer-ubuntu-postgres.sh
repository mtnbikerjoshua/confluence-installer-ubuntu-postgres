apt-get update
apt-get install postgresql-10
read -p "Please choose a password for your confluence database: " postgresPass
runuser -l postgres -c "createuser confluenceuser"
runuser -l postgres -c "createdb -O confluenceuser confluencedb"
runuser -l postgres -c "psql -U postgres -c \"ALTER USER confluenceuser WITH ENCRYPTED PASSWORD '" + postgresPass +"'\""
echo "Downloading Confluence installer..."
wget "https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.10.0-x64.bin"
sudo chmod 555 atlassian-confluence-6.10.0-x64.bin
./atlassian-confluence-6.10.0-x64.bin
rm atlassian-confluence-6.10.0-x64.bin
