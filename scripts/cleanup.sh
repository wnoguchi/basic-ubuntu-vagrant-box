set -e

sudo bash <<EOF
rm /var/cache/apt/archives/*.deb
dd if=/dev/zero of=/EMPTY bs=1M
rm /EMPTY
EOF
