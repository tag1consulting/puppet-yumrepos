# Class: yumrepos::varnish3
#
# Installs the Varnish 3.x yum repository.
#
class yumrepos::varnish3 (
  $varnish3_url = $yumrepos::params::varnish3_url,
  $varnish3_enabled = $yumrepos::params::varnish3_enabled,
  $varnish3_gpgcheck = $yumrepos::params::varnish3_gpgcheck,
  $varnish3_includepkgs = $yumrepos::params::varnish3_includepkgs,
  $varnish3_exclude = $yumrepos::params::varnish3_exclude,
) inherits yumrepos::params {

  yumrepo { 'varnish3':
    descr       => 'Varnish 3.0',
    baseurl     => $varnish3_url,
    enabled     => $varnish3_enabled,
    includepkgs => $varnish3_includepkgs,
    exclude     => $varnish3_exclude,
    gpgcheck    => $varnish3_gpgcheck,
  }
}
