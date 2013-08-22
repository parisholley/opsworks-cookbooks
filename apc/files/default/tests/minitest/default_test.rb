require File.expand_path('../support/helpers', __FILE__)

describe 'php-apc::default' do

  include Helpers::Php_apc

  it 'installs the php-apc package' do
    package('php-apc').must_be_installed
  end

end
