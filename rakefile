require 'rubygems'
require 'rubygems/package_task'

spec = eval(File.new("wkhtmltopdf-binary.gemspec").readlines.join("\n"))
Gem::PackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end
