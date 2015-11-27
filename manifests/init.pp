class profile::jira {

  class { 'java':
    distribution => 'jre',
  }

  class { 'jira':}
  class { 'jira::facts': }
}
