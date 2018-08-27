# Class: yumrepos::mariadb101
#
# Installs the MariaDB 10.1 yum repository.
#
class yumrepos::mariadb101 (
  $mariadb101_url = $yumrepos::params::mariadb101_url,
  $mariadb101_enabled = $yumrepos::params::mariadb101_enabled,
  $mariadb101_gpgcheck = $yumrepos::params::mariadb101_gpgcheck,
  $mariadb101_includepkgs = $yumrepos::params::mariadb101_includepkgs,
  $mariadb101_exclude = $yumrepos::params::mariadb101_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-MariaDB':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-MariaDB',
  }

  yumrepo { 'mariadb-101':
    descr       => 'MariaDB 10.1',
    baseurl     => $mariadb101_url,
    enabled     => $mariadb101_enabled,
    includepkgs => $mariadb101_includepkgs,
    exclude     => $mariadb101_exclude,
    gpgcheck    => $mariadb101_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-MariaDB',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-MariaDB'],
  }
}
