require 'minitest/autorun'

def macos?
  ENV['RUNNER_OS'] && ENV['RUNNER_OS'] == 'macOS'
end

class WithDockerTest < Minitest::Test
  SETUP = begin
    `docker-compose build --no-cache` unless macos?
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

  def test_with_ubuntu_16
   test with: 'ubuntu_16.04'
  end

  def test_with_ubuntu_18
   test with: 'ubuntu_18.04'
  end

  def test_with_ubuntu_20
   test with: 'ubuntu_20.04'
  end

  def test_with_archlinux
   test with: 'archlinux'
  end

  def test_with_macos
   assert_equal(`bin/wkhtmltopdf --version`.strip, 'wkhtmltopdf 0.12.6 (with patched qt)') if macos?
  end

  private

  def test(with:)
    assert_equal(`docker-compose run --rm #{with}`.strip, 'wkhtmltopdf 0.12.6 (with patched qt)') unless macos?
  end
end
