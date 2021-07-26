Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    export RUNNER_OS=Linux
    sudo apt-get update -y
    sudo apt-get install docker.io docker-compose ruby
    echo "END OF SCRIPT ..."
  SHELL
end
