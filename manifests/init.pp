class profile::jira {

  # Hiera lookups
  $mysql_jira_pass = hiera('jira::db::jira_pass')

  # Export database
  @@mysql::db { "jira_${fqdn}":
    user     => 'jira',
    password => "$mysql_jira_pass",
    dbname   => 'jira',
    host     => ${fqdn},
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
