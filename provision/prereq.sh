apt update > /dev/null 2>&1  && echo "[OK] APT source list updated"
apt install -y vim chrony gnupg2 pass> /dev/null 2>&1  && echo "[OK] vim and chrony installed"

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config > /dev/null 2>&1  && echo "[OK] Allow SSH with Password"
systemctl restart sshd


cat <<EOF > /etc/hosts
127.0.0.1 localhost.localdomain localhost
192.168.63.10 node-master node-master.elastic
192.168.63.11 node-data node-data.elastic
192.168.63.20 monitoring  monitoring.elastic
EOF
