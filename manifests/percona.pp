class yumrepos::percona {
  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-percona":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => "puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-percona",
  }

  yumrepo { 'percona':
    descr      => 'Percona',
    baseurl    => "http://repo.percona.com/centos/${::operatingsystemmajrelease}/os/${::architecture}",
    enabled    => '1',
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-percona",
    require    => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-percona'],
  }
}
