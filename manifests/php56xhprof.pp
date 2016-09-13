# Class: yumrepos::php56xhprof
#
# Installs the PHP 5.6 XHProf yum repository.
#
class yumrepos::php56xhprof (
  $php56xhprof_url = $yumrepos::params::php56xhprof_url,
  $php56xhprof_enabled = $yumrepos::params::php56xhprof_enabled,
  $php56xhprof_gpgcheck = $yumrepos::params::php56xhprof_gpgcheck,
  $php56xhprof_includepkgs = $yumrepos::params::php56xhprof_includepkgs,
  $php56xhprof_exclude = $yumrepos::params::php56xhprof_exclude,
) inherits yumrepos::params {

  if ! defined(File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1']) {
    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1':
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
      source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1',
    }
  }

  yumrepo { 'tag1-php56xhprof':
    descr       => 'Tag1 PHP 5.6 XHProf',
    baseurl     => $php56xhprof_url,
    enabled     => $php56xhprof_enabled,
    includepkgs => $php56xhprof_includepkgs,
    exclude     => $php56xhprof_exclude,
    gpgcheck    => $php56xhprof_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-TAG1'],
  }

}
