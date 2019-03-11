# Class: yumrepos::drush9
#
# Installs the Drush 9.x yum repository.
#
class yumrepos::drush9 (
  $drush9_url = $yumrepos::params::drush9_url,
  $drush9_enabled = $yumrepos::params::drush9_enabled,
  $drush9_gpgcheck = $yumrepos::params::drush9_gpgcheck,
  $drush9_repo_gpgcheck = $yumrepos::params::drush9_repo_gpgcheck,
  $drush9_includepkgs = $yumrepos::params::drush9_includepkgs,
  $drush9_exclude = $yumrepos::params::drush9_exclude,
) inherits yumrepos::params {

  if ! defined(File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH9-PACKAGECLOUD']) {
    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH9-PACKAGECLOUD':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH9-PACKAGECLOUD',
    }
  }

  yumrepo { 'tag1-drush9':
    descr         => 'Tag1 Drush 9',
    baseurl       => $drush9_url,
    enabled       => $drush9_enabled,
    includepkgs   => $drush9_includepkgs,
    exclude       => $drush9_exclude,
    gpgcheck      => $drush9_gpgcheck,
    repo_gpgcheck => $drush9_repo_gpgcheck,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH9-PACKAGECLOUD',
    sslverify     => "1",
    sslcacert     => "/etc/pki/tls/certs/ca-bundle.crt",
    require       => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1-DRUSH9-PACKAGECLOUD'],
  }

}
