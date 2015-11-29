class profile::jira::db {

  # Hiera lookups
  $mysql_root_password = hiera('jira::db::root_password')

  # Install MySQL, collect exports
  class { '::mysql::server':
    root_password           => "$mysql_root_password",
    remove_default_accounts => true,
    #override_options        => $override_options
  }

  Mysql::Db <<| tag == jira |>> 

}
