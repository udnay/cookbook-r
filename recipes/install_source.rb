#
# Author:: Steven Danna(<steve@opscode.com>)
# Cookbook Name:: R
# Recipe:: default
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

r_version = node['r']['version']
major_version = r_version.split(".").first

# Command to check if we should be installing R or not.
is_installed_command = "R --version | grep -q #{r_version}"

# install some extra packages to make this work right.
case node['platform_family']
  when "debian"
    # this is broken for centos 6.5 because kernel-devel isn't available??
    include_recipe "apt"
    include_recipe "build-essential"
    package "gfortran"  
    #execute "apt-get build-dep r-base -y" # this is required if you want full access to R (png, jpeg, tcltk, etc)
execute "apt-get install libasound2 -y"
execute "apt-get install libatk1.0-0 -y"
execute "apt-get install libgtk2.0-common -y"
execute "apt-get install ttf-dejavu-core -y"
execute "apt-get install fontconfig-config -y"
execute "apt-get install libfontconfig1 -y"
execute "apt-get install libpixman-1-0 -y"
execute "apt-get install libxcb-render0 -y"
execute "apt-get install libxcb-shm0 -y"
execute "apt-get install libxrender1 -y"
execute "apt-get install libcairo2 -y"
execute "apt-get install libavahi-common-data -y"
execute "apt-get install libavahi-common3 -y"
execute "apt-get install libavahi-client3 -y"
execute "apt-get install libcups2 -y"
execute "apt-get install libjpeg-turbo8 -y"
execute "apt-get install libjpeg8 -y"
execute "apt-get install libjasper1 -y"
execute "apt-get install libtiff4 -y"
execute "apt-get install libgdk-pixbuf2.0-common -y"
execute "apt-get install libgdk-pixbuf2.0-0 -y"
execute "apt-get install libthai-data -y"
execute "apt-get install libdatrie1 -y"
execute "apt-get install libthai0 -y"
#execute "apt-get install libxft2 -y"
execute "apt-get install fontconfig -y"
execute "apt-get install libpango1.0-0 -y"
execute "apt-get install libxcomposite1 -y"
execute "apt-get install libxfixes3 -y"
execute "apt-get install libxcursor1 -y"
execute "apt-get install libxi6 -y"
execute "apt-get install libxinerama1 -y"
execute "apt-get install libxrandr2 -y"
execute "apt-get install shared-mime-info -y"
execute "apt-get install libgtk2.0-0 -y"
execute "apt-get install libnspr4 -y"
execute "apt-get install libnss3 -y"
execute "apt-get install libnss3-1d -y"
execute "apt-get install tzdata-java -y"
execute "apt-get install java-common -y"
execute "apt-get install liblcms2-2 -y"
execute "apt-get install libpcsclite1 -y"
execute "apt-get install libgif4 -y"
execute "apt-get install libjson0 -y"
execute "apt-get install libogg0 -y"
execute "apt-get install libflac8 -y"
execute "apt-get install libvorbis0a -y"
execute "apt-get install libvorbisenc2 -y"
execute "apt-get install libsndfile1 -y"
execute "apt-get install libpulse0 -y"
#execute "apt-get install x11-common -y"
#execute "apt-get install libxtst6 -y"
execute "apt-get install libcairo-gobject2 -y"
execute "apt-get install libcairo-script-interpreter2 -y"
execute "apt-get install libcroco3 -y"
execute "apt-get install libunistring0 -y"
execute "apt-get install libgettextpo0 -y"
execute "apt-get install libgfortran3 -y"
execute "apt-get install libglib2.0-data -y"
execute "apt-get install libglib2.0-bin -y"
#execute "apt-get install libice6 -y"
execute "apt-get install libpcrecpp0 -y"
execute "apt-get install libpoppler19 -y"
#execute "apt-get install libsm6 -y"
execute "apt-get install libtiffxx0c2 -y"
#execute "apt-get install libxt6 -y"
#execute "apt-get install libxmu6 -y"
#execute "apt-get install libxpm4 -y"
#execute "apt-get install libxaw7 -y"
#execute "apt-get install libxkbfile1 -y"
#execute "apt-get install libxss1 -y"
execute "apt-get install html2text -y"
execute "apt-get install gettext -y"
execute "apt-get install intltool-debian -y"
execute "apt-get install po-debconf -y"
execute "apt-get install dh-apparmor -y"
execute "apt-get install debhelper -y"
execute "apt-get install gfortran-4.6 -y"
execute "apt-get install gfortran -y"
execute "apt-get install gir1.2-freedesktop -y"
execute "apt-get install gir1.2-pango-1.0 -y"
execute "apt-get install libblas3gf -y"
execute "apt-get install libblas-dev -y"
execute "apt-get install libbz2-dev -y"
execute "apt-get install libexpat1-dev -y"
execute "apt-get install libfreetype6-dev -y"
execute "apt-get install pkg-config -y"
execute "apt-get install libfontconfig1-dev -y"
#execute "apt-get install xorg-sgml-doctools -y"
#execute "apt-get install x11proto-core-dev -y"
#execute "apt-get install libxau-dev -y"
#execute "apt-get install libxdmcp-dev -y"
#execute "apt-get install x11proto-input-dev -y"
#execute "apt-get install x11proto-kb-dev -y"
#execute "apt-get install xtrans-dev -y"
execute "apt-get install libpthread-stubs0 -y"
execute "apt-get install libpthread-stubs0-dev -y"
#execute "apt-get install libxcb1-dev -y"
#execute "apt-get install libx11-dev -y"
#execute "apt-get install x11proto-render-dev -y"
#execute "apt-get install libxrender-dev -y"
execute "apt-get install libpng12-dev -y"
#execute "apt-get install libice-dev -y"
#execute "apt-get install libsm-dev -y"
execute "apt-get install libpixman-1-dev -y"
#execute "apt-get install libxcb-render0-dev -y"
#execute "apt-get install libxcb-shm0-dev -y"
execute "apt-get install libpcre3-dev -y"
execute "apt-get install libglib2.0-dev -y"
execute "apt-get install libcairo2-dev -y"
execute "apt-get install libfontenc1 -y"
execute "apt-get install libjpeg-turbo8-dev -y"
execute "apt-get install libjpeg8-dev -y"
execute "apt-get install libjpeg-dev -y"
execute "apt-get install libkpathsea5 -y"
execute "apt-get install liblapack3gf -y"
execute "apt-get install liblapack-dev -y"
execute "apt-get install libncurses5-dev -y"
#execute "apt-get install libxft-dev -y"
execute "apt-get install libpango1.0-dev -y"
execute "apt-get install libpaper1 -y"
execute "apt-get install libpaper-utils -y"
execute "apt-get install libtiff4-dev -y"
#execute "apt-get install x11proto-xext-dev -y"
#execute "apt-get install libxext-dev -y"
#execute "apt-get install libxfont1 -y"
#execute "apt-get install x11proto-scrnsaver-dev -y"
#execute "apt-get install libxss-dev -y"
#execute "apt-get install libxt-dev -y"
#execute "apt-get install luatex -y"
#execute "apt-get install tex-common -y"
#execute "apt-get install preview-latex-style -y"
execute "apt-get install tcl8.5 -y"
execute "apt-get install tcl8.5-dev -y"
execute "apt-get install texi2html -y"
#execute "apt-get install texinfo -y"
#execute "apt-get install texlive-common -y"
#execute "apt-get install texlive-doc-base -y"
#execute "apt-get install texlive-binaries -y"
#execute "apt-get install tk8.5 -y"
#execute "apt-get install tk8.5-dev -y"
#execute "apt-get install x11-xkb-utils -y"
#execute "apt-get install xdg-utils -y"
#execute "apt-get install xfonts-encodings -y"
#execute "apt-get install xfonts-utils -y"
#execute "apt-get install xfonts-base -y"
#execute "apt-get install xserver-common -y"
#execute "apt-get install xvfb -y"
execute "apt-get install liblzma-dev -y"
#execute "apt-get install texlive-base -y"
#execute "apt-get install texlive-fonts-recommended -y"
#execute "apt-get install texlive-generic-recommended -y"
#execute "apt-get install texlive-latex-base -y"
#execute "apt-get install texlive-pictures -y"
#execute "apt-get install texlive-extra-utils -y"
#execute "apt-get install texlive-fonts-extra -y"
#execute "apt-get install texlive-latex-extra -y"
#execute "apt-get install texlive-latex-recommended -y"
execute "apt-get install openjdk-7-jre-headless -y"
execute "apt-get install ca-certificates-java -y"
execute "apt-get install openjdk-7-jre -y"
execute "apt-get install libatk-wrapper-java -y"
execute "apt-get install openjdk-7-jdk -y"
execute "apt-get install openjdk-7-jre-lib -y"
execute "apt-get install libatk-wrapper-java-jni -y"  
  when "rhel"
    # Add readline headers to make command line easier to use, and is needed for rinruby gems
    include_recipe "yum"
    %w(gcc-gfortran readline-devel libX11 libX11-devel libXt libXt-devel cairo libpng libpng-devel libjpeg-turbo libjpeg-turbo-devel zlib libtiff).each do |p|
      package p
    end
end

include_recipe "ark"
include_recipe "java"

ark "R-#{r_version}" do
  name "R"
  version r_version
  url "#{node['r']['cran_mirror']}/src/base/R-#{major_version}/R-#{r_version}.tar.gz"
  preautogen_command "sed -i 's/NCONNECTIONS 128/NCONNECTIONS 2560/' src/main/connections.c"
  autoconf_opts node['r']['config_opts'] if node['r']['config_opts']
  prefix_bin node['r']['prefix_bin']  
  
  # do not call configure then install_with_make, just call install_with_make.  If you call
  # both then it will download the file twice and fail.  The install_with_make configures with autoconf_opts.
  action :install_with_make   
  
  # This is skipped if the url/path exists
  not_if is_installed_command
end

# make sure that java is dynamically loaded (if needed)
if node['r']['add_ld_path']
  template "/etc/profile.d/r-config.sh" do
    source "r-config.sh.erb"
    owner "root"
    mode "0775"
  end
end

