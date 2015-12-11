class profile::jira {

  # Hiera lookups
  $mysql_jira_pass = hiera('jira::db::jira_pass')

  # Export database
  @@mysql::db { "jira_${fqdn}":
    user     => 'jira',
    password => "$mysql_jira_pass",
    dbname   => 'jira',
    host     => 'localhost',
    grant    => ['SELECT', 'UPDATE'],
    tag      => jira,
   }

  # Install Java
  class { 'java':
    distribution => 'jre',
  }

  # Install and configure Jira
  class { 'jira':}
  class { 'jira::facts': }
}

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
