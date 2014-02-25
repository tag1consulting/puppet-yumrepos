class yumrepos::ius {
  file { "/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => "puppet:///modules/yumrepos/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY",
  }

  yumrepo { 'ius':
    descr      => 'IUS',
    baseurl    => "http://dl.iuscommunity.org/pub/ius/stable/Redhat/${::operatingsystemmajrelease}/${::architecture}",
    enabled    => '1',
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY",
    require    => [ Class['yumrepos::epel'], File['/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY'] ],
  }
}
