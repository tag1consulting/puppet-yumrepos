# Class: yumrepos::cloudera
#
# Installs the Clouder CDH5 yum repository.
#
class yumrepos::cloudera (
  $cloudera_url = $yumrepos::params::cloudera_url,
  $cloudera_enabled = $yumrepos::params::cloudera_enabled,
  $cloudera_gpgcheck = $yumrepos::params::cloudera_gpgcheck,
  $cloudera_includepkgs = $yumrepos::params::cloudera_includepkgs,
  $cloudera_exclude = $yumrepos::params::cloudera_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-cloudera':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-cloudera',
  }

  yumrepo { 'cloudera':
    descr       => 'Cloudera CDH5',
    baseurl     => $cloudera_url,
    enabled     => $cloudera_enabled,
    includepkgs => $cloudera_includepkgs,
    exclude     => $cloudera_exclude,
    gpgcheck    => $cloudera_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-cloudera',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-cloudera'],
  }
}
