# Class: yumrepos::logstash14
#
# Installs the Logstash 1.4 yum repository.
#
class yumrepos::logstash14(
  $logstash14_url = $yumrepos::params::logstash14_url,
  $logstash14_enabled = $yumrepos::params::logstash14_enabled,
  $logstash14_gpgcheck = $yumrepos::params::logstash14_gpgcheck,
  $logstash14_includepkgs = $yumrepos::params::logstash14_includepkgs,
  $logstash14_exclude = $yumrepos::params::logstash14_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/GPG-KEY-elasticsearch':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/GPG-KEY-elasticsearch',
  }

  yumrepo { 'logstash14':
    descr       => 'Logstash 1.4',
    baseurl     => $logstash14_url,
    enabled     => $logstash14_enabled,
    gpgcheck    => $logstash14_gpgcheck,
    includepkgs => $logstash14_includepkgs,
    exclude     => $logstash14_exclude,
    gpgkey      => 'file:///etc/pki/rpm-gpg/GPG-KEY-elasticsearch',
    require     => File['/etc/pki/rpm-gpg/GPG-KEY-elasticsearch'],
  }
}
