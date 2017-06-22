# Class: yumrepos::varnish-41-modules
#
# Installs the varnish-modules yum repository.
#
class yumrepos::varnish-41-modules (
  $varnish_41_modules_url = $yumrepos::params::varnish_41_modules_url,
  $varnish_41_modules_enabled = $yumrepos::params::varnish_41_modules_enabled,
  $varnish_41_modules_gpgcheck = $yumrepos::params::varnish_41_modules_gpgcheck,
  $varnish_41_modules_includepkgs = $yumrepos::params::varnish_41_modules_includepkgs,
  $varnish_41_modules_exclude = $yumrepos::params::varnish_41_modules_exclude,
) inherits yumrepos::params {

  if ! defined(File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1']) {
    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1',
    }
  }

  yumrepo { 'varnish-41-modules':
    descr       => 'Varnish 4.1 modules',
    baseurl     => $varnish_41_modules_url,
    enabled     => $varnish_41_modules_enabled,
    includepkgs => $varnish_41_modules_includepkgs,
    exclude     => $varnish_41_modules_exclude,
    gpgcheck    => $varnish_41_modules_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1'],
  }

}
