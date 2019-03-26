# Class: yumrepos::drush7
#
# Installs the Drush 7.x yum repository.
#
class yumrepos::drush7 (
  $drush7_url = $yumrepos::params::drush7_url,
  $drush7_enabled = $yumrepos::params::drush7_enabled,
  $drush7_gpgcheck = $yumrepos::params::drush7_gpgcheck,
  $drush7_repo_gpgcheck = $yumrepos::params::drush7_repo_gpgcheck,
  $drush7_includepkgs = $yumrepos::params::drush7_includepkgs,
  $drush7_exclude = $yumrepos::params::drush7_exclude,
) inherits yumrepos::params {

  if ! defined(File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH7-PACKAGECLOUD']) {
    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH7-PACKAGECLOUD':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH7-PACKAGECLOUD',
    }
  }

  yumrepo { 'tag1-drush7':
    descr         => 'Tag1 Drush 7',
    baseurl       => $drush7_url,
    enabled       => $drush7_enabled,
    includepkgs   => $drush7_includepkgs,
    exclude       => $drush7_exclude,
    gpgcheck      => $drush7_gpgcheck,
    repo_gpgcheck => $drush7_repo_gpgcheck,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH7-PACKAGECLOUD',
    sslverify     => "1",
    sslcacert     => "/etc/pki/tls/certs/ca-bundle.crt",
    require       => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH7-PACKAGECLOUD'],
  }

}
