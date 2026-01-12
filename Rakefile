require 'rubygems'
require 'rubygems/package_task'
require 'rake/testtask'

task :compress_binaries do
  Dir.glob(File.join(__dir__, 'bin/', '*{x86,amd64}')).each do |path|
    sh "upx", "-t", path do |success|
      if success
        puts "#{path} already compressed, skipping"
      else
        sh "upx", path
      end
    end
  end
end

task gem: :compress_binaries
  
spec = eval(File.new("wkhtmltopdf-binary.gemspec").readlines.join("\n"))

Gem::PackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run tests'
task default: :test
