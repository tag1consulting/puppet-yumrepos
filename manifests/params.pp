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
  $ius_url = "http://dl.iuscommunity.org/pub/ius/stable/${::operatingsystem}/${::operatingsystemmajrelease}/${::architecture}"
  $ius_enabled = '1'
  $ius_gpgcheck = '1'
  $ius_includepkgs = absent
  $ius_exclude = absent

  # IUS Archive Settings.
  $ius_archive_url = "http://dl.iuscommunity.org/pub/ius/archive/${::operatingsystem}/${::operatingsystemmajrelease}/${::architecture}"
  $ius_archive_enabled = '0'
  $ius_archive_gpgcheck = '1'
  $ius_archive_includepkgs = absent
  $ius_archive_exclude = absent

  # IUS Testing Settings.
  $ius_testing_url = "http://dl.iuscommunity.org/pub/ius/testing/${::operatingsystem}/${::operatingsystemmajrelease}/${::architecture}"
  $ius_testing_enabled = '0'
  $ius_testing_gpgcheck = '1'
  $ius_testing_includepkgs = absent
  $ius_testing_exclude = absent

  # Cloudera Settings.
  $cloudera_url = "https://archive.cloudera.com/cdh5/redhat/${::operatingsystemmajrelease}/${::architecture}/cdh/5/"
  $cloudera_enabled = '1'
  $cloudera_gpgcheck = '1'
  $cloudera_includepkgs = absent
  $cloudera_exclude = absent

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

  # Varnish 4 Settings.
  $varnish4_url = "http://repo.varnish-cache.org/redhat/varnish-4.0/el${::operatingsystemmajrelease}/${::architecture}"
  $varnish4_enabled = '1'
  $varnish4_gpgcheck = '0'
  $varnish4_includepkgs = absent
  $varnish4_exclude = absent

  # Varnish 4.1 Settings.
  $varnish41_url = "https://packagecloud.io/varnishcache/varnish41/el/${::operatingsystemmajrelease}/${::architecture}"
  $varnish41_enabled = '1'
  $varnish41_gpgcheck = '0'
  $varnish41_repo_gpgcheck = '1'
  $varnish41_includepkgs = absent
  $varnish41_exclude = absent

  # Repoforge Settings.
  $repoforge_url = "http://apt.sw.be/redhat/el${::operatingsystemmajrelease}/en/${::architecture}/rpmforge"
  $repoforge_enabled = '1'
  $repoforge_gpgcheck = '1'
  $repoforge_includepkgs = absent
  $repoforge_exclude = absent

  # Drush7 Settings.
  $drush7_url = "http://pkg.tag1consulting.com/drush/drush-7/el${::operatingsystemmajrelease}/noarch"
  $drush7_enabled = '1'
  $drush7_includepkgs = absent
  $drush7_exclude = absent
  $drush7_gpgcheck = '1'

  # Drush8 Settings.
  $drush8_url = "http://pkg.tag1consulting.com/drush/drush-8/el${::operatingsystemmajrelease}/noarch"
  $drush8_enabled = '1'
  $drush8_includepkgs = absent
  $drush8_exclude = absent
  $drush8_gpgcheck = '1'

  # Drush9 Settings.
  $drush9_url = "http://pkg.tag1consulting.com/drush/drush-9/el${::operatingsystemmajrelease}/noarch"
  $drush9_enabled = '1'
  $drush9_includepkgs = absent
  $drush9_exclude = absent
  $drush9_gpgcheck = '1'

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

  # MariaDB 10 Settings.
  $mariadb10_url = "http://yum.mariadb.org/10.0/centos${::operatingsystemmajrelease}-amd64"
  $mariadb10_enabled = '1'
  $mariadb10_gpgcheck = '1'
  $mariadb10_includepkgs = absent
  $mariadb10_exclude = absent

  # MongoDB
  $mongodb_url = "https://repo.mongodb.org/yum/redhat/${::operatingsystemmajrelease}/mongodb-org/3.2/${::architecture}/"
  $mongodb_enabled = '1'
  $mongodb_gpgcheck = '1'
  $mongodb_includepkgs = absent
  $mongodb_exclude = absent

  # Nginx Settings.
  $os_short_name = $::operatingsystem ? {
    'CentOS' => 'centos',
    'RedHat' => 'rhel',
    default  => undef
  }
  if $os_short_name == undef {
    fail('Unsupported O/S')
  }
  $nginx_url = "http://nginx.org/packages/${os_short_name}/${::operatingsystemmajrelease}/${::architecture}"
  $nginx_enabled = '1'
  $nginx_gpgcheck = '1'
  $nginx_includepkgs = absent
  $nginx_exclude = absent

  # Passenger Settings.
  $passenger_url = "https://oss-binaries.phusionpassenger.com/yum/passenger/el/${::operatingsystemmajrelease}/${::architecture}"
  $passenger_enabled = '1'
  $passenger_gpgcheck = '0'
  $passenger_includepkgs = absent
  $passenger_exclude = absent

  # Elasticsearch 1.6
  $elasticsearch16_url = "http://packages.elastic.co/elasticsearch/1.6/centos"
  $elasticsearch16_enabled = '1'
  $elasticsearch16_gpgcheck = '1'
  $elasticsearch16_includepkgs = absent
  $elasticsearch16_exclude = absent

  # New Relic
  $newrelic_url = "http://yum.newrelic.com/pub/newrelic/el5/${::architecture}"
  $newrelic_enabled = '1'
  $newrelic_gpgcheck = '1'
  $newrelic_includepkgs = absent
  $newrelic_exclude = absent

  # PHP 5.6 XHProf
  $php56xhprof_url = "http://pkg.tag1consulting.com/php-pecl-xhprof/el${::operatingsystemmajrelease}/${::architecture}"
  $php56xhprof_enabled = '1'
  $php56xhprof_gpgcheck = '1'
  $php56xhprof_includepkgs = absent
  $php56xhprof_exclude = absent

  # Varnish-modules Settings.
  $varnish_41_modules_url = "https://pkg.tag1consulting.com/varnish-modules/varnish-4.1/el${::operatingsystemmajrelease}/${::architecture}"
  $varnish_41_modules_enabled = '1'
  $varnish_41_modules_includepkgs = absent
  $varnish_41_modules_exclude = absent
  $varnish_41_modules_gpgcheck = '1'

  # Grafana  
  $grafana_url = "https://packagecloud.io/grafana/stable/el/6/${::architecture}"
  $grafana_enabled = '1'
  $grafana_gpgcheck = '1'
  $grafana_includepkgs = absent
  $grafana_exclude = absent
}
