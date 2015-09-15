#
# Author:: Nicholas Long(<nicholas.long@nrel.gov>)
# Cookbook Name:: R
# Recipe:: rserve
#

template "/etc/Rserv.conf" do
  source "Rserv.conf.erb"
  owner "root"
  mode "0755"
end

include_recipe 'supervisor'

node.set['supervisor']['inet_port'] = 9000

# supervisor tasks
supervisor_service "Rserve" do
  command "#{node['r']['prefix_bin']}/R CMD Rserve --no-save --gui-none"
  directory node['r']['prefix_bin']
  exitcodes [0,1,2]
  stdout_logfile node['r']['rserve_log_path']
  stderr_logfile node['r']['rserve_log_path']
  action :enable
  autostart true
  user node['r']['rserve_user']
end
