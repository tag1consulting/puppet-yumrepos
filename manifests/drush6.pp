# Class: yumrepos::drush6
#
# Installs the Drush 6.x yum repository.
#
class yumrepos::drush6 (
  $drush6_url = $yumrepos::params::drush6_url,
  $drush6_enabled = $yumrepos::params::drush6_enabled,
  $drush6_gpgcheck = $yumrepos::params::drush6_gpgcheck,
  $drush6_includepkgs = $yumrepos::params::drush6_includepkgs,
  $drush6_exclude = $yumrepos::params::drush6_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1',
  }

  yumrepo { 'tag1-drush6':
    descr       => 'Tag1 Drush 6',
    baseurl     => $drush6_url,
    enabled     => $drush6_enabled,
    includepkgs => $drush6_includepkgs,
    exclude     => $drush6_exclude,
    gpgcheck    => $drush6_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1'],
  }

}
