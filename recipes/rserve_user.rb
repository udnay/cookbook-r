#
# Author:: Nicholas Long(<nicholas.long@nrel.gov>)
# Cookbook Name:: R
# Recipe:: rserve_user
# Description: Add a user to run as rserve
#

group node['r']['rserve_user_group'] do
  #append true
end

# add a user for Rserve
user node['r']['rserve_user'] do
  comment "RServe User"
  home "/home/#{node['r']['rserve_user']}"
  gid node['r']['rserve_user_group']
  password node['r']['rserve_user_password']
  shell '/bin/bash'
  system true
end

directory "/home/#{node['r']['rserve_user']}" do
  owner node['r']['rserve_user']
  group node['r']['rserve_user_group']
  mode "0755"
  action :create
end
