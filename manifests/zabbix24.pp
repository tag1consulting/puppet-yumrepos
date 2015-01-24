# Class: yumrepos::zabbix24
#
# Installs the Zabbix 2.4 yum repository.
#
class yumrepos::zabbix24 (
  $zabbix24_url = $yumrepos::params::zabbix24_url,
  $zabbix24_enabled = $yumrepos::params::zabbix24_enabled,
  $zabbix24_gpgcheck = $yumrepos::params::zabbix24_gpgcheck,
  $zabbix24_includepkgs = $yumrepos::params::zabbix24_includepkgs,
  $zabbix24_exclude = $yumrepos::params::zabbix24_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX',
  }

  yumrepo { 'zabbix':
    descr       => 'Zabbix 2.4 Official Repository',
    baseurl     => $zabbix24_url,
    enabled     => $zabbix24_enabled,
    gpgcheck    => $zabbix24_gpgcheck,
    includepkgs => $zabbix24_includepkgs,
    exclude     => $zabbix24_exclude,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX'],
  }
}
