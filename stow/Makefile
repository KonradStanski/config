#USAGE: make TARGET

# Worth looking into --override for common files to allow subclassing files and making hierarchies 

os_dir = $(shell uname | tr '[:upper:]' '[:lower:]')
# The following sets wether or not stow creates symlinked folders, or just regular folders. --no-folding mean regular folders.
folding=--no-folding
# folding=


.PHONY : stow
stow :
	stow $(folding) --target $(HOME) --verbose common $(os_dir)

.PHONY : verbose
# verbosity goes from 0 to 4
VERBOSITY=1
verbose :
	stow $(folding) --verbose $(VERBOSITY) --target $(HOME) --verbose common $(os_dir)

.PHONY : dry
dry :
	stow $(folding) --no --target $(HOME) --verbose common $(os_dir)

.PHONY : restow
restow :
	stow $(folding) --target $(HOME) --verbose --restow common $(os_dir)

.PHONY : delete
delete :
	stow $(folding) --target $(HOME) --verbose --delete common $(os_dir)

.PHONY : adopt
adopt :
	stow $(folding) --target $(HOME) --verbose --adopt common $(os_dir)
