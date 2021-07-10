#
class flask_bootstrap::code_example inherits flask_bootstrap {

  file {   $hello:
    content => template('/etc/puppetlabs/code/fake_app/tiny_app.py'),
    owner   => www-data,
    group   => www-data,
    mode    => '0744',
    }

    exec { 'uwsgi-refresh':
    command     => '/usr/bin/killall -9 uwsgi; /etc/init.d/supervisor restart &&  /etc/init.d/nginx restart',
    subscribe   => File[$hello],
    refreshonly => true,
    }

  }
