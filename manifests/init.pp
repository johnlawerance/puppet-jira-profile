class profile::jira {

  class { 'java':
    distribution => 'jre',
  }

  class { 'jira::facts': }
}
