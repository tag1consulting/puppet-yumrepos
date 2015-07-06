# Class: yumrepos::nginx
#
# Installs the Nginx yum repository.
#
class yumrepos::nginx (
  $nginx_url = $yumrepos::params::nginx_url,
  $nginx_enabled = $yumrepos::params::nginx_enabled,
  $nginx_gpgcheck = $yumrepos::params::nginx_gpgcheck,
  $nginx_includepkgs = $yumrepos::params::nginx_includepkgs,
  $nginx_exclude = $yumrepos::params::nginx_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-nginx':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-nginx',
  }

  yumrepo { 'nginx':
    descr       => 'Nginx Official Repository',
    baseurl     => $nginx_url,
    enabled     => $nginx_enabled,
    gpgcheck    => $nginx_gpgcheck,
    includepkgs => $nginx_includepkgs,
    exclude     => $nginx_exclude,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nginx',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-nginx'],
  }
}
