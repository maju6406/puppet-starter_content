# @summary This profile installs unzip and git as part of the Linux baseline
class profile::linux_baseline {

  package { 'unzip':
    ensure => installed,
  }

  package { 'git':
    ensure => installed,
  }

  class { 'ntp':
    servers => [ 'time.cloudflare.com', 'ntp2.corp.com' ],
  }

}
