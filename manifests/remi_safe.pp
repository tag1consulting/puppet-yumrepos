# Class: yumrepos::remi-safe
#
# Installs the Remi PHP yum repositories.
#
class yumrepos::remi_safe (
  $remi_safe_url = $yumrepos::params::remi_safe_url,
  $remi_safe_enabled = $yumrepos::params::remi_safe_enabled,
  $remi_safe_gpgcheck = $yumrepos::params::remi_safe_gpgcheck,
  $remi_safe_includepkgs = $yumrepos::params::remi_safe_includepkgs,
  $remi_safe_exclude = $yumrepos::params::remi_safe_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-remi':
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
  }

  yumrepo { 'remi_safe':
    descr       => 'remi-safe',
    baseurl     => $remi_safe_url,
    enabled     => $remi_safe_enabled,
    includepkgs => $remi_safe_includepkgs,
    exclude     => $remi_safe_exclude,
    gpgcheck    => $remi_safe_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
  }

}

