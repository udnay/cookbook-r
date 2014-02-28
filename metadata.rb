name             "r"
maintainer       "Steven Danna"
maintainer_email "steve@opscode.com"
license          "Apache 2.0"
description      "Installs/Configures R"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.3.2"

depends "yum", "~> 2.4.4"
depends "java"
depends "apt"
depends "ark"
depends "build-essential"

supports "ubuntu"
supports "centos"
