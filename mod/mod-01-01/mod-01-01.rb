#!/usr/bin/ruby
require 'insert_from_file'

# WICHTIG/LEGACY/master: Add .DS_Store to the .gitignore file
puts '-----------------------------------------------------------'
puts 'Updating .gitignore to mark the initial contents and to add'
puts 'pesky files you do not want committed, such as .DS_Store.'
InsertFromFile.add_beginning('mod-01-01-gitignore_start.txt', '.gitignore')
InsertFromFile.add_end('mod-01-01-gitignore_end.txt', '.gitignore')

puts '-------------------------------------------------'
puts 'Updating the Gemfile to mark the initial contents'
InsertFromFile.add_beginning('mod-01-01-Gemfile_start.txt', 'Gemfile')
InsertFromFile.add_end('mod-01-01-Gemfile_end.txt', 'Gemfile')
