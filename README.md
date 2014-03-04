yumrepos puppet modules
=======================

Yum repo definitions for enterprise linux (RHEL/CentOS)
Each repo to manage is handled in its own class.


Usage
-----
"include yumrepos::ius"
or
"require => Class['yumrepos::ius']"
or
"class { 'yumrepos::ius': }"

Switching 'ius' with whichever repo you would like to enable for the host.


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
