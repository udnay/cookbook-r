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
  case node['platform_family']
    when "debian"

      template "/etc/init.d/Rserve" do
        source "Rserve.erb"
        owner "root"
        mode "0755"
      end

      bash "configure Rserve daemon" do
        code <<-EOH
          cd /etc/init.d/
          update-rc.d Rserve defaults
        EOH
      end

      service "Rserve" do
        action :restart
      end
    when "rhel"
      template "/etc/init.d/Rserve" do
        source "Rserve.erb"
        owner "root"
        mode "0755"
      end

      bash "configure Rserve daemon" do
        code <<-EOH
          cd /etc/init.d/
          chkconfig --add Rserve 
        EOH
      end

      service "Rserve" do
        action :restart
      end
  end
end

