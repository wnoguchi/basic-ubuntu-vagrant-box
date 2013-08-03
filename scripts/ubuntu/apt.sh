set -e

sudo bash <<EOF
apt-get -y update
apt-get -y upgrade

apt-get -y autoremove
apt-get -y autoclean

mkdir -p /var/cache/local/preseeding
chown -R root:root /var/cache/local
chmod -R 0755 /var/cache/local
EOF
