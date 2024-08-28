class puppetserver::server_conf {
    $puppetserver_conf_file = '/etc/puppetserver/conf.d/puppetserver.conf'
    $sysconfig_puppetserver = '/etc/sysconfig/puppetserver'

   file { $puppetserver_conf_file:
        path    => $puppetserver_conf_file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        ensure  => file,
        content => template('puppetserver/puppetserver.conf.erb'),
        notify  => Service['puppetserver'],
    }

    file { $sysconfig_puppetserver:
        path    => $sysconfig_puppetserver,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        ensure  => file,
        content => template('puppetserver/sysconfig_puppetserver.erb'),
        notify  => Service['puppetserver'],
    }

}

