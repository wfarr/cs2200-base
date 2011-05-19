Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.customize do |vm|
    vm.memory_size = 512
    vm.name = "CS 2200"
  end
  
  Dir.glob('{project,hw}*').each do |dir|
    config.vm.share_folder("2200-#{dir}", "/home/vagrant/#{dir}", dir)
  end

  config.vm.provision :chef_solo do |chef|
  
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "main"
  end
end
