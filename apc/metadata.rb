name             "php-apc"
maintainer       "TeamSnap"
maintainer_email "ops@teamsnap.com"
license          "MIT"
description      "Installs/Configures php-apc"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

%w(debian ubuntu).each do |platform|
  supports platform
end
