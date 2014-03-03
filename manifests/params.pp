class yumrepos::params {

  # EPEL Settings.
  $epel_url = "http://download.fedoraproject.org/pub/epel/${::operatingsystemmajrelease}/${::architecture}"
  $epel_enabled = '1'
  $epel_gpgcheck = '1'
  $epel_includepkgs = absent
  $epel_exclude = absent

}
