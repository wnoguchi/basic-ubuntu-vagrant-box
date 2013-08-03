set -e

sudo bash <<EOF
add_vagrant_user() {
  useradd -d /home/vagrant -m vagrant -p vagrant
}

add_vagrant_key_to_ubuntu_user() {
  mkdir -m 0711 /home/ubuntu/.ssh/
  echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key' > /home/ubuntu/.ssh/authorized_keys
}

add_vagrant_user_to_admin_group() {
  groupadd admin
  usermod -G admin vagrant
  echo '%admin ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
  echo 'UseDNS no' >> /etc/ssh/sshd_config
  /etc/init.d/sudo restart
}

install_vagrant_keys() {
  mkdir /home/vagrant/.ssh/
  cd /home/vagrant/.ssh
  wget http://github.com/mitchellh/vagrant/raw/master/keys/vagrant
  wget http://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub
  mv vagrant.pub /home/vagrant/.ssh/authorized_keys
}

add_vagrant_user
add_vagrant_key_to_ubuntu_user
add_vagrant_user_to_admin_group
install_vagrant_keys
EOF
