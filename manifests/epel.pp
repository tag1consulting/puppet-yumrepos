class yumrepos::epel (
  $epel_url = $yumrepos::params::epel_url,
) inherits yumrepos::params {

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => "puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}",
  }

  yumrepo { 'epel':
    descr      => 'EPEL',
    baseurl    => $epel_url,
    enabled    => '1',
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}",
    require    => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}"],
  }
}
