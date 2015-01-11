class jobvacancy {

  class { 'jobvacancy::database': }
  
  class { 'jobvacancy::runtime': }
  
  class { 'jobvacancy::service': 
    require => [Class['jobvacancy::runtime'], Class['jobvacancy::database']]
  }
}
