# vagrant-puppet-cloudera

## Description

Installs/Configures [puppet-cloudera](https://github.com/razorsedge/puppet-cloudera) in Vagrant.

## Requirements

### Platforms

* CentOS 6

### Modules

* [cloudera](https://github.com/razorsedge/puppet-cloudera)
* [mysql](https://github.com/puppetlabs/puppet-mysql)

## Heira Data and Defaults

See cloudera and mysql hiera data.

## Manifests

* `default` Installs/Configures Cloudera

## Usage

### Default Installation

Add the below to your profile.

    class { 'cdh': }

## Testing and Development

* Quickly testing with Vagrant: [VAGRANT.md](VAGRANT.md)
* Full development and testing workflow with rspec-puppet, puppet-lint, and friends: [TESTING.md](TESTING.md)

## Contributing

Please use standard Github issues/pull requests and if possible, in combination with testing on the Vagrant boxes.

## Contributors

* Brian Flad (<bflad417@gmail.com>)
