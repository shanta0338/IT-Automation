# Lab 1: a class with one file resource, then include it.
class sysctl {
  # Make sure the directory exists, some distros don't have it
  file { '/etc/sysctl.d':
    ensure => directory,
  }
}

include sysctl
