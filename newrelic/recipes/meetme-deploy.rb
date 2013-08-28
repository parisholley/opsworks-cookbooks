execute "copy-apc-status" do
    command "cp /opt/newrelic_plugin_agent/apc-nrp.php #{deploy[:deploy_to]}/current/"
    action :run
end