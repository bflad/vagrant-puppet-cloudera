Vagrant.configure("2") do |config|
  config.cache.auto_detect = true
  config.librarian_puppet.placeholder_filename = ".gitignore"

  config.vm.define :cm do |cm|
    cm.vm.box      = 'puppetlabs-centos-6'
    cm.vm.box_url  = 'http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box'
    cm.vm.hostname = "cm.example.com"
    cm.vm.network :private_network, ip: '192.168.50.10'
    cm.vm.network :forwarded_port, guest: 7180, host: 7180
    cm.vm.provider "virtualbox" do |v|
      opt_cloudera_disk_file = File.join(File.dirname(File.expand_path(__FILE__)), 'opt_cloudera.vdi')
      opt_cloudera_disk_gb = 20
      unless File.exist?(opt_cloudera_disk_file)
        v.customize ['createhd', '--filename', opt_cloudera_disk_file, '--size', opt_cloudera_disk_gb * 1024]
      end
      v.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', opt_cloudera_disk_file]
    end
  end

  config.vm.define :cdh01 do |cdh01|
    cdh01.vm.box      = 'puppetlabs-centos-6'
    cdh01.vm.box_url  = 'http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box'
    cdh01.vm.hostname = "cdh01.example.com"
    cdh01.vm.network :private_network, ip: '192.168.50.11'
  end

  # config.vm.define :debian7 do |debian7|
  #   debian7.vm.box      = 'puppetlabs-debian-7'
  #   debian7.vm.box_url  = 'http://puppet-vagrant-boxes.puppetlabs.com/debian-73-x64-virtualbox-puppet.box'
  #   debian7.vm.hostname = "#{module_name}-debian-7"
  # end

  # config.vm.define :fedora18 do |fedora18|
  #   fedora18.vm.box      = 'puppetlabs-fedora-18'
  #   fedora18.vm.box_url  = 'http://puppet-vagrant-boxes.puppetlabs.com/fedora-18-x64-vbox4210.box'
  #   fedora18.vm.hostname = "#{module_name}-fedora-18"
  # end

  # config.vm.define :ubuntu1204 do |ubuntu1204|
  #   ubuntu1204.vm.box      = 'puppetlabs-ubuntu-12.04'
  #   ubuntu1204.vm.box_url  = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box'
  #   ubuntu1204.vm.hostname = "#{module_name}-ubuntu-1204"
  # end

  # config.vm.define :ubuntu1310 do |ubuntu1310|
  #   ubuntu1310.vm.box      = 'puppetlabs-ubuntu-13.10'
  #   ubuntu1310.vm.box_url  = 'http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-x64-virtualbox-puppet.box'
  #   ubuntu1310.vm.hostname = "#{module_name}-ubuntu-1310"
  # end

  config.vm.provider "virtualbox" do |v|
    v.customize [
      "modifyvm", :id,
      "--memory", 2048,
      "--cpus", 4
    ]
  end

  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "4"
  end

  config.vm.provision :shell, :path => "opt_cloudera_disk_format.sh"

  config.vm.provision :puppet do |puppet|
    puppet.hiera_config_path = "data/hiera.yaml"
    puppet.manifests_path    = "manifests"
    puppet.module_path       = [ "../", "modules" ]
    puppet.options           = "--verbose --debug"
    puppet.working_directory = "/vagrant"
    puppet.facter            = {
      
    }
  end

  config.vm.provision :shell, :path => "post-puppet.sh"
end
