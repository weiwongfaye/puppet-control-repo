# == Class: flask_bootstrap

class flask_bootstrap (

  $app_directory   = $flask_bootstrap::params::app_directory,
  $app_name        = $flask_bootstrap::params::app_name,
  $nginx_conf      = $flask_bootstrap::params::nginx_conf,
  $uwsgi_ini       = $flask_bootstrap::params::uwsgi_ini,
  $supervisor_conf = $flask_bootstrap::params::supervisor_conf,
  $hello_world     = $flask_bootstrap::params::hello_world,
  $app_code        = $flask_bootstrap::params::app_code,

  ) inherits flask_bootstrap::params{

    # Anchor pattern to contain dependencies
    anchor { 'flask_bootstrap::begin': } ->
    class  { 'flask_bootstrap::install': } ->
    class  { 'flask_bootstrap::config': } ->
    class  { 'flask_bootstrap::service': } ->
    class  { 'flask_bootstrap::code_example': } ->
    anchor { 'flask_bootstrap::end': }

  }
