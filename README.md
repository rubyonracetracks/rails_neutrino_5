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

## Legacy Apps
* Each line in the source code that begins with "# WICHTIG" points to
features to add to legacy projects.  (The word "wichtig" is the German word for "important".)  The associated commands in the scripts are the instructions on how to implement these features.
* Download this repository and search the source code for "# WICHTIG".  You now have a handy to-do list of things to do in a legacy project.  You may need to make adjustments, but you won't forget anything.
* Please note that the RuboCop and Rails Best Practices gems are NOT recommended for legacy apps.  There will be hundreds or thousands of offenses, too many to correct in a reasonable amount of time.

## Naming
A neutrino is type of subatomic particle with no electrical charge that
moves at the speed of light and interacts extremely weakly with matter
in its path.  In fact, neutrinos interact so weakly with objects in
their path that they fly through the entire diameter of the Earth unimpeded.

Similarly, Rails Neutrino creates a new app very rapidly because it
bypasses the need to manually read, open and close files, and cut and
paste text.
