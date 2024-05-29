require 'rubygems'
require 'rubygems/package_task'
require 'rake/testtask'

SUPPORTED_DARWIN_ARCHITECTURES = [:arm64, :x86_64]
SUPPORTED_LINUX_ARCHITECTURES = [:arm64, :aarch64, :arch64, :x86, :x86_64]
ARM64_COMPATIBLE_ARCHITECTURES = [:aarch64, :arch64]

def file_architecture(architecture)
  if ARM64_COMPATIBLE_ARCHITECTURES.include?(architecture)
    :arm64
  else
    architecture
  end
end

GEMSPEC = eval(File.new("wkhtmltopdf-binary.gemspec").readlines.join("\n"))

SUPPORTED_DARWIN_ARCHITECTURES.each do |architecture|
  GEMSPEC.dup.tap do |gemspec|
    platform = "#{architecture}-darwin"
    gemspec.platform = platform
    gemspec.files = ['bin/wkhtmltopdf_macos_cocoa.gz']

    gem_path = Gem::PackageTask.new(gemspec).define
    desc "Package #{architecture} Darwin gem"
    task "gem:#{platform}" => [gem_path]
  end
end

SUPPORTED_LINUX_ARCHITECTURES.each do |architecture|
  GEMSPEC.dup.tap do |gemspec|
    platform = "#{architecture}-linux"
    gemspec.platform = platform
    gemspec.files = Dir["bin/wkhtmltopdf_*_#{file_architecture(architecture)}.gz"]

    gem_path = Gem::PackageTask.new(gemspec).define
    desc "Package #{architecture} Linux gem"
    task "gem:#{platform}" => [gem_path]
  end
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run tests'
task default: :test
