module Wkhtmltopdf
  class LinuxOsDetector

    def initialize(id, version)
      raise ArgumentError if id.nil? || version.nil?

      @id = id
      @version = version
      @extras = {}
    end

    def os
      gather_extra_information

      return special_cases if id.empty?
      return send(id) if self.respond_to?(id, true)
      "#{id}_#{version}"
    end

    private

    def gather_extra_information
      @extras['centos-release'] = File.read('/etc/centos-release') if File.exist?('/etc/centos-release')
    end

    def special_cases
      if @extras.key?('centos-release') && @extras['centos-release'].start_with?('CentOS release 6')
        'centos_6'
      end
    end

    def linuxmint
      case version
      when /^18/; 'ubuntu_16.04'
      when /^19/; 'ubuntu_18.04'
      when /^20/; 'ubuntu_20.04'
      when /^21/; 'ubuntu_22.04'
      end
    end

    def ubuntu
      case version
      when /^(16|17)/; 'ubuntu_16.04'
      when /^(18|19)/; 'ubuntu_18.04'
      when /^(20|21)/; 'ubuntu_20.04'
      when /^(22)/; 'ubuntu_22.04'
      end
    end

    def debian
      case version
      when '9'; 'debian_9'
      else; 'debian_10'
      end
    end

    def deepin
      'debian_9'
    end

    def amzn
      case version
      when '2'; 'centos_7'
      when /^2018/; 'centos_6'
      when /^2022/; 'centos_7'
      end
    end

    def rhel
      case version
      when /^8\./; 'centos_8'
      end
    end

    def rocky
      'centos_8'
    end

    def arch
      'archlinux'
    end

    def manjaro
      'archlinux'
    end

    def zorin
      'ubuntu_18.04'
    end

    def pop
      'ubuntu_18.04'
    end

    def elementary
      'ubuntu_18.04'
    end

    attr_reader :id, :version
  end
end
