# 0.12.6.x

- Setup of Github action automation for Linux/MacOS builds

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

