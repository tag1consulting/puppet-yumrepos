# Class: yumrepos::drush5
#
# Installs the Drush 5.x yum repository.
#
class yumrepos::drush5 (
  $drush5_url = $yumrepos::params::drush5_url,
  $drush5_enabled = $yumrepos::params::drush5_enabled,
  $drush5_gpgcheck = $yumrepos::params::drush5_gpgcheck,
  $drush5_includepkgs = $yumrepos::params::drush5_includepkgs,
  $drush5_exclude = $yumrepos::params::drush5_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1',
  }

  yumrepo { 'tag1-drush5':
    descr       => 'Tag1 Drush 5',
    baseurl     => $drush5_url,
    enabled     => $drush5_enabled,
    includepkgs => $drush5_includepkgs,
    exclude     => $drush5_exclude,
    gpgcheck    => $drush5_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1'],
  }

}
