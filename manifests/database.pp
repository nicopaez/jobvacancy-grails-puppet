class jobvacancy::database {
  
  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => '9.3',
  } ->
  class { 'postgresql::server': }

  postgresql::server::db { 'jobvacancy':
    user     => 'jobvacancy',
    password => postgresql_password('jobvacancy', 'mypassword'),
  }

  postgresql::server::role { 'jobvacancy':
    superuser     => true,
    password_hash => postgresql_password('jobvacancy', 'mypassword'),
  }

}