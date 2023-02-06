require 'minitest/autorun'
require_relative '../../lib/wkhtmltopdf/linux_os_detector'

module Wkhtmltopdf
  class LinuxOsDetectorTest < Minitest::Test
    {
      ['ubuntu', '16.04'] => 'ubuntu_16.04',
      ['ubuntu', '16.10'] => 'ubuntu_16.04',
      ['ubuntu', '17.04'] => 'ubuntu_16.04',
      ['ubuntu', '17.10'] => 'ubuntu_16.04',
      ['ubuntu', '18.04'] => 'ubuntu_18.04',
      ['ubuntu', '18.10'] => 'ubuntu_18.04',
      ['ubuntu', '19.04'] => 'ubuntu_18.04',
      ['ubuntu', '19.10'] => 'ubuntu_18.04',
      ['ubuntu', '20.04'] => 'ubuntu_20.04',
      ['ubuntu', '20.10'] => 'ubuntu_20.04',
      ['ubuntu', '21.04'] => 'ubuntu_20.04',
      ['ubuntu', '21.10'] => 'ubuntu_20.04',
      ['ubuntu', '22.04'] => 'ubuntu_22.04',
      ['ubuntu', '22.10'] => 'ubuntu_22.04',
      ['linuxmint', '18.3'] => 'ubuntu_16.04',
      ['linuxmint', '19.3'] => 'ubuntu_18.04',
      ['linuxmint', '20.3'] => 'ubuntu_20.04',
      ['linuxmint', '21.3'] => 'ubuntu_22.04',
      ['debian', '9'] => 'debian_9',
      ['debian', '10'] => 'debian_10',
      ['amzn', '2018.03'] => 'centos_6',
      ['amzn', '2'] => 'centos_7',
      ['amzn', '2022'] => 'centos_7',
      ['rocky', '8'] => 'centos_8',
      ['rhel', '8.7'] => 'centos_8',
      ['arch', 'xxx'] => 'archlinux',
      ['manjaro', 'xxx'] => 'archlinux',
      ['zorin', '16.2'] => 'ubuntu_18.04',
      ['pop', '22.04'] => 'ubuntu_18.04',
      ['elementary', '7.0'] => 'ubuntu_18.04',
    }.each do |(id, version), base_os|
      define_method "test_#{id}_#{version}" do
        assert_equal base_os, LinuxOsDetector.new(id, version).os
      end
    end

    def test_centos_6
      detector = LinuxOsDetector.new('', '')
      detector.instance_variable_set(:@extras, {'centos-release' => 'CentOS release 6.10 (Final)'})
      assert_equal 'centos_6', detector.os
    end

    def test_unknown_returns_raw_os_and_version
      assert_equal 'somelinux_10', LinuxOsDetector.new('somelinux', '10').os
    end

  end
end
