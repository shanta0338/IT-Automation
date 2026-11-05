# Lab 4: choose what to do using a fact.
# A laptop is not virtual, so this installs smartmontools.
# Undo with: sudo apt remove smartmontools
if $facts['is_virtual'] {
  package { 'smartmontools':
    ensure => purged,
  }
} else {
  package { 'smartmontools':
    ensure => installed,
  }
}
