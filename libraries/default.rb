def package_installed?(package)
  require "timeout"
  begin
    Timeout::timeout(30) {
      require "rinruby"
      R.echo(enable=false)
      R.eval "packages = installed.packages()[,1]"
      packages = R.pull "packages"
      return packages.include?(package)
    }
  rescue TimeoutError
    raise "Timed out trying to check if package is installed using rinruby (is readline enabled in R?)"
  end
end
