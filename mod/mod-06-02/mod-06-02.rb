#!/usr/bin/ruby

require 'line_containing'
require 'insert_from_file'

puts 'Updating app/models/user.rb'
LineContaining.add_before('class User < ApplicationRecord', '#', 'app/models/user.rb')
LineContaining.add_after('class User < ApplicationRecord', '  # BEGIN: devise section', 'app/models/user.rb')
LineContaining.add_after('class User < ApplicationRecord', '  # BEGIN: public section', 'app/models/user.rb')
LineContaining.add_before('end', '  # END: devise section', 'app/models/user.rb')
LineContaining.add_before('end', '  # END: public section', 'app/models/user.rb')
InsertFromFile.replace_between('mod-06-02-devise.txt', 'app/models/user.rb', '# BEGIN: devise section', '# END: devise section')

puts 'Updating app/models/admin.rb'
LineContaining.add_before('class Admin < ApplicationRecord', '#', 'app/models/admin.rb')
LineContaining.add_after('class Admin < ApplicationRecord', '  # BEGIN: devise section', 'app/models/admin.rb')
LineContaining.add_after('class Admin < ApplicationRecord', '  # BEGIN: public section', 'app/models/admin.rb')
LineContaining.add_before('end', '  # END: devise section', 'app/models/admin.rb')
LineContaining.add_before('end', '  # END: public section', 'app/models/admin.rb')
InsertFromFile.replace_between('mod-06-02-devise.txt', 'app/models/admin.rb', '# BEGIN: devise section', '# END: devise section')
