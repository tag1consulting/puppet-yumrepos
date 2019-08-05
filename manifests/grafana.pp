# Class: yumrepos::grafana
#
# Installs the Grafana yum repository.
#
class yumrepos::grafana (
  $grafana_url = $yumrepos::params::grafana_url,
  $grafana_enabled = $yumrepos::params::grafana_enabled,
  $grafana_gpgcheck = $yumrepos::params::grafana_gpgcheck,
  $grafana_includepkgs = $yumrepos::params::grafana_includepkgs,
  $grafana_exclude = $yumrepos::params::grafana_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-grafana':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-grafana',
  }

  yumrepo { 'grafana':
    descr         => 'Grafana',
    baseurl       => $grafana_url,
    enabled       => $grafana_enabled,
    includepkgs   => $grafana_includepkgs,
    exclude       => $grafana_exclude,
    gpgcheck      => $grafana_gpgcheck,
    repo_gpgcheck => '1',
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-grafana',
    require       => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-grafana'],
  }
}
