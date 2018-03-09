#!/usr/bin/ruby

require 'line_containing'

# WICHTIG: enable ssl
puts 'Automatically enabling the use of SSL'
LineContaining.replace('config.force_ssl = true', '  config.force_ssl = true', 'config/environments/production.rb')
