apt-get update
apt-get install postgresql-10
runuser -l postgres -c "createuser confluenceuser"
runuser -l postgres -c "createdb -O confluenceuser confluencedb"
runuser -l postgres -c "psql -U postgres -c \"ALTER USER confluenceuser WITH ENCRYPTED PASSWORD '69j50Ae@'\""
echo "Downloading Confluence installer..."
wget "https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.10.0-x64.bin"
sudo chmod 555 atlassian-confluence-6.10.0-x64.bin
./atlassian-confluence-6.10.0-x64.bin
rm atlassian-confluence-6.10.0-x64.bin
