class profile::jira {

  class { 'java':
    distribution => 'jre',
  }

  class { 'jira':
    javahome    => '/opt/java',
  }

}
