#
# Cookbook Name:: postgres
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

postgres_install_loc=node['postgres']['postgres_install_loc']
postgres_build_loc=node['postgres']['postgres_build_loc']

template "/tmp/rbpm_postgresql_install.properties" do
  source "rbpm_postgresql_install.properties.erb"
  owner "root" 
  mode "0644"  
end


execute "Install Postgres" do
  command " \"#{postgres_build_loc}\" -i silent -f \"/tmp/rbpm_postgresql_install.properties\" "  
  creates "#{postgres_install_loc}/JBossPostgreSQL_InstallLog.log"
  action :run
  
end




