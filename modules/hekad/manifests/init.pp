# hekad
class hekad(
  $config_dir = '/etc/heka.d',
  $version = '0.6.0-1'
) {

  package {
    'hekad3':
      ensure => absent;
    'heka':
      ensure  => $version;
  }->

  file {
    $config_dir:
      ensure  => directory,
      purge   => true,
      recurse => true;
    ['/var/cache/hekad', '/var/cache/hekad/seekjournals']:
      ensure => directory;
  }->

  # This is shipped in heka 6 and is temporary
  file { '/usr/share/heka/lua_decoders/nginx_error.lua':
    content => template('hekad/nginx_error.lua'),
  }

}
