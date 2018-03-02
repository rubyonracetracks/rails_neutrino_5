# Rails Neutrino: Automatic Rails App Generator

Welcome to Rails Neutrino!  This repository automatically creates a new
high-quality Rails 5 app from scratch.  It takes just a few minutes to 
complete a task that would require many hours of grueling work to do manually.

## Usage
* Enter the command "sh main.sh" to automatically create a new Rails app,
starting from the "rails new" step.  The resulting app's name contains
a time stamp.
* Enter the command "sh short.sh".  This performs the same procedure as the
main.sh script does, but the resulting app's name is "tmp1".  This script
is used in the development process, because skipping the outlining process
in each chapter saves time.  The longer main.sh script is used to generate
the template app used by the Generic App gem.

## Naming
A neutrino is type of subatomic particle with no electrical charge that
moves at the speed of light and interacts extremely weakly with matter
in its path.  In fact, neutrinos interact so weakly with objects in
their path that they fly through the entire diameter of the Earth unimpeded.

Similarly, Rails Neutrino creates a new app very rapidly because it
bypasses the need to manually read, open and close files, and cut and
paste text.

## Features
* Includes Bash scripts for completing routine multi-step tasks in only one step
* Includes a script for automatically setting up PostgreSQL
* Uses the devise gem to provide user and admin authentication
* Keeps user information private (until manually changed in a specific project)
* Includes the ability to resend confirmation emails, reset passwords, and lock accounts
* Uses the timecop gem to test temporarily locked accounts
* Includes RuboCop, Brakeman, bundler-audit, Gemsurance, and Rails Best Practices gems
* Includes comprehensive model, controller, and Capybara integration tests (including tests of the email confirmation process)
* Preconfigured for deploying to Heroku
* Automatically pins the gems in the Gemfile for easier upgrading later
* Enables SSL and the Puma web server
* Prevents accidental data destruction in the production environment by requiring the right environment variable setting
* Configures Minitest Reporters to provide bright red and green output and to list the commands to run the failed tests again
* Includes the Annotate, RailRoady, and Rails ERD gems for automatically outlining the app
* Includes the MailCatcher gem for viewing confirmation email messages in the development environment in the local browser
* Includes the Better Errors, binding_of_caller, and pry-rails gems
