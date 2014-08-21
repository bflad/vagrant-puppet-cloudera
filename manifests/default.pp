# == Class: cdh::default
#
# Vagrant default class
#
# === Examples
#
#  class { 'cdh::default': }
#
# === Authors
#
# Brian Flad <bflad417@gmail.com>
#
# === Copyright
#
# No copyright.
#
host { 'localhost':
  ip           => "127.0.0.1",
  provider     => augeas,
} ->
host { 'cm.example.com':
  host_aliases => [ "cm" ],
  ip           => "192.168.50.10",
  provider     => augeas,
} ->
host { 'cdh01.example.com':
  host_aliases => [ "cdh01" ],
  ip           => "192.168.50.11",
  provider     => augeas,
} ->
class { 'mysql::server': } ->
class { '::cloudera': }
# class { 'cdh': }
