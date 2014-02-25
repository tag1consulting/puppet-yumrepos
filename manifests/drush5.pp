class yumrepos::drush5 {

  yumrepo { 'tag1-drush5':
    descr      => 'Tag1 Drush 5',
    baseurl => "http://pkg.tag1consulting.com/drush/drush-5/el${::operatingsystemmajrelease}/noarch/"
    enabled   => '1',
    gpgcheck   => '0',
  }

}
