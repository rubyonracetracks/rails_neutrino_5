#!/usr/bin/ruby

require 'line_containing'
require 'gemfile_entry'
require 'string_in_file'

LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('brakeman')}", "Gemfile")
LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('bundler-audit')}", "Gemfile")
LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('gemsurance')}", "Gemfile")
LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('rails_best_practices')}", "Gemfile")
LineContaining.add_after('rubocop', "  #{GemfileEntry.latest('sandi_meter')}", "Gemfile")

StringInFile.add_end("sh test_code.sh\n", 'build_fast.sh')
StringInFile.add_end("sh test_code.sh\n", 'all.sh')
