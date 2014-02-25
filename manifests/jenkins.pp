class yumrepos::jenkins {

  file { "/etc/pki/rpm-gpg/jenkins-ci.org.key":
    ensure => present,
    owner  => root,
    group  => root,
    mode   => 0644,
    source => "puppet:///modules/yumrepos/etc/pki/rpm-gpg/jenkins-ci.org.key",
  }

  yumrepo { 'jenkins':
    descr      => 'Jenkins',
    baseurl    => 'http://pkg.jenkins-ci.org/redhat/',
    enabled    => '1',
    gpgcheck   => '1',
    gpgkey     => "file:///etc/pki/rpm-gpg/jenkins-ci.org.key",
    require    => File['/etc/pki/rpm-gpg/jenkins-ci.org.key'],
  }
}
