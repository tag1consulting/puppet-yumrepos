# Class: yumrepos::epel
#
# Installs the EPEL yum repository.
#
class yumrepos::epel (
  $epel_url = $yumrepos::params::epel_url,
  $epel_enabled = $yumrepos::params::epel_enabled,
  $epel_gpgcheck = $yumrepos::params::epel_gpgcheck,
  $epel_includepkgs = $yumrepos::params::epel_includepkgs,
  $epel_exclude = $yumrepos::params::epel_exclude,
) inherits yumrepos::params {

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => "puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}",
  }

  yumrepo { 'epel':
    descr       => 'EPEL',
    baseurl     => $epel_url,
    enabled     => $epel_enabled,
    gpgcheck    => $epel_gpgcheck,
    includepkgs => $epel_includepkgs,
    exclude     => $epel_exclude,
    gpgkey      => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}",
    require     => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${::operatingsystemmajrelease}"],
  }
}
