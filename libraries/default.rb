def package_installed?(package)
  require "timeout"
  begin
    Timeout::timeout(30) {
      require "rinruby"
      R.echo(enable=false)
      R.eval "local_packages <- installed.packages()[,c(1,3)]"
      R.eval "local_version = local_packages['#{package}',2]"
      R.eval "a <- available.packages()[,c(1,2)]"
      R.eval "remote_version <- a['#{package}',2]"
      R.eval "version_same <- (local_version == remote_version)"
      versionSame = R.pull "version_same"
      return versionSame
    }
  rescue TimeoutError
    raise "Timed out trying to check if package is installed using rinruby (is readline enabled in R?)"
  end
end
