require 'minitest/autorun'

def macos?
  ENV['RUNNER_OS'] && ENV['RUNNER_OS'] == 'macOS'
end

class WithDockerTest < Minitest::Test
  SETUP = begin
    `docker-compose build` unless macos?
  end

  def test_centos_6
   test with: 'centos_6'
  end

  def test_centos_7
    test with: 'centos_7'
  end

  def test_centos_8
   test with: 'centos_8'
  end

  def test_debian_9
   test with: 'debian_9'
  end

  def test_debian_10
   test with: 'debian_10'
  end

  def test_ubuntu_16
   test with: 'ubuntu_16.04'
  end

  def test_ubuntu_18
   test with: 'ubuntu_18.04'
  end

  def test_ubuntu_20
   test with: 'ubuntu_20.04'
  end

  def test_ubuntu_22
   test with: 'ubuntu_22.04'
  end

  def test_archlinux
   test with: 'archlinux'
  end
  
  def test_rockylinux_8
   test with: 'rockylinux_8'
  end

  def test_amazonlinux2
    test with: 'amazonlinux2'
  end
  
  def test_macos
    assert_equal('wkhtmltopdf 0.12.6 (with patched qt)', `bin/wkhtmltopdf --version`.strip) if macos?
  end

  private

  def test(with:)
    assert_equal('wkhtmltopdf 0.12.6 (with patched qt)', `docker-compose run --rm #{with}`.strip) unless macos?
  end
end
