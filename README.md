# Docker deployment files for Thingsboard

This repository presents some docker-compose files to deploy the ThingsBoard
service under different scenarios. The files are based on the [official
documentation of ThingsBoard](https://thingsboard.io/docs/user-guide/install/docker/).

It has two versions:

- Local deployment. Are identified by the suffix `.local`. It deploys the
  service independent on a specific branch.

- Server deployment. It deploys the service in a `nginx-proxy` network which
  provides also the credentials via LetsEncrypt to publish it under a
  specified subdomain.

## How to use

To deploy the services you can use the variables `WITH_EMBEDDED_POSTGRES=1` to
specify the version that uses an embedded database, or not include it, for the
separate version.

In addition to this, you can add the `ENV_TYPE=local` to specify that it is a
locally deployed container.

On the other hand, if the server deployed which is attached to the reverse
proxy, you can use these variables to specify the domain name and the domain
email which will be used to generate the LetsEncrypt certificates and have
HTTPS connection.

| Environment variable | Default value    |
| -------------------- | ---------------- |
| DOMAIN_BASE          | localhost        |
| DOMAIN_EMAIL         | mail@example.com |
