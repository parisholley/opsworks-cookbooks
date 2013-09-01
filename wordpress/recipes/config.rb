include_recipe 'nginx'

packages = [
    'php-fpm',
    'php-xml',
    'php-common',
    'php-xmlrpc',
    'php-devel',
    'php-gd',
    'php-cli',
    'php-pear-Auth-SASL',
    'php-mysql',
    'php-mcrypt',
    'php-pecl-memcache',
    'php-pear',
    'php-pear-XML-Parser',
    'php-pear-Mail-Mime',
    'php-pear-DB',
    'php-pear-HTML-Common',
    'curl-devel'
];

packages.each do |pkg|
    package pkg do
        action :install
    end
end

execute "pecl-http" do
    command "pecl install pecl_http"
    action :run
end