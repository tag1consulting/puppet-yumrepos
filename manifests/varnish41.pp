# Class: yumrepos::varnish41
#
# Installs the Varnish 4.1 yum repository.
#
class yumrepos::varnish41 (
  $varnish41_url = $yumrepos::params::varnish41_url,
  $varnish41_enabled = $yumrepos::params::varnish41_enabled,
  $varnish41_gpgcheck = $yumrepos::params::varnish41_gpgcheck,
  $varnish41_includepkgs = $yumrepos::params::varnish41_includepkgs,
  $varnish41_exclude = $yumrepos::params::varnish41_exclude,
) inherits yumrepos::params {

  if ! defined(File['/etc/pki/rpm-gpg/RPM-GPG-KEY-VARNISH-PACKAGECLOUD']) {
    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-VARNISH-PACKAGECLOUD':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-VARNISH-PACKAGECLOUD',
    }
  }

  yumrepo { 'varnish41':
    descr         => 'Varnish 4.1',
    baseurl       => $varnish41_url,
    enabled       => $varnish41_enabled,
    includepkgs   => $varnish41_includepkgs,
    exclude       => $varnish41_exclude,
    gpgcheck      => $varnish41_gpgcheck,
    repo_gpgcheck => $varnish41_repo_gpgcheck,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-VARNISH-PACKAGECLOUD',
    require       => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-VARNISH-PACKAGECLOUD'],
  }
}
