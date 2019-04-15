# wkhtmltopdf_binary_gem

Hints for extracting binaries from https://wkhtmltopdf.org/downloads.html (dpkg and rpm2cpio is available on Homebrew).

Debian/Ubuntu

    dpkg -x wkhtmltox_0.12.5-1.trusty_amd64.deb .

CentOS

    rpm2cpio wkhtmltox-0.12.5-1.centos7.x86_64.rpm | cpio -idmv

macOS

    xar -xf wkhtmltox-0.12.5-1.macos-cocoa.pkg
    cat Payload | gunzip -dc | cpio -i
