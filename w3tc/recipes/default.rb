node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
    next
  end

  execute "" do
    command "chmod 777 #{deploy[:deploy_to]}/current/wp-content/cache"
    action :nothing
  end

  execute "" do
    command "chmod 777 #{deploy[:deploy_to]}/current/wp-content/w3tc-config"
    action :nothing
  end 
end