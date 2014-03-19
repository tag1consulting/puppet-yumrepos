class yumrepos::repoforge (
  $repoforge_url = $yumrepos::params::repoforge_url,
  $repoforge_enabled = $yumrepos::params::repoforge_enabled,
  $repoforge_gpgcheck = $yumrepos::params::repoforge_gpgcheck,
  $repoforge_includepkgs = $yumrepos::params::repoforge_includepkgs,
  $repoforge_exclude = $yumrepos::params::repoforge_exclude,
) inherits yumrepos::params {

  yumrepo { 'repoforge':
    descr       => 'repoforge',
    baseurl     => $repoforge_url,
    enabled     => $repoforge_enabled,
    includepkgs => $repoforge_includepkgs,
    exclude     => $repoforge_exclude,
    gpgcheck    => $repoforge_gpgcheck,
  }
}
