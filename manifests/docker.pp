# Class: yumrepos::docker
#
# Installs the Docker CE yum repository.
#
class yumrepos::docker (
  $docker_url = $yumrepos::params::docker_url,
  $docker_enabled = $yumrepos::params::docker_enabled,
  $docker_gpgcheck = $yumrepos::params::docker_gpgcheck,
  $docker_repo_gpgcheck = $yumrepos::params::docker_repo_gpgcheck,
  $docker_includepkgs = $yumrepos::params::docker_includepkgs,
  $docker_exclude = $yumrepos::params::docker_exclude,
) inherits yumrepos::params {

  if ! defined(File['/etc/pki/rpm-gpg/RPM-GPG-KEY-Docker-CE']) {
    file { '/etc/pki/rpm-gpg/':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-Docker-CE',
    }
  }

  yumrepo { 'docker-ce':
    descr         => 'Docker-CE-Stable',
    baseurl       => $docker_url,
    enabled       => $docker_enabled,
    includepkgs   => $docker_includepkgs,
    exclude       => $docker_exclude,
    gpgcheck      => $docker_gpgcheck,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Docker-CE',
    require       => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-Docker-CE'],
  }
}
