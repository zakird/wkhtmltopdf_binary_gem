[![CI](https://github.com/zakird/wkhtmltopdf_binary_gem/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/zakird/wkhtmltopdf_binary_gem/actions/workflows/ci.yml)
[![Vagrantfile](https://github.com/zakird/wkhtmltopdf_binary_gem/actions/workflows/vagrantfile.yml/badge.svg?branch=master)](https://github.com/zakird/wkhtmltopdf_binary_gem/actions/workflows/vagrantfile.yml)
[![Gem Version](https://badge.fury.io/rb/wkhtmltopdf-binary.svg)](https://badge.fury.io/rb/wkhtmltopdf-binary)
[![Gem](https://img.shields.io/gem/dt/wkhtmltopdf-binary.svg)]()
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/zakird/wkhtmltopdf_binary_gem)

# Installation and usage

Install in your Gemfile as usual

```ruby
gem 'wkhtmltopdf-binary'
```

In many environments, this is all you need to do. This gem installs a binary stub that tries to determine which wkhtmltopdf binary will work on your system, and point to the packaged binary that most closely matches.

In some environments, invoking this binary will result in an error, saying the needed permissions are not available.
This is because `wkhtmltopdf-binary` ships with gzipped binaries for many platforms, and then picks the appropriate one upon first use and unzips it into the same directory. So if your ruby gem binaries are installed here (for example, considering Ruby 2.6 and gem in version 0.12.6.5):

    /usr/lib/ruby/versions/2.6/bin/

The various wkhtmltopdf-binaries will be installed here:

    /usr/lib/ruby/versions/2.6/lib/ruby/gems/2.6.0/gems/wkhtmltopdf-binary-0.12.6.5/bin/

Giving write access whatever user is running your program (e.g. web server, background job processor), e.g. your own personal user in a dev environment, will fix the problem. After the binary is uncompressed, write access can be revoked again if desired.

    chmod -R 777 /usr/lib/ruby/versions/2.6/lib/ruby/gems/2.6.0/gems/wkhtmltopdf-binary-0.12.6.5/bin/

# Gem Development

## Extracting binaries

Hints for extracting binaries from https://wkhtmltopdf.org/downloads.html (dpkg and rpm2cpio is available on Homebrew).

Debian/Ubuntu

    dpkg -x wkhtmltox_0.12.5-1.trusty_amd64.deb .

CentOS

    rpm2cpio wkhtmltox-0.12.5-1.centos7.x86_64.rpm | cpio -idmv

Archlinux/Manjaro

    tar -xf wkhtmltox-0.12.6-1.archlinux.x86_64.tar.xz

macOS

    xar -xf wkhtmltox-0.12.5-1.macos-cocoa.pkg
    cat Payload | gunzip -dc | cpio -i

## GZIP Compression

Binaries should be compressed with `gzip --best` after extracting. The matching binary will be extracted on first
execution of `bin/wkhtmltopdf`.

Hints for compressing binaries

Debian/Ubuntu
    user/local/bin refers to the extracted binaries directory
    gzip --best -c usr/local/bin/wkhtmltopdf > wkhtmltopdf_ubuntu_22.04.amd64.gz

## Testing

To execute gem tests locally, install:

- VirtualBox
- Vagrant

Then, execute the commands below:

```bash
git clone https://github.com/zakird/wkhtmltopdf_binary_gem
cd wkhtmltopdf_binary_gem/
vagrant up
vagrant ssh -c "sudo su && cd /vagrant && RUNNER_OS=Linux bundle exec rake"
```
