include_attribute "r"


case node['r']['install_method']
  when "package"
    default['r']['install_dir'] = "/usr/lib/R"
  when "source"
    if node['platform_family'] == "debian"
      default['r']['install_dir'] = "/usr/local/lib/R"
    else
      default['r']['install_dir'] = node['kernel']['machine'] == 'x86_64' ? "/usr/local/lib64/R" : "/usr/local/lib/R"
    end

    default['r']['prefix_bin'] = "/usr/local/bin"
end
