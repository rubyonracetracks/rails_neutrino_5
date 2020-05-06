#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'gemfile_entry'
require 'string_in_file'

# WICHTIG/LEGACY/production: enable ssl (if necessary)
puts 'Automatically enabling the use of SSL'
LineContaining.replace('config.force_ssl = true', '  config.force_ssl = true', 'config/environments/production.rb')

# WICHTIG/LEGACY/recommended: add brakeman, bundler-audit, gemsurance, and sandi_meter to the Gemfile
puts 'Updating the Gemfile'
LineContaining.add_before('rubocop', "  # gem 'brakeman'", "Gemfile")
LineContaining.add_before('rubocop', "  # gem 'bundler-audit'", "Gemfile")
LineContaining.add_before('rubocop', "  # gem 'gemsurance'", "Gemfile")
LineContaining.add_after('rubocop', "  # gem 'sandi_meter'", "Gemfile")

# Updating .gitignore
StringInFile.add_end("gemsurance_report.html\n", '.gitignore')

# WICHTIG/LEGACY/bash: add test_code.sh to all.sh
puts 'Adding test_code.sh to all.sh'
StringInFile.add_end("sh test_code.sh\n", 'all.sh')
