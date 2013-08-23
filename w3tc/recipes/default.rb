node[:deploy].each do |application, deploy|
  if deploy[:application_type] != 'php'
    Chef::Log.debug("Skipping deploy::php application #{application} as it is not an PHP app")
    next
  end

  execute "chmod wp-content/cache" do
    command "chmod 777 #{deploy[:deploy_to]}/current/wp-content/cache"
    action :run
  end

  execute "chmod wp-content/w3tc-config" do
    command "chmod 777 #{deploy[:deploy_to]}/current/wp-content/w3tc-config"
    action :run
  end 

  execute "mkdirhmod wp-content/uploads" do
    command "mkdir #{deploy[:deploy_to]}/current/wp-content/uploads"
    action :run
  end 

  execute "chmod wp-content/uploads" do
    command "chmod 777 #{deploy[:deploy_to]}/current/wp-content/uploads"
    action :run
  end 
end