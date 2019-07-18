FROM vesica / docker-mariadb-cluster

# Copy and Insert DB Backup
ADD master.sql.tar.gz /docker-entrypoint-initdb.d/

