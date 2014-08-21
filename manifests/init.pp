# == Class: cdh::default
#
# Cloudera class
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
class cdh {
  class { '::cloudera': }
}
