# Puppet Module for ForgeRock OpenAM

`puppet-openam` deploys and configures your OpenAM servers with Puppet.

## Initial configuration

The module supports initial configuration of OpenAM through a POST
to `/config/configurator` from the included `configurator.pl` script.

    class { 'openam': }

The following parameters controls the initial configuration of OpenAM:

  * `version`: The OpenAM version number
  * `java_home`: Java home
  * `tomcat_user`: The POSIX user running Tomcat
  * `tomcat_service`: The name of the service starting the OpenAM Tomcat instance
  * `tomcat_home`: The home directory for Tomcat
  * `config_dir`: The OpenAM configuration directory, e.g. `/opt/openam`
  * `log_dir`: The destination directory for OpenAM logs, e.g. `/var/log`
  * `locale`: The OpenAM locale, e.g. `en_US`
  * `ssoadm`: The path to install the ssoadm wrapper, default `/usr/local/bin/ssoadm`
  * `deployment_uri`: The OpenAM deployment URI, e.g. `/sso`
  * `site_url`: The OpenAM site URL, e.g. `https://idp.example.com:443/sso`
  * `cookie_domain`: The OpenAM cookie domain, e.g. `.example.com`
  * `master`: The OpenAM master server host in a multi server setup, e.g. `idp.example.com`
  * `server_protocol`: The OpenAM server protocol, `http` or `https`
  * `server_port`: The OpenAM server port, e.g. `8080`
  * `amadmin_pw`: The OpenAM amadmin user password
  * `amldapuser_pw`: The OpenAM amldapuser password (can't be the same as amadmin_pw)
  * `encryption_key`: The OpenAM encryption key
  * `userstore_host`: The host for the OpenAM user store, e.g. `idp.example.com`
  * `userstore_ldap_port`: The ldap port for the OpenAM user store, e.g. `1389`
  * `userstore_suffix`: The root suffix for the OpenAM user store, e.g. `dc=example,dc=com`
  * `userstore_binddn`: The LDAP user for the OpenAM user store, e.g. `cn=Directory Manager`
  * `userstore_bindpw`: The password for the user specified in `userstore_binddn`
  * `configstore_host`: The host for the OpenAM configuration store, e.g. `idp.example.com`
  * `configstore_ldap_port`: The ldap port for the OpenAM configuration store, e.g. `1389`
  * `configstore_admin_port`: The admin port for the OpenAM configuration store, e.g. `4444`
  * `configstore_jmx_port`: The jmx port for the OpenAM configuration store, e.g. `1689`
  * `configstore_suffix`: The root suffix for the OpenAM configuration store, e.g. `dc=example,dc=com`
  * `configstore_binddn`: The LDAP user for the OpenAM configuration store, e.g. `cn=Directory Manager`
  * `configstore_bindpw`: The password for the user specified in `configstore_binddn`
