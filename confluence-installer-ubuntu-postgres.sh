apt-get update
apt-get install postgresql-10
su - postgres
createuser confluenceuser
createdb -O confluenceuser confluencedb
