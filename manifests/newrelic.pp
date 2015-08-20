# Class: yumrepos::newrelic
#
# Installs the New Relic yum repository.
#
class yumrepos::newrelic (
  $newrelic_url = $yumrepos::params::newrelic_url,
  $newrelic_enabled = $yumrepos::params::newrelic_enabled,
  $newrelic_gpgcheck = $yumrepos::params::newrelic_gpgcheck,
  $newrelic_includepkgs = $yumrepos::params::newrelic_includepkgs,
  $newrelic_exclude = $yumrepos::params::newrelic_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/GPG-KEY-newrelic':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/GPG-KEY-NewRelic',
  }

  yumrepo { 'newrelic':
    descr       => 'New Relic 1.6',
    baseurl     => $newrelic_url,
    enabled     => $newrelic_enabled,
    includepkgs => $newrelic_includepkgs,
    exclude     => $newrelic_exclude,
    gpgcheck    => $newrelic_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/GPG-KEY-newrelic',
    require     => File['/etc/pki/rpm-gpg/GPG-KEY-newrelic'],
  }
}
