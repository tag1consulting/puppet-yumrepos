# Class: yumrepos::mongodb
#
# Installs the MongoDB yum repository.
#
class yumrepos::mongodb (
  $mongodb_url = $yumrepos::params::mongodb_url,
  $mongodb_enabled = $yumrepos::params::mongodb_enabled,
  $mongodb_gpgcheck = $yumrepos::params::mongodb_gpgcheck,
  $mongodb_includepkgs = $yumrepos::params::mongodb_includepkgs,
  $mongodb_exclude = $yumrepos::params::mongodb_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-MongoDB':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-MongoDB',
  }

  yumrepo { 'mongodb':
    descr       => 'MongoDB',
    baseurl     => $mongodb_url,
    enabled     => $mongodb_enabled,
    includepkgs => $mongodb_includepkgs,
    exclude     => $mongodb_exclude,
    gpgcheck    => $mongodb_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-MongoDB',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-MongoDB'],
  }
}
