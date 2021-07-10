#
class flask_bootstrap::config inherits flask_bootstrap {

  file { '/var/www/':
  ensure => 'directory',
  require => Package['nginx'],
  }

  file { [ "${app_directory}",
  "${app_code}",
  "${app_code}/static",
  "${app_code}/templates",
  "${app_code}/tmp"]:
  ensure => 'directory',
  require => Package['nginx'],
  }


  file { [ '/var/log/uwsgi/',
  "/var/log/uwsgi/${app_name}"
  ]:
  ensure => 'directory',
  require => Package['nginx'],
  }

  file { "/var/log/nginx/${app_name}" :
  ensure => 'directory',
  require => Package['nginx'],
  }

  file { "/etc/nginx/sites-enabled/default":
  ensure  => "absent",
  require => Package['nginx'],
  }

  file { $nginx_conf :
  content => template('flask_bootstrap/flask.conf.erb'),
  owner   => root,
  group   => root,
  mode    => '0644',
  require => Package['nginx'],
  }

  file { "${app_directory}/uwsgi.ini":
    content => template('flask_bootstrap/uwsgi.ini.erb'),
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package['nginx'],
  }

  file {  $supervisor_conf :
    content => template('flask_bootstrap/uwsgi.conf.erb'),
    notify  => Service['supervisor'],
    owner   => root,
    group   => root,
    mode    => '0644',
    require => Package['supervisor'],
  }

}
