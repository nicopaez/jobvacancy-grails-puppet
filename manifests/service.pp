class jobvacancy::service {

  user { 'jobvacancy':
    ensure => 'present',
  }

  file { ['/var/www/', '/var/www/jobvacancy']:
    ensure => 'directory',
    mode => "a+w"
  }

  wget::fetch { "download-jar":
    source      => 'https://nicopaez.ci.cloudbees.com/view/ejemplos/job/JobVacancy-release/lastSuccessfulBuild/artifact/jobvacancy.jar',
    destination => '/var/www/jobvacancy/jobvacancy.jar',
    timeout     => 0,
    verbose     => true,
    require => File['/var/www/', '/var/www/jobvacancy']
    before => Service['jobvacancy']
  }

  file { '/etc/init/jobvacancy.conf':
    ensure => present,
    content => template("jobvacancy/jobvacancy.conf.erb")
  }

  service { 'jobvacancy':
    ensure => running,
    provider => 'upstart',
  }

}