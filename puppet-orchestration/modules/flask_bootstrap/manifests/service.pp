#
class flask_bootstrap::service inherits flask_bootstrap {

  service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
  }

  service { 'supervisor':
  ensure  => running,
  require => Package['supervisor'],
  }

}
