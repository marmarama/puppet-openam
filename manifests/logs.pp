# == Class: openam::logs
#
# Symlinks OpenAM log directories to a suitable location.
#
# === Authors
#
# Eivind Mikkelsen <eivindm@conduct.no>
#
# === Copyright
#
# Copyright (c) 2013 Conduct AS
#
class openam::logs {

  file { [$openam::log_dir,
    "${openam::log_dir}/log",
    "${openam::log_dir}/debug",
    "${openam::log_dir}/stats",
    "${openam::config_dir}${openam::deployment_uri}" ]:
    ensure => directory,
    owner  => $openam::tomcat_user,
    group  => $openam::tomcat_user,
    mode   => '0700',
  } ->

  # Symlink $OPENAM_CONFIG_HOME/$OPENAM_URI/{debug,log,stats} to the
  # configured log directory, usually this would be /var/log/openam or
  # another directory on a partition with sufficient free disk space.

  file { "${openam::config_dir}${openam::deployment_uri}/log":
    ensure  => link,
    target  => "${openam::log_dir}/log",
    force   => true,
  } ->

  file { "${openam::config_dir}${openam::deployment_uri}/debug":
    ensure  => link,
    target  => "${openam::log_dir}/debug",
    force   => true,
  } ->

  file { "${openam::config_dir}${openam::deployment_uri}/stats":
    ensure  => link,
    target  => "${openam::log_dir}/stats",
    force   => true,
  }
}
