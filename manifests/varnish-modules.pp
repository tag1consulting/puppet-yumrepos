# Class: yumrepos::varnish-modules
#
# Installs the varnish-modules yum repository.
#
class yumrepos::varnish-modules (
  $varnish_modules_url = $yumrepos::params::varnish_modules_url,
  $varnish_modules_enabled = $yumrepos::params::varnish_modules_enabled,
  $varnish_modules_gpgcheck = $yumrepos::params::varnish_modules_gpgcheck,
  $varnish_modules_includepkgs = $yumrepos::params::varnish_modules_includepkgs,
  $varnish_modules_exclude = $yumrepos::params::varnish_modules_exclude,
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

  yumrepo { 'varnish-modules':
    descr       => 'Varmish modules',
    baseurl     => $varnish_modules_url,
    enabled     => $varnish_modules_enabled,
    includepkgs => $varnish_modules_includepkgs,
    exclude     => $varnish_modules_exclude,
    gpgcheck    => $varnish_modules_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1'],
  }

}
