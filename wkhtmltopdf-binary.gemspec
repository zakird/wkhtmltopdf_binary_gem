# coding: utf-8

Gem::Specification.new do |s|
  s.name = "wkhtmltopdf-binary"
  s.version = "0.12.6.6"
  s.license = "Apache-2.0"
  s.author = "Zakir Durumeric"
  s.email = "zakird@gmail.com"
  s.platform = Gem::Platform::RUBY
  s.summary = "Provides binaries for WKHTMLTOPDF project in an easily accessible package."
  s.files = Dir['bin/*']
  s.executables << "wkhtmltopdf"
  s.require_path = '.'

  s.add_development_dependency "minitest"
  s.add_development_dependency "rake"
end
