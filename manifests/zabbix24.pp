class yumrepos::zabbix (
  $zabbix_url = $yumrepos::params::zabbix_url,
  $zabbix_enabled = $yumrepos::params::zabbix_enabled,
  $zabbix_gpgcheck = $yumrepos::params::zabbix_gpgcheck,
  $zabbix_includepkgs = $yumrepos::params::zabbix_includepkgs,
  $zabbix_exclude = $yumrepos::params::zabbix_exclude,
) inherits yumrepos::params {

  file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => "puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX",
  }

  yumrepo { 'zabbix':
    descr       => 'ZABBIX',
    baseurl     => $zabbix_url,
    enabled     => $zabbix_enabled,
    gpgcheck    => $zabbix_gpgcheck,
    includepkgs => $zabbix_includepkgs,
    exclude     => $zabbix_exclude,
    gpgkey      => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX",
    require     => File["/etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX"],
  }
}
