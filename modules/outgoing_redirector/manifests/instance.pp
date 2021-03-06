# set up instance of the outgoing redirector.
define outgoing_redirector::instance(
  $addr,
  $secret_key,
  $nginx_server_name
) {
  include outgoing_redirector

  $inst_name = $name
  supervisord::service { "outgoing-${inst_name}":
    command => "/usr/bin/outgoing-redirector -addr \"${addr}\" -key \"${secret_key}\"",
    app_dir => '/tmp',
    user    => 'nobody',
    require => Package['outgoing-redirector']
  }

  nginx::config { $nginx_server_name:
    content => template('outgoing_redirector/nginx.conf');
  }

  nginx::logdir { $nginx_server_name: }
}
