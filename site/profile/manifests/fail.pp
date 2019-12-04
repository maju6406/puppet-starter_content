# @summary This profile causes an intentional failed puppet run
class profile::fail {

  file { 'Create a nested folder':
    path   => '/opt/puppetlabs/this/nested/path/doesnt/exist',
    ensure => 'directory'
  }
  
}
