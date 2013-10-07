class resolv_conf($search_path, $domain, $nameservers) {
    file {
        'resolv_conf':
            path => "/etc/resolv.conf",
            content => template("resolv_conf/resolv.conf.erb");
    }
}
