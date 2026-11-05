# Lab 2: write a file with fixed content.
# WARNING: this overwrites /etc/timezone. Restore it afterwards:
#   sudo timedatectl set-timezone Asia/Dhaka
class timezone {
  file { '/etc/timezone':
    ensure  => file,
    content => "UTC\n",
    replace => true,
  }
}

include timezone
