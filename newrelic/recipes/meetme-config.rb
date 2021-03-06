include_recipe "python::pip"

execute "newrelic-plugin-agent" do
    command "pip install newrelic-plugin-agent"
    action :run
end

template "#{node['newrelic']['config_path']}/newrelic_plugin_agent.cfg" do
    source "newrelic_plugin_agent.cfg.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(
        :license => node['newrelic']['application_monitoring']['license']
    )
    action :create
end

execute "newrelic-plugin-agent-start" do
    command "newrelic_plugin_agent -c #{node['newrelic']['config_path']}/newrelic_plugin_agent.cfg"
    action :run
end