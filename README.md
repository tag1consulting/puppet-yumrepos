yumrepos puppet modules
=======================

Yum repo definitions for enterprise linux (RHEL/CentOS)
Each repo to manage is handled in its own class.

Currently includes repo definitions for:
* Drupal Drush 5
* Drupal Drush 6
* EPEL
* IUS Community
* Jenkins
* Jpackage
* Percona
* PuppetLabs
* Varnish 3


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
and enabling of gpg checks. Defaults are defined in params.pp for each repo.

Example:
```
class { 'yumrepos::epel':
          epel_url => 'http://your.local.mirror.com/epel/',
          epel_exclude => 'some packages to avoid',
      }
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
