require "timeout"

def r_package_installed?(package, version)
  Timeout::timeout(30) {
    require "rinruby"
    R.echo(enable=false)
    R.eval "local_packages <- installed.packages()[,c(1,3)]"
    R.eval "package_in_list <- is.element('#{package}',local_packages)"
    packageinlist = R.pull "as.character(package_in_list)"
    if packageinlist == "TRUE"
      R.eval "local_version = local_packages['#{package}',2]"
      R.eval "a <- available.packages()[,c(1,2)]"
      R.eval "package_in_list <- is.element('#{package}',a)"
      packageinlist = R.pull "as.character(package_in_list)"
      if packageinlist == "TRUE"
        if version.nil?
          R.eval "other_version <- a['#{package}',2]"
        else
          R.eval "other_version <- '#{vesrion}'"
        end

        R.eval "version_same <- (local_version == other_version)"
        versionsame = R.pull "as.character(version_same)"
        versionsame = versionsame == "TRUE"
      else
        versionsame = false
      end
    else
      versionsame = false
    end
    return versionsame
  }
rescue TimeoutError
  raise "Timed out trying to check if package is installed using rinruby (is readline enabled in R?)"
end
