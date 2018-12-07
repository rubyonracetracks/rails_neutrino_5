#!/usr/bin/ruby

require 'line_containing'

# WICHTIG/LEGACY/production: enable ssl (if necessary)
puts 'Automatically enabling the use of SSL'
LineContaining.replace('config.force_ssl = true', '  config.force_ssl = true', 'config/environments/production.rb')
