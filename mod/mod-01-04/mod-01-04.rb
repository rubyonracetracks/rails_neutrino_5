#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'gemfile_entry'
require 'string_in_file'

puts 'Updating the Gemfile'
LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('brakeman')}", "Gemfile")
LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('bundler-audit')}", "Gemfile")
LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('gemsurance')}", "Gemfile")
LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('rails_best_practices')}", "Gemfile")
LineContaining.add_after('rubocop', "  #{GemfileEntry.latest('sandi_meter')}", "Gemfile")

puts 'bundle install --quiet'
system('bundle install --quiet')

puts 'Adding test_code.sh to all.sh'
StringInFile.add_end("sh test_code.sh\n", 'all.sh')

puts 'Updating .rubocop.yml to omit files in the tmp directory'
InsertFromFile.add_before('mod-01-04-rubocop.txt', '.rubocop.yml', '# END: AllCops')
