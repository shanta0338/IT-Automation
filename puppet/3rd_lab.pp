# Lab 3: the package + file + service pattern (a harmless version of the ntp exercise).
class demo {
  package { 'tree':
    ensure => latest,
  }

  file { '/tmp/puppet-lab-demo.conf':
    ensure  => file,
    content => "greeting=Hello from Puppet\n",
    replace => true,
  }

  service { 'cron':
    ensure => running,
    enable => true,
  }
}

include demo
