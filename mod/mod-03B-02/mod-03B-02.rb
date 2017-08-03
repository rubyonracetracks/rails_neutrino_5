#!/usr/bin/ruby

require 'insert_from_file'
require 'gemfile_entry'
require 'string_in_file'
require 'line_containing'

puts 'Adding annotate, railroady, and rails-erd to the Gemfile'
InsertFromFile.add_end('mod-03B-02-Gemfile.txt', 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')
StringInFile.replace("gem 'annotate'", "#{GemfileEntry.active('annotate')}", 'Gemfile')
StringInFile.replace("gem 'railroady'", "#{GemfileEntry.active('railroady')}", 'Gemfile')
StringInFile.replace("gem 'rails-erd'", "#{GemfileEntry.active('rails-erd')}", 'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')

puts 'Adding outline-short.sh'
system('mv mod-03B-02-outline-short.sh outline-short.sh')

puts 'Adding outline.sh'
system('mv mod-03B-02-outline.sh outline.sh')

puts 'Adding outline-short.sh to git_check.sh'
InsertFromFile.add_end('mod-03B-02-git_check.txt', 'git_check.sh')

puts 'Adding outline.sh to all.sh'
LineContaining.add_before('sh test_code.sh', 'sh outline.sh', 'all.sh')
