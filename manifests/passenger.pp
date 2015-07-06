# Class: yumrepos::passenger
#
# Installs the Passenger yum repository.
#
class yumrepos::passenger (
  $passenger_url = $yumrepos::params::passenger_url,
  $passenger_enabled = $yumrepos::params::passenger_enabled,
  $passenger_gpgcheck = $yumrepos::params::passenger_gpgcheck,
  $passenger_includepkgs = $yumrepos::params::passenger_includepkgs,
  $passenger_exclude = $yumrepos::params::passenger_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-passenger':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-passenger',
  }

  yumrepo { 'passenger':
    descr       => 'Passenger',
    baseurl     => $passenger_url,
    enabled     => $passenger_enabled,
    includepkgs => $passenger_includepkgs,
    exclude     => $passenger_exclude,
    gpgcheck    => $passenger_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-passenger',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-passenger'],
  }
}
