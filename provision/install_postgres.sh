sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

apt update > /dev/null 2>&1  && echo "[OK] APT source list updated"

apt-get install postgresql-14 ruby unzip -y > /dev/null 2>&1  && echo "[OK] PostgreSQL installed"

rm /etc/postgresql/14/main/pg_hba.conf && touch /etc/postgresql/14/main/pg_hba.conf

echo 'local    all             all               trust' > /etc/postgresql/14/main/pg_hba.conf
echo 'host    all             all          127.0.0.1/32             trust' >> /etc/postgresql/14/main/pg_hba.conf

echo 'Restarting PostgreSQL ... ' && systemctl restart postgresql

wget --quiet https://jdbc.postgresql.org/download/postgresql-42.3.1.jar -P /root/ && echo "[OK] JDBC driver downloaded"

git clone https://github.com/ankane/movielens.sql.git /root/movielens.sql > /dev/null 2>&1  && echo "[OK] Movielens downloaded"

cd /root/movielens.sql/

wget --quiet https://files.grouplens.org/datasets/movielens/ml-100k.zip

unzip ml-100k.zip > /dev/null 2>&1  && echo "[OK] dump Movielens descompressed"

ruby generate.rb ml-100k > movielens.sql


