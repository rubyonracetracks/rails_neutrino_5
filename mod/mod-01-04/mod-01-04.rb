#!/usr/bin/ruby

require 'insert_from_file'
require 'line_containing'
require 'gemfile_entry'
require 'string_in_file'

# WICHTIG/LEGACY/production: enable ssl (if necessary)
puts 'Automatically enabling the use of SSL'
LineContaining.replace('config.force_ssl = true', '  config.force_ssl = true', 'config/environments/production.rb')

# WICHTIG/LEGACY/recommended: add brakeman, bundler-audit, and gemsurance to the Gemfile
# WICHTIG/LEGACY/recommended: add brakeman, bundler-audit, and gemsurance to test_code.sh (if necessary)
# WICHTIG/LEGACY/recommended: add brakeman to git_check.sh
# WICHTIG/LEGACY/recommended: add gemsurance to upgrade_gems.sh

puts 'Updating the Gemfile'
LineContaining.add_before('rubocop', "  gem 'brakeman'", "Gemfile")
LineContaining.add_before('rubocop', "  gem 'bundler-audit'", "Gemfile")
LineContaining.add_before('rubocop', "  gem 'gemsurance'", "Gemfile")
LineContaining.add_before('rubocop', "  gem 'rails_best_practices'", "Gemfile")
LineContaining.add_after('rubocop', "  gem 'sandi_meter'", "Gemfile")
puts 'bundle install --quiet'
system('bundle install --quiet')
StringInFile.replace("gem 'brakeman'", GemfileEntry.active('brakeman'),'Gemfile')
StringInFile.replace("gem 'bundler-audit'", GemfileEntry.active('bundler-audit'),'Gemfile')
StringInFile.replace("gem 'gemsurance'", GemfileEntry.active('gemsurance'),'Gemfile')
StringInFile.replace("gem 'rails_best_practices'", GemfileEntry.active('rails_best_practices'),'Gemfile')
StringInFile.replace("gem 'sandi_meter'", GemfileEntry.active('sandi_meter'),'Gemfile')
puts 'bundle install --quiet'
system('bundle install --quiet')

# Updating .gitignore
StringInFile.add_end("gemsurance_report.html\n", '.gitignore')

# WICHTIG/LEGACY/bash: add test_code.sh to all.sh
puts 'Adding test_code.sh to all.sh'
StringInFile.add_end("sh test_code.sh\n", 'all.sh')
