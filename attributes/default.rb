#
# Author:: Steven Danna(<steve@opscode.com>)
# Cookbook Name:: R
# Attribute:: default
#
# Copyright 2011-2013, Steven S. Danna (<steve@opscode.com>)
# Copyright 2013, Mark Van de Vyver (<mark@taqtiqa.com>)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['r']['cran_mirror'] = "http://cran.fhcrc.org/"

default['r']['install_method'] = 'package'
default['r']['install_repo']   = true

# if install via source then these are needed
default['r']['version']        = '3.0.2'
default['r']['checksum']       = '956e05ad60447955049285420b5a48e0526aa4db676fd9eadb4bcfb7ccdc024b'
default['r']['config_opts']    = [ "--with-x=no" ]

default['r']['install_dev'] = true

default['r']['libraries'] = []
default['r']['add_r_to_path'] = false

# rserve settings
default['r']['rserve_start_on_boot'] = false
default['r']['rserve_user'] = "vagrant"
default['r']['rserve_log_path'] = "/var/log/Rserve.log"

default['r']['add_ld_path'] = false
default['r']['java_libjvm_path'] = "/usr/lib/jvm/java-6-openjdk-amd64/jre/lib/amd64/server/"
