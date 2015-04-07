# Class: yumrepos::elrepo
#
# Installs the ElRepo yum repository.
#
class yumrepos::elrepo (
  $elrepo_main_url = $yumrepos::params::elrepo_main_url,
  $elrepo_enabled = $yumrepos::params::elrepo_main_enabled,
  $elrepo_gpgcheck = $yumrepos::params::elrepo_main_gpgcheck,
  $elrepo_includepkgs = $yumrepos::params::elrepo_main_includepkgs,
  $elrepo_exclude = $yumrepos::params::elrepo_main_exclude,

  $elrepo_testing_url = $yumrepos::params::elrepo_url,
  $elrepo_testing_enabled = $yumrepos::params::elrepo_testing_enabled,
  $elrepo_testing_gpgcheck = $yumrepos::params::elrepo_testing_gpgcheck,
  $elrepo_testing_includepkgs = $yumrepos::params::elrepo_testing_includepkgs,
  $elrepo_testing_exclude = $yumrepos::params::elrepo_testing_exclude,

  $elrepo_kernel_url = $yumrepos::params::elrepo_kernel_url,
  $elrepo_kernel_enabled = $yumrepos::params::elrepo_kernel_enabled,
  $elrepo_kernel_gpgcheck = $yumrepos::params::elrepo_kernel_gpgcheck,
  $elrepo_kernel_includepkgs = $yumrepos::params::elrepo_kernel_includepkgs,
  $elrepo_kernel_exclude = $yumrepos::params::elrepo_kernel_exclude,

  $elrepo_extras_url = $yumrepos::params::elrepo_extras_url,
  $elrepo_extras_enabled = $yumrepos::params::elrepo_extras_enabled,
  $elrepo_extras_gpgcheck = $yumrepos::params::elrepo_extras_gpgcheck,
  $elrepo_extras_includepkgs = $yumrepos::params::elrepo_extras_includepkgs,
  $elrepo_extras_exclude = $yumrepos::params::elrepo_extras_exclude,
) inherits yumrepos::params {

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
  }

   yumrepo { 'elrepo':
    enabled     => $elrepo_main_enabled,
    descr       => "ELRepo.org Community Enterprise Linux Repository - el${::operatingsystemmajrelease}",
    baseurl     => $elrepo_main_url,
    includepkgs => $elrepo_main_includepkgs,
    exclude     => $elrepo_main_exclude,
    gpgcheck    => $elrepo_main_gpgcheck,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org'],
  }

   yumrepo { 'elrepo-testing':
    enabled     => $elrepo_testing_enabled,
    descr       => "ELRepo.org Community Enterprise Linux Testing Repository - el${::operatingsystemmajrelease}",
    baseurl     => $elrepo_testing_url,
    includepkgs => $elrepo_testing_includepkgs,
    exclude     => $elrepo_testing_exclude,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org'],
  }

   yumrepo { 'elrepo-kernel':
    enabled     => $elrepo_kernel_enabled,
    descr       => "ELRepo.org Community Enterprise Linux Kernel Repository - el${::operatingsystemmajrelease}",
    baseurl     => $elrepo_kernel_url,
    includepkgs => $elrepo_kernel_includepkgs,
    exclude     => $elrepo_kernel_exclude,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org'],
  }

   yumrepo { 'elrepo-extras':
    enabled     => $elrepo_extras_enabled,
    descr       => "ELRepo.org Community Enterprise Linux Extras Repository - el${::operatingsystemmajrelease}",
    baseurl     => $elrepo_extras_url,
    includepkgs => $elrepo_extras_includepkgs,
    exclude     => $elrepo_extras_exclude,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org',
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org'],
  }
}
