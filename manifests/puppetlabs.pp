# Class: yumrepos::puppetlabs
#
# Installs the Puppet Labs and Puppet Labs Dependencies yum repositories.
#
class yumrepos::puppetlabs (
  $puppetlabs_products_url = $yumrepos::params::puppetlabs_products_url,
  $puppetlabs_products_enabled = $yumrepos::params::puppetlabs_products_enabled,
  $puppetlabs_products_gpgcheck = $yumrepos::params::puppetlabs_products_gpgcheck,
  $puppetlabs_products_includepkgs = $yumrepos::params::puppetlabs_products_includepkgs,
  $puppetlabs_products_exclude = $yumrepos::params::puppetlabs_products_exclude,
  $puppetlabs_deps_url = $yumrepos::params::puppetlabs_deps_url,
  $puppetlabs_deps_enabled = $yumrepos::params::puppetlabs_deps_enabled,
  $puppetlabs_deps_gpgcheck = $yumrepos::params::puppetlabs_deps_gpgcheck,
  $puppetlabs_deps_includepkgs = $yumrepos::params::puppetlabs_deps_includepkgs,
  $puppetlabs_deps_exclude = $yumrepos::params::puppetlabs_deps_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }

  yumrepo { 'puppetlabs':
    descr       => 'Puppet Labs Products',
    baseurl     => $puppetlabs_products_url,
    enabled     => $puppetlabs_products_enabled,
    includepkgs => $puppetlabs_products_includepkgs,
    exclude     => $puppetlabs_products_exclude,
    gpgcheck    => $puppetlabs_products_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'],
  }

  yumrepo { 'puppetlabs-deps':
    descr       => 'Puppet Labs Dependencies',
    baseurl     => $puppetlabs_deps_url,
    enabled     => $puppetlabs_deps_enabled,
    includepkgs => $puppetlabs_deps_includepkgs,
    exclude     => $puppetlabs_deps_exclude,
    gpgcheck    => $puppetlabs_deps_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'],
  }
}
