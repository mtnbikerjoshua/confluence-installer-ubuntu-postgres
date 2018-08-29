echo "Updating..."
apt-get update
echo "Installing database..."
apt-get install postgresql-10
read -p "Please choose a password for your confluence database: " postgresPass
echo "Configuring database..."
runuser -l postgres -c "createuser confluenceuser"
runuser -l postgres -c "createdb -O confluenceuser confluencedb"
runuser -l postgres -c "psql -U postgres -c \"ALTER USER confluenceuser WITH ENCRYPTED PASSWORD '$postgresPass'\""
echo "Downloading Confluence installer..."
wget "https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-6.10.0-x64.bin"
sudo chmod 555 atlassian-confluence-6.10.0-x64.bin
./atlassian-confluence-6.10.0-x64.bin
rm atlassian-confluence-6.10.0-x64.bin
echo "You should now type <yourserverip>:8090 in your browser's address bar and set up confluence. When you get to the \"Set up your database\" step, choose \"My own database\" and then enter the following options:"
echo "Database type: PostgreSQL"
echo "Setup type: Simple"
echo "Hostname: localhost"
echo "Port: 5432"
echo "Database name: confluencedb"
echo "Username: confluenceuser"
echo "Password: " $postgresPass
