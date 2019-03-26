# Class: yumrepos::drush8
#
# Installs the Drush 8.x yum repository.
#
class yumrepos::drush8 (
  $drush8_url = $yumrepos::params::drush8_url,
  $drush8_enabled = $yumrepos::params::drush8_enabled,
  $drush8_gpgcheck = $yumrepos::params::drush8_gpgcheck,
  $drush8_repo_gpgcheck = $yumrepos::params::drush8_repo_gpgcheck,
  $drush8_includepkgs = $yumrepos::params::drush8_includepkgs,
  $drush8_exclude = $yumrepos::params::drush8_exclude,
) inherits yumrepos::params {

  if ! defined(File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH8-PACKAGECLOUD']) {
    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH8-PACKAGECLOUD':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH8-PACKAGECLOUD',
    }
  }

  yumrepo { 'tag1-drush8':
    descr         => 'Tag1 Drush 8',
    baseurl       => $drush8_url,
    enabled       => $drush8_enabled,
    includepkgs   => $drush8_includepkgs,
    exclude       => $drush8_exclude,
    gpgcheck      => $drush8_gpgcheck,
    repo_gpgcheck => $drush8_repo_gpgcheck,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH8-PACKAGECLOUD',
    sslverify     => "1",
    sslcacert     => "/etc/pki/tls/certs/ca-bundle.crt",
    require       => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH8-PACKAGECLOUD'],
  }

}
