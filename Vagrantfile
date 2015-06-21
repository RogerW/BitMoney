# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = "ubuntu_main"

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "nodejs"
    chef.add_recipe "ruby_build"
    chef.add_recipe "rbenv"
    chef.add_recipe "vim"
    chef.add_recipe "sqlite"

    # Install Ruby 2.2.1 and Bundler
    # Set an empty root password for MySQL to make things simple
    # chef.json = {
    #     :rvm => {
    #         :user_installs => [
    #             {
    #                 :user => "vagrant",
    #                 :default_ruby => "2.2.2",
    #                 :rubies => ["2.2.2"],
    #                 :global_gems => [
    #                     { :name => 'bundler' }
    #                 ],
    #             }
    #         ]},
    #   postgresql: {
    #     password: {"postgres" => "password"}
    #   }
    # }
  end
end