class yumrepos::rpmforge (
  $rpmforge_url = $yumrepos::params::rpmforge_url,
  $rpmforge_enabled = $yumrepos::params::rpmforge_enabled,
  $rpmforge_gpgcheck = $yumrepos::params::rpmforge_gpgcheck,
  $rpmforge_includepkgs = $yumrepos::params::rpmforge_includepkgs,
  $rpmforge_exclude = $yumrepos::params::rpmforge_exclude,
) inherits yumrepos::params {

  yumrepo { 'rpmforge':
    descr       => 'RPMForge',
    baseurl     => $rpmforge_url,
    enabled     => $rpmforge_enabled,
    includepkgs => $rpmforge_includepkgs,
    exclude     => $rpmforge_exclude,
    gpgcheck    => $rpmforge_gpgcheck,
  }
}
