yumrepos puppet modules
=======================

Yum repo definitions for enterprise linux (RHEL/CentOS)
Each repo to manage is handled in its own class.

Currently includes repo definitions for the following yum repos (class names in parenthesis):
* Drupal Drush 5 (yumrepos::drush5)
* Drupal Drush 6 (yumrepos::drush6)
* ELRepo (yumrepos::elrepo)
* EPEL (yumrepos::epel)
* IUS Community and optionally IUS Community Archive and Testing repos (yumrepos::ius)
* Jenkins (yumrepos::jenkins)
* Jpackage (yumrepos::jpackage)
* Logstash 1.4 (yumrepos::logstash14)
* MariaDB 10 (yumrepos::mariadb10)
* Nginx (yumrepos::nginx)
* Percona (yumrepos::percona)
* Phusion Passenger (yumrepos::passenger)
* PuppetLabs (yumrepos::puppetlabs)
* RepoForge (yumrepos::repoforge)
* Varnish 3 (yumrepos::varnish3)
* Varnish 4 (yumrepos::varnish4)
* Zabbix 2.4 (yumrepos::zabbix24)

Usage
-----
```
"include yumrepos::ius"
```

or
```
"require => Class['yumrepos::ius']"
```

or
```
"class { 'yumrepos::ius': }"
```

Switching 'ius' with whichever repo you would like to enable for the host.


Optional Parameters
-------------------
Additional configuration can be made through class parameters. Each yumrepos class
accepts multiple parameters to override options such as URL, enabled, package includes/excludes,
and enabling of gpg checks. Defaults are defined in params.pp.

Example:
```
class { 'yumrepos::epel':
          epel_url => 'http://your.local.mirror.com/epel/',
          epel_exclude => 'some packages to avoid',
          epel_includepkgs => 'comma-separated packages to include',
      }
```

Example Using Hiera
-------------------
This example shows how you can configure the yumrepos classes using Hiera.

Hiera yaml configuration file (common, per-host, or whatever you have setup in your case):
```
yumrepos::epel::epel_url: 'http://your.local.mirror.com/epel/'
yumrepos::epel::epel_exclude: 'drupal*'
```

And then the class can be called from your puppet manifests without having to pass any of the parameters:
```
class { 'yumrepos::epel': }
```

General Information
-------------------
RPM GPG keys are installed and enabled for repos where available.

Most settings are in parameters (defaults included via params.pp) so that things
can be easily overridden from calling classes, Hiera, etc.


Requirements
------------
Facter 1.7.0+ is required for our use of the operatingsystemmajrelease
variable. This can be worked around with older puppet versions by defining a custom fact
to strip the point release information from the operatingsystemrelease fact.
