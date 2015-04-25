# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
    config.cache.auto_detect = false
    config.cache.enable :yum
  end

  nodes = [{:hostname => 'centos', :box => 'centos-6.5-64-vagrant'},
           {:hostname => 'ubuntu', :box => 'hashicorp/precise64'}]

  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
      node_config.vm.host_name = node[:hostname]

      memory = node[:ram] ? node[:ram] : 1024;
      node_config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", memory.to_s]
        vb.customize ["modifyvm", :id, "--name", node[:hostname]]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      end

      node_config.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "#{node[:hostname]}.pp"
        puppet.options = "--verbose --debug"
      end
    end
  end
end
