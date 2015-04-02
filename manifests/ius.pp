# Class: yumrepos::ius
#
# Installs the IUS and IUS Archive yum repositories.
#
class yumrepos::ius (
  $ius_url = $yumrepos::params::ius_url,
  $ius_enabled = $yumrepos::params::ius_enabled,
  $ius_gpgcheck = $yumrepos::params::ius_gpgcheck,
  $ius_includepkgs = $yumrepos::params::ius_includepkgs,
  $ius_exclude = $yumrepos::params::ius_exclude,
  $ius_archive_url = $yumrepos::params::ius_archive_url,
  $ius_archive_enabled = $yumrepos::params::ius_archive_enabled,
  $ius_archive_gpgcheck = $yumrepos::params::ius_archive_gpgcheck,
  $ius_archive_includepkgs = $yumrepos::params::ius_archive_includepkgs,
  $ius_archive_exclude = $yumrepos::params::ius_archive_exclude,
  $ius_testing_url = $yumrepos::params::ius_testing_url,
  $ius_testing_enabled = $yumrepos::params::ius_testing_enabled,
  $ius_testing_gpgcheck = $yumrepos::params::ius_testing_gpgcheck,
  $ius_testing_includepkgs = $yumrepos::params::ius_testing_includepkgs,
  $ius_testing_exclude = $yumrepos::params::ius_testing_exclude,
) inherits yumrepos::params {
  file { '/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY',
  }

  yumrepo { 'ius':
    descr       => 'IUS',
    baseurl     => $ius_url,
    enabled     => $ius_enabled,
    includepkgs => $ius_includepkgs,
    exclude     => $ius_exclude,
    gpgcheck    => $ius_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY',
    require     => [ Class['yumrepos::epel'], File['/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY'] ],
  }

  yumrepo { 'ius-archive':
    descr       => 'IUS Archive',
    baseurl     => $ius_archive_url,
    enabled     => $ius_archive_enabled,
    includepkgs => $ius_archive_includepkgs,
    exclude     => $ius_archive_exclude,
    gpgcheck    => $ius_archive_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY',
    require     => [ Class['yumrepos::epel'], File['/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY'] ],
  }

  yumrepo { 'ius-testing':
    descr       => 'IUS Testing',
    baseurl     => $ius_testing_url,
    enabled     => $ius_testing_enabled,
    includepkgs => $ius_testing_includepkgs,
    exclude     => $ius_testing_exclude,
    gpgcheck    => $ius_testing_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY',
    require     => [ Class['yumrepos::epel'], File['/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY'] ],
  }
}
