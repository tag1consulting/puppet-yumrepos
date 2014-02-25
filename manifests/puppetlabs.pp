class yumrepos::puppetlabs {
  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => "puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs",
  }

  yumrepo { 'puppetlabs':
    descr      => 'Puppet Labs Products',
    baseurl    => "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/products/${::architecture}",
    enabled    => '1',
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs",
    require    => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'],
  }

  yumrepo { 'puppetlabs-deps':
    descr      => 'Puppet Labs Dependencies',
    baseurl    => "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/dependencies/${::architecture}",
    enabled    => '1',
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs",
    require    => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'],
  }
}
