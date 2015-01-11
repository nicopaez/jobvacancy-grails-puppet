class jobvacancy::runtime {
  
  class { 'java':
    distribution => 'jre',
  }

  class { 'nginx': }
  
  nginx::resource::upstream { 'jobvacancy_app':
    members => ['localhost:8080'],
  }

  nginx::resource::vhost { 'jobvacancy.com':
    proxy => 'http://jobvacancy_app',
  }

}