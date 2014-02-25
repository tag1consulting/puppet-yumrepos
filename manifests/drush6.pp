class yumrepos::drush6 {

  yumrepo { 'tag1-drush6':
    descr      => 'Tag1 Drush 6',
    baseurl => "http://pkg.tag1consulting.com/drush/drush-6/el${::operatingsystemmajrelease}/noarch/"
    enabled   => '1',
    gpgcheck   => '0',
  }

}
