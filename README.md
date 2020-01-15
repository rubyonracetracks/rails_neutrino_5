# Rails Neutrino: Automatic Rails App Generator

[![Build Status](https://travis-ci.org/rubyonracetracks/rails_neutrino_5.svg?branch=master)](https://travis-ci.org/rubyonracetracks/rails_neutrino_5)

Welcome to Rails Neutrino!  This repository automatically creates a new high-quality Rails 5 app from scratch.  It takes just a few minutes to  complete a task that would require many hours of grueling work to do manually.

## Usage
* Enter the command "sh main.sh" to automatically create a new Rails app, starting from the "rails new" step.  The resulting app's name contains a time stamp.
* Enter the command "sh short.sh".  This performs the same procedure as the main.sh script does, but the resulting app's name is "tmp1".  This script is used in the development process, because skipping the outlining process in each chapter saves time.  The longer main.sh script is used to generate the template app used by the Generic App gem.

## Legacy Apps
* Each line in the source code that begins with "# WICHTIG/LEGACY" points to features to add to legacy projects.  (The word "wichtig" is the German word for "important".)  The associated commands in the scripts are the instructions on how to implement these features.
* Download this repository and search the source code for "# WICHTIG/LEGACY".  You now have a handy to-do list of things to do in a legacy project.  You may need to make adjustments, but you won't forget the basic steps.
* Please note that the RuboCop and Rails Best Practices gems are NOT recommended for legacy apps.  There will be hundreds or thousands of offenses, too many to correct in a reasonable amount of time.

## Naming
A neutrino is type of subatomic particle with no electrical charge that moves at the speed of light and interacts extremely weakly with matter in its path.  In fact, neutrinos interact so weakly with objects in their path that nearly all of them fly through the entire diameter of the Earth unimpeded.

Similarly, Rails Neutrino allows you to create a new app very rapidly because the basic parts of creating a new Rails app from scratch is unimpeded by the need to manually open, read, edit, and close files

## Safety Features
* Advises users and admins to use KeePassX or similar password management software to create, encrypt, and save passwords
* Prevents accidental data destruction in the production environment by requiring the right environment variable setting
* Locks accounts after the 6th unsuccessful login attempt and reinstates them after the user/admin follows the unlocking instructions or waits 30 minutes, whichever comes first

## Privacy Features
* Keeps user information private (until manually changed in a specific project)
* Enables SSL

## Testing and Troubleshooting Features
* Includes comprehensive model, controller, and Capybara integration tests (including tests of the email confirmation process)
* Uses the timecop gem to test temporarily locked accounts
* Includes RuboCop, Brakeman, bundler-audit, Gemsurance, and Rails Best Practices gems
* Includes the MailCatcher gem for viewing confirmation email messages in the development environment in the local browser
* Includes the Better Errors, binding_of_caller, and pry-rails gems
* Includes the Annotate, RailRoady, and Rails ERD gems for automatically outlining the app

## Convenience Features
* Includes Bash scripts for completing routine multi-step tasks in only one step
* Includes a script for automatically setting up PostgreSQL
* Uses the devise gem to provide user and admin authentication
* Includes the ability to resend confirmation emails and reset passwords
* Preconfigured for deploying to Heroku
* Automatically pins the gems in the Gemfile for easier upgrading later
* Enables the Puma web server
