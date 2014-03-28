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
    package "libasound2"
    package "libatk1.0-0"
    package "libgtk2.0-common"
    package "ttf-dejavu-core"
    package "fontconfig-config"
    package "libfontconfig1"
    package "libpixman-1-0"
    package "libxcb-render0"
    package "libxcb-shm0"
    package "libxrender1"
    package "libcairo2"
    package "libavahi-common-data"
    package "libavahi-common3"
    package "libavahi-client3"
    package "libcups2"
    package "libjpeg-turbo8"
    package "libjpeg8"
    package "libjasper1"
    package "libtiff4"
    package "libgdk-pixbuf2.0-common"
    package "libgdk-pixbuf2.0-0"
    package "libthai-data"
    package "libdatrie1"
    package "libthai0"
    #package "libxft2"
    package "fontconfig"
    package "libpango1.0-0"
    package "libxcomposite1"
    package "libxfixes3"
    package "libxcursor1"
    package "libxi6"
    package "libxinerama1"
    package "libxrandr2"
    package "shared-mime-info"
    package "libgtk2.0-0"
    package "libnspr4"
    package "libnss3"
    package "libnss3-1d"
    package "tzdata-java"
    package "java-common"
    package "liblcms2-2"
    package "libpcsclite1"
    package "libgif4"
    package "libjson0"
    package "libogg0"
    package "libflac8"
    package "libvorbis0a"
    package "libvorbisenc2"
    package "libsndfile1"
    package "libpulse0"
    #package "x11-common"
    #package "libxtst6"
    package "libcairo-gobject2"
    package "libcairo-script-interpreter2"
    package "libcroco3"
    package "libunistring0"
    package "libgettextpo0"
    package "libgfortran3"
    package "libglib2.0-data"
    package "libglib2.0-bin"
    #package "libice6"
    package "libpcrecpp0"
    package "libpoppler19"
    #package "libsm6"
    package "libtiffxx0c2"
    #package "libxt6"
    #package "libxmu6"
    #package "libxpm4"
    #package "libxaw7"
    #package "libxkbfile1"
    #package "libxss1"
    package "html2text"
    package "gettext"
    package "intltool-debian"
    package "po-debconf"
    package "dh-apparmor"
    package "debhelper"
    package "gfortran-4.6"
    package "gfortran"
    package "gir1.2-freedesktop"
    package "gir1.2-pango-1.0"
    package "libblas3gf"
    package "libblas-dev"
    package "libbz2-dev"
    package "libexpat1-dev"
    package "libfreetype6-dev"
    package "pkg-config"
    package "libfontconfig1-dev"
    #package "xorg-sgml-doctools"
    #package "x11proto-core-dev"
    #package "libxau-dev"
    #package "libxdmcp-dev"
    #package "x11proto-input-dev"
    #package "x11proto-kb-dev"
    #package "xtrans-dev"
    package "libpthread-stubs0"
    package "libpthread-stubs0-dev"
    #package "libxcb1-dev"
    #package "libx11-dev"
    #package "x11proto-render-dev"
    #package "libxrender-dev"
    package "libpng12-dev"
    #package "libice-dev"
    #package "libsm-dev"
    package "libpixman-1-dev"
    #package "libxcb-render0-dev"
    #package "libxcb-shm0-dev"
    package "libpcre3-dev"
    package "libglib2.0-dev"
    package "libcairo2-dev"
    package "libfontenc1"
    package "libjpeg-turbo8-dev"
    package "libjpeg8-dev"
    package "libjpeg-dev"
    package "libkpathsea5"
    package "liblapack3gf"
    package "liblapack-dev"
    package "libncurses5-dev"
    #package "libxft-dev"
    package "libpango1.0-dev"
    package "libpaper1"
    package "libpaper-utils"
    package "libtiff4-dev"
    #package "x11proto-xext-dev"
    #package "libxext-dev"
    #package "libxfont1"
    #package "x11proto-scrnsaver-dev"
    #package "libxss-dev"
    #package "libxt-dev"
    #package "luatex"
    #package "tex-common"
    #package "preview-latex-style"
    package "tcl8.5"
    package "tcl8.5-dev"
    package "texi2html"
    #package "texinfo"
    #package "texlive-common"
    #package "texlive-doc-base"
    #package "texlive-binaries"
    #package "tk8.5"
    #package "tk8.5-dev"
    #package "x11-xkb-utils"
    #package "xdg-utils"
    #package "xfonts-encodings"
    #package "xfonts-utils"
    #package "xfonts-base"
    #package "xserver-common"
    #package "xvfb"
    package "liblzma-dev"
    #package "texlive-base"
    #package "texlive-fonts-recommended"
    #package "texlive-generic-recommended"
    #package "texlive-latex-base"
    #package "texlive-pictures"
    #package "texlive-extra-utils"
    #package "texlive-fonts-extra"
    #package "texlive-latex-extra"
    #package "texlive-latex-recommended"
    package "openjdk-7-jre-headless"
    package "ca-certificates-java"
    package "openjdk-7-jre"
    package "libatk-wrapper-java"
    package "openjdk-7-jdk"
    package "openjdk-7-jre-lib"
    package "libatk-wrapper-java-jni"  
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

