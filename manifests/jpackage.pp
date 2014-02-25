class yumrepos::jpackage {
  $yum_jpackage_gpg = '/etc/pki/rpm-gpg/jpackage.asc'

  file { $yum_jpackage_gpg:
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => "puppet:///modules/yumrepos${yum_jpackage_gpg}",
  }

  yumrepo { 'jpackage':
    descr      => 'JPackage Generic',
    mirrorlist => 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0',
    gpgcheck   => 1,
    gpgkey     => "file://${yum_jpackage_gpg}",
    require    => File[$yum_jpackage_gpg],
  }
}
