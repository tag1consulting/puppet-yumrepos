class yumrepos::varnish3 {
  yumrepo { 'varnish3':
    descr      => 'Varnish 3.0',
    baseurl    => "http://repo.varnish-cache.org/redhat/varnish-3.0/el${::operatingsystemmajrelease}/${::architecture}",
    enabled    => '1',
    gpgcheck   => '0',
  }
}
