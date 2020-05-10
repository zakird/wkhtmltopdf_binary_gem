require 'rubygems'
require 'rubygems/package_task'
require 'rake/testtask'

spec = eval(File.new("wkhtmltopdf-binary.gemspec").readlines.join("\n"))

Gem::PackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run tests'
task default: :test
