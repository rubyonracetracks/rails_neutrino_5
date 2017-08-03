#!/usr/bin/ruby

require 'string_in_file'

StringInFile.add_beginning("#\n", 'app/models/user.rb')
StringInFile.add_beginning("#\n", 'app/models/admin.rb')
