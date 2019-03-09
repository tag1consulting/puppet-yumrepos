# Class: yumrepos::varnish-41-modules
#
# Installs the varnish-modules yum repository.
#
class yumrepos::varnish_41_modules (
  $varnish_41_modules_url = $yumrepos::params::varnish_41_modules_url,
  $varnish_41_modules_enabled = $yumrepos::params::varnish_41_modules_enabled,
  $varnish_41_modules_gpgcheck = $yumrepos::params::varnish_41_modules_gpgcheck,
  $varnish_41_modules_repo_gpgcheck = $yumrepos::params::varnish_41_modules_repo_gpgcheck,
  $varnish_41_modules_includepkgs = $yumrepos::params::varnish_41_modules_includepkgs,
  $varnish_41_modules_exclude = $yumrepos::params::varnish_41_modules_exclude,
) inherits yumrepos::params {

  if ! defined(File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-VARNISH-MODULES-PACKAGECLOUD']) {
    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-VARNISH-MODULES-PACKAGECLOUD':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-VARNISH-MODULES-PACKAGECLOUD',
    }
  }

  yumrepo { 'varnish_41_modules':
    descr         => 'Varnish 4.1 modules',
    baseurl       => $varnish_41_modules_url,
    enabled       => $varnish_41_modules_enabled,
    includepkgs   => $varnish_41_modules_includepkgs,
    exclude       => $varnish_41_modules_exclude,
    gpgcheck      => $varnish_41_modules_gpgcheck,
    repo_gpgcheck => $varnish_41_modules_rep_gpgcheck,
    sslverify     => "1",
    sslcacert     => "/etc/pki/tls/certs/ca-bundle.crt",
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-VARNISH-MODULES-PACKAGECLOUD',
    require       => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-VARNISH-MODULES-PACKAGECLOUD'],
  }

}
