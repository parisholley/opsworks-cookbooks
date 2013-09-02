include_recipe 'nginx'
include_recipe 'dependencies'

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
        :names => deploy[:domains].join(" "),
        :application => application
      )
      action :create
      notifies :reload, "service[nginx]", :immediately
  end
end

include_recipe 'newrelic::meetme-deploy'
include_recipe 'w3tc'