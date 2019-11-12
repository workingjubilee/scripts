#!/bin/sh

# What do we want to know?
# step 1: what is the main package manager for the system?
# solution a: canonical list
# solution b: ask the user
# solution c: both?
# also, how do we detect if we are on git bash for windows?
# unsolved?
# or mac? we could be running on both of those environments
# make --version might contain useful information!
# ldd --version also!
# in descending order of expectation

PM_BREW=$(brew --version) # mac or linuxbrew
PM_APT=$(apt-get --version) # debian family
PM_YUM=$(yum --version) # redhat family
PM_PACMAN=$(pacman --version) #arch family
PM_PKGTOOL=$(installpkg --version) #slackware family
PM_EMERGE=$(emerge --version) #gentoo family
echo $PM_APT
echo "$(PM_YUM)1"
# so, we should get an empty string in all cases that there is no PM there
# we iterate through all cases and total the number of PMs
# if 1 PM is found, we can assume it is the default PM
# if 0 or 2+ PMs are found, we have to ask for config