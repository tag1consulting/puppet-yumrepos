# Class: yumrepos::repoforge
#
# Installs the Repoforge (formerly RPMForge / Dag) yum repository.
#
class yumrepos::repoforge (
  $repoforge_url = $yumrepos::params::repoforge_url,
  $repoforge_enabled = $yumrepos::params::repoforge_enabled,
  $repoforge_gpgcheck = $yumrepos::params::repoforge_gpgcheck,
  $repoforge_includepkgs = $yumrepos::params::repoforge_includepkgs,
  $repoforge_exclude = $yumrepos::params::repoforge_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag':
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
  }

  yumrepo { 'repoforge':
    descr       => 'repoforge',
    baseurl     => $repoforge_url,
    enabled     => $repoforge_enabled,
    includepkgs => $repoforge_includepkgs,
    exclude     => $repoforge_exclude,
    gpgcheck    => $repoforge_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
  }

}

