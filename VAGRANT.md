Here's how you can quickly get testing or developing against the cookbook thanks to [Vagrant](http://vagrantup.com/).

    vagrant plugin install vagrant-cachier
    vagrant plugin install vagrant-librarian-puppet-plugin
    # NOTE: due to how Puppet operates, you must name directory the same as the module name when you clone
    git clone git://github.hmsonline.com/bflad/puppet-MODULE.git MODULE
    cd MODULE
    vagrant up BOX # BOX being centos6, debian7, fedora18, ubuntu1204, ubuntu1310

You can then SSH into the running VM using the `vagrant ssh BOX` command.

The VM can easily be stopped and deleted with the `vagrant destroy` command. Please see the official [Vagrant documentation](http://docs.vagrantup.com/v2/cli/index.html) for a more in depth explanation of available commands.
