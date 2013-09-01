name             "wordpress"
maintainer       "Paris Holley"
maintainer_email "mail@parisholley.com"
license          "MIT"
description      "Configures a OpsWorks provisioned sever for optimal wordpress performance"
version          "1.0.0"

depends "nginx"
depends "newrelic"

recipe "newrelic::config", "Use this recipe during opsworks setup phase"
recipe "newrelic::deploy", "Use this recipe during opsworks deploy phase"