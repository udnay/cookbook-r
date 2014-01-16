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

if node['r']['rserve_start_on_boot']
  template "/etc/init.d/Rserve" do
    source "Rserve.erb"
    owner "root"
    mode "0755"
  end

  # go ahead and kick it off now because we aren't going to reboot
  bash "configure Rserve daemon" do
    code <<-EOH
        cd /etc/init.d/
        update-rc.d Rserve defaults
    EOH
  end

  service "Rserve" do
    action :restart
  end
end
