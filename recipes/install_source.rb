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

    # Set the Java version to 7 -- make this an attribute?
    node.override['java']['jdk_version'] = '7'
    include_recipe "java"

    # List of packages required from the command "apt-get build-dep r-base"
    #   I remove all the java items, vfb, tex, and x11
    %w(bison ca-certificates-java debhelper default-jdk default-jre default-jre-headless dh-apparmor dpkg-dev
    fontconfig fontconfig-config fonts-cabin fonts-comfortaa fonts-dejavu-core fonts-dejavu-extra fonts-droid
    fonts-font-awesome fonts-freefont-otf fonts-freefont-ttf fonts-gfs-artemisia fonts-gfs-complutum fonts-gfs-didot
    fonts-gfs-neohellenic fonts-gfs-olga fonts-gfs-solomos fonts-inconsolata fonts-junicode fonts-lato
    fonts-linuxlibertine fonts-lobster fonts-lobstertwo fonts-oflb-asana-math fonts-sil-gentium fonts-sil-gentium-basic
    fonts-stix g++ g++-4.8 gettext gfortran gfortran-4.8 gir1.2-freedesktop gir1.2-pango-1.0 intltool-debian
    java-common libasound2 libasound2-data libasyncns0 libatk-wrapper-java libatk-wrapper-java-jni libatk1.0-0
    libatk1.0-data libavahi-client3 libavahi-common-data libavahi-common3 libbison-dev libblas-dev libblas3
    libbz2-dev libcairo-gobject2 libcairo-script-interpreter2 libcairo2 libcairo2-dev libcroco3 libcups2 libcupsfilters1
    libcupsimage2 libdatrie1 libdpkg-perl libelfg0 libexpat1-dev libflac8 libfontconfig1 libfontconfig1-dev
    libfreetype6-dev libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgfortran-4.8-dev libgfortran3 libgif4
    libglib2.0-bin libglib2.0-dev libgraphite2-3 libgs9 libgs9-common libgtk2.0-0 libgtk2.0-common libharfbuzz-dev
    libharfbuzz-gobject0 libharfbuzz-icu0 libharfbuzz0b libice-dev libijs-0.35 libintl-perl
    libjasper1 libjbig-dev libjbig0 libjbig2dec0 libjpeg-dev libjpeg-turbo8 libjpeg-turbo8-dev libjpeg8 libjpeg8-dev
    libkpathsea6 liblapack-dev liblapack3 liblcms2-2 liblzma-dev liblzo2-2 libncurses5-dev libnspr4 libnss3
    libnss3-1d libnss3-nssdb libogg0 libpango-1.0-0 libpango1.0-dev libpangocairo-1.0-0 libpangoft2-1.0-0
    libpangoxft-1.0-0 libpaper-utils libpaper1 libpcre3-dev libpcrecpp0 libpcsclite1 libpixman-1-dev libpng12-dev
    libpoppler44 libptexenc1 libpthread-stubs0-dev libpulse0 libreadline-dev libreadline6-dev libsm-dev libsndfile1
    libstdc++-4.8-dev libtcl8.5 libtext-unidecode-perl libthai-data libthai0 libtiff5 libtiff5-dev libtiffxx5
    libtinfo-dev libtk8.5 libunistring0 libvorbis0a libvorbisenc2 libx11-dev libxau-dev libxcb-render0
    libxcb-render0-dev libxcb-shm0 libxcb-shm0-dev libxcb1-dev libxcursor1 libxdmcp-dev libxext-dev libxft-dev libxft2
    libxi6 libxinerama1 libxml-libxml-perl libxml-namespacesupport-perl libxml-sax-base-perl libxml-sax-perl
    libxrender-dev libxss-dev libxss1 libxt-dev libxtst6 luatex m4 mpack openjdk-7-jdk openjdk-7-jre
    openjdk-7-jre-headless pkg-config po-debconf poppler-data preview-latex-style tcl8.5 tcl8.5-dev tex-common
    texi2html texinfo texlive-base texlive-binaries texlive-extra-utils texlive-fonts-extra texlive-fonts-recommended
    texlive-generic-recommended texlive-latex-base texlive-latex-extra texlive-latex-recommended texlive-pictures tk8.5
    tk8.5-dev ttf-adf-accanthis ttf-adf-gillius tzdata-java x11proto-core-dev x11proto-input-dev x11proto-kb-dev
    x11proto-render-dev x11proto-scrnsaver-dev x11proto-xext-dev xdg-utils xorg-sgml-doctools xtrans-dev xvfb
    zlib1g-dev).each do |p|
      next if p =~ /^tex.*/
      next if p =~ /.*x11.*/
      next if p == 'xvfb'
      next if p =~ /.*jdk.*/
      next if p =~ /.*jre.*/
      next if p =~ /.*java.*/
      # These packages were either installed with build-essentials, java, or ?. So don't try to call package
      next if %w(bison dh-apparmor dpkg-dev fontconfig fontconfig-config fonts-dejavu-core fonts-dejavu-extra g++
      g++-4.8 gettext gfortran-4.8 intltool-debian libasound2 libasound2-data libasyncns0 libatk1.0-0 libatk1.0-data
      libavahi-client3 libavahi-common-data libavahi-common3 libbison-dev libblas3 libcairo-gobject2 libcairo2
      libcroco3 libcups2 libdatrie1 libdpkg-perl libelfg0 libexpat1-dev libflac8 libfontconfig1 libfontconfig1-dev
      libfreetype6-dev libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgfortran-4.8-dev libgfortran3 libgif4
      libglib2.0-bin libglib2.0-dev libgraphite2-3 libgs9-common libgtk2.0-0 libgtk2.0-common libharfbuzz-gobject0
      libharfbuzz-icu0 libharfbuzz0b libice-dev libijs-0.35 libjasper1 libjbig0 libjbig2dec0 libjpeg-turbo8
      libjpeg-turbo8-dev libjpeg8 libjpeg8-dev liblapack3 liblcms2-2 liblzo2-2 libncurses5-dev libnspr4 libnss3
      libnss3-1d libnss3-nssdb libogg0 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpangoxft-1.0-0
      libpaper-utils libpaper1 libpcre3-dev libpcrecpp0 libpcsclite1 libpixman-1-dev libpng12-dev libpthread-stubs0-dev
      libpulse0 libreadline6-dev libsm-dev libsndfile1 libstdc++-4.8-dev libthai-data libthai0 libtiff5 libtiffxx5
      libtinfo-dev libunistring0 libvorbis0a libvorbisenc2 libxau-dev libxcb-render0 libxcb-render0-dev libxcb-shm0
      libxcb-shm0-dev libxcb1-dev libxcursor1 libxdmcp-dev libxext-dev libxft-dev libxft2 libxi6 libxinerama1
      libxml-namespacesupport-perl libxml-sax-base-perl libxml-sax-perl libxrender-dev libxss1 libxt-dev m4 pkg-config
      po-debconf poppler-data xdg-utils xorg-sgml-doctools xtrans-dev zlib1g-dev autoconf).include? p
      
      package p
    end

  when "rhel"
    # Add readline headers to make command line easier to use, and is needed for rinruby gems
    include_recipe "yum"

    # Set the Java version to 7 -- make this an attribute?
    node.override['java']['jdk_version'] = '7'
    include_recipe "java"

    %w(gcc-gfortran readline-devel libX11 libX11-devel libXt libXt-devel cairo libpng libpng-devel libjpeg-turbo libjpeg-turbo-devel zlib libtiff).each do |p|
      package p
    end
end

include_recipe "ark"

# required unless "--with-readline=no" is used
include_recipe 'readline'

ark "R-#{r_version}" do
  name "R"
  version r_version
  url "#{node['r']['cran_mirror']}/src/base/R-#{major_version}/R-#{r_version}.tar.gz"
  preautogen_command "sed -i 's/NCONNECTIONS 128/NCONNECTIONS 2560/' src/main/connections.c"
  preautogen_command "sed -i 's/clusterApplyLB(cl, x = splitList(X, length(cl)),/clusterApplyLB(cl, x = X,/' src/library/parallel/R/clusterApply.R"
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

