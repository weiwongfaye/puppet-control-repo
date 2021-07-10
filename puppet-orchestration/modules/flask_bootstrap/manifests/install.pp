#
class flask_bootstrap::install inherits flask_bootstrap {

  package { 'python3-pip':
  ensure => installed
  }

  package { 'supervisor':
  ensure => installed
  }

  package { 'nginx':
  ensure => installed,
  }

  package {
    'flask':
    ensure   => latest,
    provider => pip;

    'uwsgi':
    ensure   => latest,
    provider => pip;

    #'uwsgi-plugin-python':
    #ensure => latest;

    'python-dev':
    ensure   =>  latest,
    require  => Package['python3-pip'],
    }

}
