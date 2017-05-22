#!/usr/bin/ruby

require 'string_in_file'
require 'gemfile_entry'

puts 'Adding bootstrap-sass to the Gemfile'
StringInFile.add_end("\n", 'Gemfile')
StringInFile.add_end("#{GemfileEntry.latest('bootstrap-sass')} # Bootstrap styling", 'Gemfile')

puts 'bundle install --quiet'
system('bundle install --quiet')

system('mv mod-04-04-custom.scss app/assets/stylesheets/custom.scss')

# NOTE: If you were going through the Rails Neutrino steps manually,
# you would need to restart the local web server at this point to avoid
# getting a syntax error message when reloading the page.
