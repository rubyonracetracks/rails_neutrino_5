#!/usr/bin/ruby

require 'string_in_file'
require 'gemfile_entry'
require 'line_containing'

puts 'Adding devise to the Gemfile'
StringInFile.add_end("\n", 'Gemfile')
StringInFile.add_end("#{GemfileEntry.latest('devise')} # Provides admin/user authentication", 'Gemfile')

puts 'bundle install --quiet'
system('bundle install --quiet')

system('sh kill_spring.sh')
puts 'rails generate devise:install'
system('rails generate devise:install')

puts 'Updating the email address in config/initializers/devise.rb'
LineContaining.replace('config.mailer_sender', "  config.mailer_sender = 'somebody@rubyonracetracks.com'", 'config/initializers/devise.rb')

puts 'Updating .rubocop.yml'
LineContaining.add_before('# END: Metrics/LineLength', '    - config/initializers/devise.rb', ".rubocop.yml")
