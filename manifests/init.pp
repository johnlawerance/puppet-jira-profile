class jira-profile {

  class { 'jira':
    javahome    => '/opt/java',
  }

}
