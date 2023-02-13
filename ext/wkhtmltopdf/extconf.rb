require 'mkmf'
require 'rbconfig'
require 'zlib'

suffix = case RbConfig::CONFIG['host_os']
         when /linux/
           os = `. /etc/os-release 2> /dev/null && echo ${ID}_${VERSION_ID}`.strip

           if os.start_with?('elementary') || os.start_with?('linuxmint') || os.start_with?('pop')
             os = 'ubuntu_18.04'
           end

           # CentOS 6 doesn't have `/etc/os-release`.
           if (os.empty? && File.read('/etc/centos-release').start_with?('CentOS release 6')) ||
               os.start_with?('amzn_')
             os = 'centos_6'
           end

           # Deepin fallback
           os = 'debian_9' if /deepin/.match?(os)

           architecture = RbConfig::CONFIG['host_cpu'] == 'x86_64' ? 'amd64' : 'i386'

           "#{os}_#{architecture}"
         when /darwin/
           'macos_cocoa'
         else
           'unknown'
         end

binary = File.join(File.dirname(__FILE__), "../../bin/wkhtmltopdf_#{suffix}")
puts binary
if File.exist?("#{binary}.gz") && !File.exist?(binary)
  File.open binary, 'wb', 0o755 do |file|
    Zlib::GzipReader.open("#{binary}.gz") { |gzip| file << gzip.read }
  end
end

unless File.exist? binary
  raise 'Invalid platform, must be running on Ubuntu 16.04/18.04/20.04 ' \
        'CentOS 6/7/8, Debian 9/10, or intel-based Cocoa macOS ' \
        "(missing binary: #{binary})."
end

create_makefile 'wkhtmltopdf/wkhtmltopdf'
