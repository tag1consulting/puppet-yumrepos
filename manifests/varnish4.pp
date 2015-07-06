# Class: yumrepos::varnish4
#
# Installs the Varnish 4.x yum repository.
#
class yumrepos::varnish4 (
  $varnish4_url = $yumrepos::params::varnish4_url,
  $varnish4_enabled = $yumrepos::params::varnish4_enabled,
  $varnish4_gpgcheck = $yumrepos::params::varnish4_gpgcheck,
  $varnish4_includepkgs = $yumrepos::params::varnish4_includepkgs,
  $varnish4_exclude = $yumrepos::params::varnish4_exclude,
) inherits yumrepos::params {

  yumrepo { 'varnish4':
    descr       => 'Varnish 4.0',
    baseurl     => $varnish4_url,
    enabled     => $varnish4_enabled,
    includepkgs => $varnish4_includepkgs,
    exclude     => $varnish4_exclude,
    gpgcheck    => $varnish4_gpgcheck,
  }
}
