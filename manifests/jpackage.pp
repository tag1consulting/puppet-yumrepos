# Class: yumrepos::jpackage
#
# Installs the jpackage yum repository.
#
class yumrepos::jpackage (
  $jpackage_mirrorlist = $yumrepos::params::jpackage_mirrorlist,
  $jpackage_enabled = $yumrepos::params::jpackage_enabled,
  $jpackage_gpgcheck = $yumrepos::params::jpackage_gpgcheck,
  $jpackage_includepkgs = $yumrepos::params::jpackage_includepkgs,
  $jpackage_exclude = $yumrepos::params::jpackage_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/jpackage.asc':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/jpackage.asc',
  }

  yumrepo { 'jpackage':
    descr       => 'JPackage 6.0 Generic',
    mirrorlist  => $jpackage_mirrorlist,
    enabled     => $jpackage_enabled,
    includepkgs => $jpackage_includepkgs,
    exclude     => $jpackage_exclude,
    gpgcheck    => $jpackage_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/jpackage.asc',
    require     => File['/etc/pki/rpm-gpg/jpackage.asc'],
  }
}
