# 0.12.6.10

- Add support for Debian 13 (with Debian 12 binaries)

# 0.12.6.9

- Add support to ubuntu 22.04 and 24.04 in arm64
- Add support for KDE Neon 22.04 & 24.04 (Ubuntu derivative)

# 0.12.6.8

- Add support for Ubuntu 24.04 using the Ubuntu 22.04 binary
- Add support for Linux Mint 22 using the Ubuntu 22.04 binary
- Add support for Alibaba Cloud Linux using the CentOS 8 binary
- Add support for AlmaLinux using the CentOS 8 binary
- Fix Amazon Linux 2023 support using the CentOS binaries

# 0.12.6.7

- Setup of GitHub action test automation for Linux/MacOS builds
- Add URLs to gemspec for inclusion on Rubygems.org
- Add support for several new Linux binaries for Debian, Centos, Ubuntu, Mint, Oracle, Tuxedo
- Add support for several arm64 Linux binaries

# 0.12.6.6

Add support for Ubuntu 22.04

# 0.12.6.5

Fix ability to use on Debian 9 systems

# 0.12.6.4

Fix version detection for Debian
Use version match check that works on older Ruby versions

# 0.12.6.3

Add support for Archlinux and Manjaro
Add ability to override which binary is detected for you based on `ENV['WKHTMLTOPDF_HOST_SUFFIX']`

# 0.12.6.2

OS mapping for more distros, based in official support OS for wkhtmltopdf

# 0.12.6.1

Add missing binary for Ubuntu 20.04

# 0.12.6
Update `wkhtmltopdf` binaries with version 0.12.6
Remove binary for Debian 8/Ubuntu 14.04/MacOS Carbon, that is not supported anymore by `wkhtmltopdf`
Add binary for Ubuntu 20.04

# 0.12.5.4
Remove accidental unpacked binary

# 0.12.5.3
Fix typo (missing question mark in `start_with`)

# 0.12.5.2
Add support for CentOS 8
Add support for Amazon Linux using the CentOS 6 binary
Add support for Linux Mint 19 and Elementary OS using the Ubuntu 18 binary
Use `exec` instead of `system` in binstub

# 0.12.5.1
Add support for Debian Buster (10)

# 0.12.5
Update `wkhtmltopdf` binaries with version 0.12.5

# 0.12.4
Update `wkhtmltopdf` binaries with version 0.12.4

# 0.12.3.1
Fix JRuby compatibility

# 0.12.3
Update `wkhtmltopdf` binaries with version 0.12.3

# 0.12.1
Update `wkhtmltopdf` binaries with version 0.12.1

# 0.9.9.2
Add Apache License
Use `/usr/bin/env` to find Ruby binary

# 0.9.9.1
Update MacOS `wkhtmltopdf` binary to 0.9.9

# 0.9.9
Update `wkhtmltopdf` binaries with version 0.9.9
