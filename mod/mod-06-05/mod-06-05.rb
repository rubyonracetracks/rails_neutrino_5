#!/usr/bin/ruby

require 'line_containing'
require 'insert_from_file'
require 'string_in_file'
require 'gemfile_entry'

puts 'Updating db/seeds.rb'
system('mv mod-06-05-seeds.rb db/seeds.rb')

# WICHTIG/LEGACY/bash: bin/dseed
puts 'Adding bin/dseed'
system('mv mod-06-05-bin-dseed bin/dseed')

# WICHTIG/LEGACY/bash: seed.sh
puts 'Adding seed.sh'
system('mv mod-06-05-seed.sh seed.sh')

# WICHTIG/LEGACY/bash: add seed.sh to all.sh
puts 'Updating all.sh'
LineContaining.add_after('sh test_app.sh', 'sh seed.sh', 'all.sh')
