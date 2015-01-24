# Class: yumrepos::jenkins
#
# Installs the Jenkins yum repository.
#
class yumrepos::jenkins (
  $jenkins_url = $yumrepos::params::jenkins_url,
  $jenkins_enabled = $yumrepos::params::jenkins_enabled,
  $jenkins_gpgcheck = $yumrepos::params::jenkins_gpgcheck,
  $jenkins_includepkgs = $yumrepos::params::jenkins_includepkgs,
  $jenkins_exclude = $yumrepos::params::jenkins_exclude,
) inherits yumrepos::params {

  file { '/etc/pki/rpm-gpg/jenkins-ci.org.key':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/jenkins-ci.org.key',
  }

  yumrepo { 'jenkins':
    descr       => 'Jenkins',
    baseurl     => $jenkins_url,
    enabled     => $jenkins_enabled,
    includepkgs => $jenkins_includepkgs,
    exclude     => $jenkins_exclude,
    gpgcheck    => $jenkins_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/jenkins-ci.org.key',
    require     => File['/etc/pki/rpm-gpg/jenkins-ci.org.key'],
  }
}
