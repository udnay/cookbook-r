Description
===========
This cookbook installs and configures R.  It also contains an
r_package provider which can be used in recipes to install R packages
from CRAN.

Requirements
============

* **apt**: Required for APT installation.
* **build-essential**: Required for source installation.

Attributes
==========

* `node['r']['install_method']`: Specifies either "source" or
  "package" install method.

* `node['r']['cran_mirror]`: Used by the Rprofile.site template
to set the system-wide default CRAN mirror.

* `node['r']['version']`: The R version to install.  When using Apt, set
to nil to always get the latest version.

* `node['r']['checksum']`: SHA256-sum of the R source package.

* `node['r']['config_opts]`: Options to pass to R's configure
  script. Source install only.

* `node['r']['libraries']`: Hash of libraries to add to R in the form of {:name => "ExamplePackage", :package_path => "/a/path/"}

* `node['r']['add_r_to_path']`: Will add the installed location of R (the symlink) to all users paths using profile.d

# Providers

## r_package

The r_package provider can be used to manage packages available in the
CRAN repository.  Currently to use this provider, your default CRAN
mirror must be set.  The default recipe sets this for you.

### Actions

* `:install`: Installs the package from CRAN.  Does nothing if the
  package is already installed. [default]

* `:upgrade`: Upgrades the package to the latest version.  Currently
  this will re-install the package even if it is at the latest
  version.

* `:remove`: Removes the package if it is installed.

## Examples

Install a package:

    r_package "snow"
    
Install a local package from the local file (/a/path/to/a/directory/example_1.1.0.tar.gz):
   
    r_package "example"
        version "1.1.0"
        package_path "/a/path/to/a/directory"
        action :install
    end

Remove a package:

    r_package "snow" do
        action :remove
    end


Usage
=====
Add the default recipe to the `run_list` of a Node or Role.
