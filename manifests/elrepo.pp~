# Class: yumrepos::elrepo
#
# Installs the ELREPO yum repository.
#
class yumrepos::elrepo (
  $elrepo_url = $yumrepos::params::elrepo_url,
  $elrepo_enabled = $yumrepos::params::elrepo_enabled,
  $elrepo_gpgcheck = $yumrepos::params::elrepo_gpgcheck,
  $elrepo_includepkgs = $yumrepos::params::elrepo_includepkgs,
  $elrepo_exclude = $yumrepos::params::elrepo_exclude,
) inherits yumrepos::params {

    file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/yumrepos/etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo',
  }

   yumrepo { 'elrepo':
    enabled    => $enabled,
    descr      => "ELRepo.org Community Enterprise Linux Repository - el${::operatingsystemmajrelease}",
    baseurl    => "http://elrepo.org/linux/elrepo/el${::operatingsystemmajrelease}/\$basearch/",
    mirrorlist => "http://elrepo.org/mirrors-elrepo.el${::operatingsystemmajrelease}",
  }

  yumrepo { 'elrepo-testing':
    enabled    => $elrepo_enabled,
    descr      => "ELRepo.org Community Enterprise Linux Testing Repository - el${::operatingsystemmajrelease}",
    baseurl    => "http://elrepo.org/linux/testing/el${::operatingsystemmajrelease}/\$basearch/",
    mirrorlist => "http://elrepo.org/mirrors-elrepo-testing.el${::operatingsystemmajrelease}",
  }

  yumrepo { 'elrepo-kernel':
    enabled    => $elrepo_enabled,
    descr      => "ELRepo.org Community Enterprise Linux Kernel Repository - el${::operatingsystemmajrelease}",
    baseurl    => "http://elrepo.org/linux/kernel/el${::operatingsystemmajrelease}/\$basearch/",
    mirrorlist => "http://elrepo.org/mirrors-elrepo-kernel.el${::operatingsystemmajrelease}",
  }

  yumrepo { 'elrepo-extras':
    enabled    => $elrepo_enabled,
    descr      => "ELRepo.org Community Enterprise Linux Extras Repository - el${::operatingsystemmajrelease}",
    baseurl    => "http://elrepo.org/linux/extras/el${::operatingsystemmajrelease}/\$basearch/",
    mirrorlist => "http://elrepo.org/mirrors-elrepo-extras.el${::operatingsystemmajrelease}",
  }
}
