# Class: yumrepos::percona
#
# Installs the Percona yum repository.
#
class yumrepos::percona (
  $percona_url = $yumrepos::params::percona_url,
  $percona_enabled = $yumrepos::params::percona_enabled,
  $percona_gpgcheck = $yumrepos::params::percona_gpgcheck,
  $percona_includepkgs = $yumrepos::params::percona_includepkgs,
  $percona_exclude = $yumrepos::params::percona_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-percona':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-percona',
  }

  yumrepo { 'percona':
    descr       => 'Percona',
    baseurl     => $percona_url,
    enabled     => $percona_enabled,
    includepkgs => $percona_includepkgs,
    exclude     => $percona_exclude,
    gpgcheck    => $percona_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-percona',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-percona'],
  }
}
