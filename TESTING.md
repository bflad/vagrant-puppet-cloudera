This Puppet module uses a variety of testing components:

- Unit tests: [rspec-puppet](https://github.com/rodjek/rspec-puppet)
- Puppet linting: [puppet-lint](https://github.com/rodjek/puppet-lint)

Prerequisites
-------------
To develop on this cookbook, you must have a sane Ruby 1.9+ environment. Given the nature of this installation process (and it's variance across multiple operating systems), we will leave this installation process to the user.

You must also have `bundler` installed:

    $ gem install bundler

You must also have Vagrant and VirtualBox installed:

- [Vagrant](https://vagrantup.com)
- [VirtualBox](https://virtualbox.org)

Once installed, you must install the `vagrant-librarian-puppet-plugin` plugin:

    $ vagrant plugin install vagrant-librarian-puppet-plugin

Development
-----------
1. Clone the git repository from GitHub:

        $ git clone git@github.hmsonline.com:bflad/puppet-MODULE.git

2. Install the dependencies using bundler:

        $ cd MODULE
        $ bundle install

3. Create a branch for your changes:

        $ git checkout -b my_bug_fix

4. Make any changes
5. Write tests to support those changes. It is highly recommended you write both unit and integration tests.
6. Run the tests:
    - `rake lint`
    - `rake spec`

7. Assuming the tests pass, open a Pull Request on GitHub
