Vagrant.configure("2") do |config|
  # Main machine configuration
  config.vm.define "main" do |main|
    main.vm.box = "geerlingguy/ubuntu2004"
    
    # Настройка виртуальной машины
    main.vm.provider "virtualbox" do |vb|
      vb.memory = 4096
      vb.cpus = 2
    end
    
    # Настройка сети
    main.vm.network "public_network"
    
    main.vm.network "forwarded_port", guest: 3000, host: 3000 # Порт для Frontend
    main.vm.network "forwarded_port", guest: 4000, host: 4000 # Порт для Backend
    main.vm.network "forwarded_port", guest: 80, host: 80 # Порт для Nginx
    main.vm.network "forwarded_port", guest: 5432, host: 5432 # Порт для PostgreSQL
    
    main.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update -y
      sudo apt-get install -y docker.io docker-compose python3 python3-pip
      sudo pip3 install ansible
      sudo usermod -aG docker vagrant
    SHELL
  end

  # Ansible machine configuration
  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "geerlingguy/ubuntu2004"
    
    # Настройка виртуальной машины
    ansible.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 1
    end
    
    # Настройка сети
    
    ansible.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update -y
      sudo apt-get install -y python3 python3-pip
      sudo pip3 install ansible
    SHELL
  end
end

  