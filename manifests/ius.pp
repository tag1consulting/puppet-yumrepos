class yumrepos::ius (
  $ius_url = $yumrepos::params::ius_url,
  $ius_enabled = $yumrepos::params::ius_enabled,
  $ius_gpgcheck = $yumrepos::params::ius_gpgcheck,
  $ius_includepkgs = $yumrepos::params::ius_includepkgs,
  $ius_exclude = $yumrepos::params::ius_exclude,
) inherits yumrepos::params {
  file { "/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => "puppet:///modules/yumrepos/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY",
  }

  yumrepo { 'ius':
    descr       => 'IUS',
    baseurl     => $ius_url,
    enabled     => $ius_enabled,
    includepkgs => $ius_includepkgs,
    exclude     => $ius_exclude,
    gpgcheck    => $ius_gpgcheck,
    gpgkey      => "file:///etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY",
    require     => [ Class['yumrepos::epel'], File['/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY'] ],
  }
}
