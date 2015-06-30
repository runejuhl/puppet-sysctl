class sysctl::params {

  # Keep the original symlink if we purge, to avoid ping-pong with initscripts

  $symlink99 = false
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '7': {
          $symlink99 = true
        }
      }
    }
  }

  case $::osfamily {
    'FreeBSD': {
      $sysctl_dir = false
    }
    default: {
      $sysctl_dir = true
      $sysctl_dir_path = '/etc/sysctl.d'
      $sysctl_dir_owner = 'root'
      $sysctl_dir_group = 'root'
      $sysctl_dir_mode = '0755'
    }
  }

}
