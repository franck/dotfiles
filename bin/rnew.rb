#!/usr/bin/env ruby

path = ARGV[0]
fail "specify file name to create" unless path
File.open(path, 'w') {|f| f.puts "!/usr/bin/env ruby" }
File.chmod(0755, path)
system 'vi', path
