set -e

sudo bash <<EOF
apt-get -y install linux-headers-$(uname -r) dkms

mkdir /mnt/VBoxGuestAdditions
mount /home/ubuntu/VBoxGuestAdditions.iso /mnt/VBoxGuestAdditions
sh /mnt/VBoxGuestAdditions/VBoxLinuxAdditions.run

umount /mnt/VBoxGuestAdditions
rmdir /mnt/VBoxGuestAdditions
rm /home/ubuntu/VBoxGuestAdditions.iso
EOF
