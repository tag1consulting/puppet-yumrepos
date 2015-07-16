# Class: yumrepos::elasticsearch16
#
# Installs the Elasticsearch 1.6 yum repository.
#
class yumrepos::elasticsearch16 (
  $elasticsearch16_url = $yumrepos::params::elasticsearch16_url,
  $elasticsearch16_enabled = $yumrepos::params::elasticsearch16_enabled,
  $elasticsearch16_gpgcheck = $yumrepos::params::elasticsearch16_gpgcheck,
  $elasticsearch16_includepkgs = $yumrepos::params::elasticsearch16_includepkgs,
  $elasticsearch16_exclude = $yumrepos::params::elasticsearch16_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/GPG-KEY-elasticsearch':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/GPG-KEY-elasticsearch',
  }

  yumrepo { 'elasticsearch16':
    descr       => 'Elasticsearch 1.6',
    baseurl     => $elasticsearch16_url,
    enabled     => $elasticsearch16_enabled,
    includepkgs => $elasticsearch16_includepkgs,
    exclude     => $elasticsearch16_exclude,
    gpgcheck    => $elasticsearch16_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elasticsearch',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-elasticsearch'],
  }
}
