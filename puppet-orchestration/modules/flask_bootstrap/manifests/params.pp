#
class flask_bootstrap::params {

  $app_name          = 'myapp'
  $web_directory     = '/var/www'
  $app_directory     = "${web_directory}/${app_name}"
  $app_code          = "${web_directory}/${app_name}/code"
  $nginx_conf        = "/etc/nginx/sites-enabled/${app_name}.conf"
  $supervisor_conf   = "/etc/supervisor/conf.d/${app_name}.conf"
  $hello             = "${web_directory}/${app_name}/code/hello.py"
}
