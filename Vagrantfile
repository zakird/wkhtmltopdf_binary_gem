Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provision "shell", inline: <<-SHELL
    cat >> /etc/profile.d/wkhtmltopdf_binary_gem.sh <<EOL
#!/bin/bash

export LANG=C.UTF-8
export DEBIAN_FRONTEND=noninteractive
export RUNNER_OS=Linux
EOL
    chmod +x /etc/profile.d/wkhtmltopdf_binary_gem.sh
    source /etc/profile.d/wkhtmltopdf_binary_gem.sh

    cat >> /home/vagrant/.bashrc <<EOL
cd /vagrant
sudo su
source /etc/profile.d/wkhtmltopdf_binary_gem.sh
EOL

    sudo apt-get update  -y
    sudo apt-get install -y docker.io docker-compose ruby
    sudo chmod 666 /var/run/docker.sock
    gem install bundler
    cd /vagrant
    bundle install
  SHELL
end
