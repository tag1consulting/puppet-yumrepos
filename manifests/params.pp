class yumrepos::params {

  # EPEL Settings.
  $epel_url = "http://download.fedoraproject.org/pub/epel/${::operatingsystemmajrelease}/${::architecture}"
  $epel_enabled = '1'
  $epel_gpgcheck = '1'
  $epel_includepkgs = absent
  $epel_exclude = absent

  # ElRepo Settings.
  # ElRepo has four repos: main ("elrepo"), "testing", "kernel" and "extras".
  $elrepo_main_url = "http://elrepo.org/linux/elrepo/el${::operatingsystemmajrelease}/${::architecture}"
  $elrepo_main_enabled = '1'
  $elrepo_main_gpgcheck = '1'
  $elrepo_main_includepkgs = absent
  $elrepo_main_exclude = absent

  $elrepo_testing_url = "http://elrepo.org/linux/testing/el${::operatingsystemmajrelease}/${::architecture}}"
  $elrepo_testing_enabled = '0'
  $elrepo_testing_gpgcheck = '1'
  $elrepo_testing_includepkgs = absent
  $elrepo_testing_exclude = absent 

  $elrepo_kernel_url = "http://elrepo.org/linux/kernel/el${::operatingsystemmajrelease}/${::architecture}"
  $elrepo_kernel_enabled = '0'
  $elrepo_kernel_gpgcheck = '1'
  $elrepo_kernel_includepkgs = absent
  $elrepo_kernel_exclude = absent

  $elrepo_extras_url = "http://elrepo.org/linux/extras/el${::operatingsystemmajrelease}/${::architecture}"
  $elrepo_extras_enabled = '0'
  $elrepo_extras_gpgcheck = '1'
  $elrepo_extras_includepkgs = absent
  $elrepo_extras_exclude = absent

  # IUS Settings.
  $ius_url = "http://dl.iuscommunity.org/pub/ius/stable/Redhat/${::operatingsystemmajrelease}/${::architecture}"
  $ius_enabled = '1'
  $ius_gpgcheck = '1'
  $ius_includepkgs = absent
  $ius_exclude = absent

  # IUS Archive Settings.
  $ius_archive_url = "http://dl.iuscommunity.org/pub/ius/archive/Redhat/${::operatingsystemmajrelease}/${::architecture}"
  $ius_archive_enabled = '0'
  $ius_archive_gpgcheck = '1'
  $ius_archive_includepkgs = absent
  $ius_archive_exclude = absent

  # IUS Testing Settings.
  $ius_testing_url = "http://dl.iuscommunity.org/pub/ius/testing/Redhat/${::operatingsystemmajrelease}/${::architecture}"
  $ius_testing_enabled = '0'
  $ius_testing_gpgcheck = '1'
  $ius_testing_includepkgs = absent
  $ius_testing_exclude = absent

  # Jenkins Settings.
  $jenkins_url = 'http://pkg.jenkins-ci.org/redhat/'
  $jenkins_enabled = '1'
  $jenkins_gpgcheck = '1'
  $jenkins_includepkgs = absent
  $jenkins_exclude = absent

  # Jpackage Settings.
  $jpackage_mirrorlist = 'http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0'
  $jpackage_enabled = '1'
  $jpackage_gpgcheck = '1'
  $jpackage_includepkgs = absent
  $jpackage_exclude = absent

  # Percona Settings.
  $percona_url = "http://repo.percona.com/centos/${::operatingsystemmajrelease}/os/${::architecture}"
  $percona_enabled = '1'
  $percona_gpgcheck = '1'
  $percona_includepkgs = absent
  # This default is to avoid dangerous behavior of replacing mysql core packages.
  $percona_exclude = 'Percona-Server*'

  # Puppetlabs Settings.
  # Puppetlabs has two repos, "products" and "deps".
  $puppetlabs_products_url = "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/products/${::architecture}"
  $puppetlabs_products_enabled = '1'
  $puppetlabs_products_gpgcheck = '1'
  $puppetlabs_products_includepkgs = absent
  $puppetlabs_products_exclude = absent

  $puppetlabs_deps_url = "http://yum.puppetlabs.com/el/${::operatingsystemmajrelease}/dependencies/${::architecture}"
  $puppetlabs_deps_enabled = '1'
  $puppetlabs_deps_gpgcheck = '1'
  $puppetlabs_deps_includepkgs = absent
  $puppetlabs_deps_exclude = absent

  # Varnish 3 Settings.
  $varnish3_url = "http://repo.varnish-cache.org/redhat/varnish-3.0/el${::operatingsystemmajrelease}/${::architecture}"
  $varnish3_enabled = '1'
  $varnish3_gpgcheck = '0'
  $varnish3_includepkgs = absent
  $varnish3_exclude = absent

  # Repoforge Settings.
  $repoforge_url = "http://apt.sw.be/redhat/el${::operatingsystemmajrelease}/en/${::architecture}/rpmforge"
  $repoforge_enabled = '1'
  $repoforge_gpgcheck = '1'
  $repoforge_includepkgs = absent
  $repoforge_exclude = absent

  # Drush5 Settings.
  $drush5_url = "http://pkg.tag1consulting.com/drush/drush-5/el${::operatingsystemmajrelease}/noarch"
  $drush5_enabled = '1'
  $drush5_includepkgs = absent
  $drush5_exclude = absent
  $drush5_gpgcheck = '1'

  # Drush6 Settings.
  $drush6_url = "http://pkg.tag1consulting.com/drush/drush-6/el${::operatingsystemmajrelease}/noarch"
  $drush6_enabled = '1'
  $drush6_includepkgs = absent
  $drush6_exclude = absent
  $drush6_gpgcheck = '1'

  # Zabbix Settings.
  $zabbix24_url = "http://repo.zabbix.com/zabbix/2.4/rhel/${::operatingsystemmajrelease}/${::architecture}"
  $zabbix24_enabled = '1'
  $zabbix24_gpgcheck = '1'
  $zabbix24_includepkgs = absent
  $zabbix24_exclude = absent

  # Logstash Settings.
  $logstash14_url = "http://packages.elasticsearch.org/logstash/1.4/centos"
  $logstash14_enabled = '1'
  $logstash14_gpgcheck = '1'
  $logstash14_includepkgs = absent
  $logstash14_exclude = absent
}
