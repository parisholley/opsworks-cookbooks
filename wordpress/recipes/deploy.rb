include_recipe 'dependencies'
include_recipe 'newrelic::meetme-deploy'
include_recipe 'w3tc'

node[:deploy].each do |application, deploy|
  opsworks_deploy_user do
    deploy_data deploy
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end

  template "#{node['nginx']['dir']}/sites-enabled/#{application}.conf" do
      source "site.conf.erb"
      owner "root"
      group "root"
      mode "0644"
      variables(
          :application => application
      )
      action :create
      notifies :reload, "service[nginx]", :delayed
  end
end