require 'minitest/autorun'

def macos?
  ENV['RUNNER_OS'] && ENV['RUNNER_OS'] == 'macOS'
end

def arm?
  ENV['ARM']
end

class WithDockerTest < Minitest::Test
  SETUP = begin
            `docker-compose build --no-cache` if !macos?
          end

  def test_centos_6
    test_on_x86 with: 'centos_6'
  end

  def test_centos_7
    test_on_x86 with: 'centos_7'
  end

  def test_centos_8
    test_on_x86 with: 'centos_8'
  end

  def test_debian_9
    test_on_x86_and_arm with: 'debian_9'
  end

  def test_debian_10
    test_on_x86_and_arm with: 'debian_10'
  end

  def test_debian_11
    test_on_x86_and_arm with: 'debian_11'
  end

  def test_debian_12
    test_on_x86_and_arm with: 'debian_12'
  end

  def test_with_ubuntu_16
    test_on_x86 with: 'ubuntu_16.04'
  end

  def test_with_ubuntu_18
    test_on_x86 with: 'ubuntu_18.04'
  end

  def test_with_ubuntu_20
    test_on_x86 with: 'ubuntu_20.04'
  end

  def test_with_ubuntu_22
   test_on_x86 with: 'ubuntu_22.04'
  end

  def test_with_archlinux
    test_on_x86 with: 'archlinux'
  end

  def test_rockylinux_8
    test_on_x86 with: 'rockylinux_8'
  end

  def test_with_macos
    assert_equal('wkhtmltopdf 0.12.6 (with patched qt)', `bin/wkhtmltopdf --version`.strip) if macos?
  end

  private

  def test_on_x86(with:)
    test_on_docker(with: with) if !macos? && !arm?
  end

  def test_on_x86_and_arm(with:)
    test_on_docker(with: with) unless macos?
  end

  def test_on_docker(with:)
    assert_match(/wkhtmltopdf 0\.12\.6(.1)? \(with patched qt\)/, `docker-compose run --rm #{with}`.strip)
  end
end
