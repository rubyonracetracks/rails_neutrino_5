#!/usr/bin/ruby

require 'line_containing'
require 'gemfile_entry'

LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('brakeman')}", "Gemfile")
LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('bundler-audit')}", "Gemfile")
LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('gemsurance')}", "Gemfile")
LineContaining.add_before('rubocop', "  #{GemfileEntry.latest('rails_best_practices')}", "Gemfile")
LineContaining.add_after('rubocop', "  #{GemfileEntry.latest('sandi_meter')}", "Gemfile")
