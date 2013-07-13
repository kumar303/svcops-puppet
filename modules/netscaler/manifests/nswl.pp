# config for netscaler weblogger.
class netscaler::nswl(
    $version = 'dara_118_7-10.1',
    $logdir = '/data/netscaler/logs',
    $user = 'nswl',
    $nsips = [], # list of hashes {ip => '10...', password => 'encrypted_auth_string'}
    $filters = [] # list of hashes {name, filter, logFormat}
){
    package {
        'NSweblog':
            ensure => $version;
    }

    user {
        $user:;
    }

    file {
        $logdir:
            owner   => $user,
            recurse => true,
            ensure  => directory;

        '/etc/nswl.conf':
            content => template('netscaler/nswl.conf');
    }
}