# 1. Install the latest version of Postgres
# If you're using the default version available on Ubuntu, you can just upgrade to the latest postgres by running the following:

sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql-9.6 postgresql-contrib-9.6 postgresql-common


# Otherwise if you want to upgrade to the very latest Postgres version, you can follow the instructions on their website here: https://www.postgresql.org/download/linux/ubuntu/

# To find the installed versions that you currently have on your machine, you can run the following:

# $ dpkg --get-selections | grep postgres
# postgresql                  install
# postgresql-9.3                  install
# postgresql-9.6                  install
# postgresql-client-9.3               install
# postgresql-client-9.6               install
# postgresql-client-common            install
# postgresql-common               install
# postgresql-contrib              install
# postgresql-contrib-9.3              install
# postgresql-contrib-9.6              install
# You can also list the clusters that are on your machine by running

# $ pg_lsclusters
# Ver Cluster Port Status Owner    Data directory               Log file
# 9.3 main    5433 down   postgres /var/lib/postgresql/9.3/main /var/log/postgresql/postgresql-9.3-main.log
# 9.6 main    5432 online postgres /var/lib/postgresql/9.6/main /var/log/postgresql/postgresql-9.6-main.log

# 2. Stop Postgres before we make any changes
# First thing's first, we need to stop any services using postgres so we can safely migrate our database.

sudo service postgresql stop

# 3. Rename the new Postgres version's default cluster
# When Postgres packages install, they create a default cluster for you to use. We need to rename the new postgres cluster so that when we upgrade the old cluster the names won't conflict.

sudo pg_renamecluster 9.6 main main_pristine

# 4. Upgrade the old cluster to the latest version
# Just replace the version (9.3) here with the old version of Postgres that you're currently using.

sudo pg_upgradecluster 9.3 main

# 5. Make sure everything is working again
# We can start Postgres back up again and this time it should be running the new postgres 9.6 cluster.

sudo service postgresql start

# You should also see that the old cluster is down and the new version of Postgres is up:

# $ pg_lsclusters
# Ver Cluster Port Status Owner    Data directory               Log file
# 9.3 main    5433 down   postgres /var/lib/postgresql/9.3/main /var/log/postgresql/postgresql-9.3-main.log
# 9.6 main    5432 online postgres /var/lib/postgresql/9.6/main /var/log/postgresql/postgresql-9.6-main.log

# 6. Drop the old cluster
# Optionally, you can drop the old 9.3 cluster once you've verified the new one works and you don't need the old cluster anymore.

sudo pg_dropcluster 9.3 main
