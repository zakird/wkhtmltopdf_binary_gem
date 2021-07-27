Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    sudo apt-get update -y
    sudo apt-get install -y docker.io docker-compose ruby
    sudo chmod 666 /var/run/docker.sock
    sudo service docker restart
    gem install bundler
    cd /vagrant
    bundle install
  SHELL
end
