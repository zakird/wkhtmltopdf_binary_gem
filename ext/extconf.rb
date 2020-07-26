###
# wkhtmltopdf_binary_gem Copyright 2013 The University of Iowa
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy
# of the License at http://www.apache.org/licenses/LICENSE-2.0

require 'rbconfig'
require 'zlib'
require 'mkmf'

BUILD_PATH = File.dirname(File.expand_path(__FILE__))
# Check platform and upack binary
load "#{BUILD_PATH}/../bin/wkhtmltopdf"

MINIMIZE = %w(1 yes y yep true).any? do |e|
  ENV['WKHTMLTOPDF_GEM_MINIMIZE']&.downcase&.include? e
end

if MINIMIZE
  # Remove gziped binaries from the bin directory
  Dir.glob("#{File.dirname(binary)}/*.gz").each { |gz| File.delete(gz) }
end

# Write phony Makefile
File.write "#{BUILD_PATH}/Makefile", <<~MAKE
  all:

  clean:

  install:

MAKE
