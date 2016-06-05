# == Class: openam::config
#
# Module for initial configuration of ForgeRock OpenAM.
#
# === Authors
#
# Eivind Mikkelsen <eivindm@conduct.no>
#
# === Copyright
#
# Copyright (c) 2013 Conduct AS
#

class openam::config {
  package { 'perl-Crypt-SSLeay': ensure => installed }
  package { 'perl-libwww-perl': ensure => installed }

  file { "${openam::tomcat_home}/.openamcfg":
    ensure => directory,
    owner  => $openam::tomcat_user,
    group  => $openam::tomcat_user,
    mode   => '0755',
  }

  file { "${openam::bootstrap_dir}":
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0700',
  }

  file { "${openam::bootstrap_dir}/configurator.properties":
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template("${module_name}/configurator.properties.erb"),
  }

  file { "${openam::bootstrap_dir}/configurator.pl":
    owner   => root,
    group   => root,
    mode    => '0700',
    require => File["${openam::bootstrap_dir}/configurator.properties"],
    source  => "puppet:///modules/${module_name}/configurator.pl",
  }

  file { $openam::config_dir:
    ensure => directory,
    owner  => $openam::tomcat_user,
    group  => $openam::tomcat_user,
  }
# because this is really poo and in all situatuations ALWAYS returns 1
# have set returns to 0 or 1 - this is really not good!
# done here due to time constraints
  exec { 'configure openam':
    command => "${openam::bootstrap_dir}/configurator.pl -f ${openam::bootstrap_dir}/configurator.properties",
    require => [
      File["${openam::bootstrap_dir}/configurator.pl"],
      File[$openam::config_dir],
      Package['perl-Crypt-SSLeay'],
      Package['perl-libwww-perl']
    ],
    creates => "${openam::config_dir}/bootstrap",
    notify  => Service[$openam::tomcat_service],
    returns => [0,1]
  }
}
