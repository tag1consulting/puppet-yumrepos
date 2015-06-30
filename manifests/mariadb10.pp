# Class: yumrepos::mariadb10
#
# Installs the MariaDB 10 yum repository.
#
class yumrepos::mariadb10 (
  $mariadb10_url = $yumrepos::params::mariadb10_url,
  $mariadb10_enabled = $yumrepos::params::mariadb10_enabled,
  $mariadb10_gpgcheck = $yumrepos::params::mariadb10_gpgcheck,
  $mariadb10_includepkgs = $yumrepos::params::mariadb10_includepkgs,
  $mariadb10_exclude = $yumrepos::params::mariadb10_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-MariaDB':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-MariaDB',
  }

  yumrepo { 'mariadb-10':
    descr       => 'MariaDB 10',
    baseurl     => $mariadb10_url,
    enabled     => $mariadb10_enabled,
    includepkgs => $mariadb10_includepkgs,
    exclude     => $mariadb10_exclude,
    gpgcheck    => $mariadb10_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-MariaDB',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-MariaDB'],
  }
}
