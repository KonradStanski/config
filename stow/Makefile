# USAGE: make TARGET

dir = $(shell uname)
folding=--no-folding
# folding=


.PHONY : stow
stow :
	stow $(folding) --target $(HOME) --verbose common
	stow $(folding) --target $(HOME) --verbose $(dir)

.PHONY : verbose
# verbosity goes from 0 to 4
VERBOSITY=1
verbose :
	stow $(folding) --verbose $(VERBOSITY) --target $(HOME) --verbose common
	stow $(folding) --verbose $(VERBOSITY) --target $(HOME) --verbose $(dir)

.PHONY : dry
dry :
	stow $(folding) --no --target $(HOME) --verbose common
	stow $(folding) --no --target $(HOME) --verbose $(dir)

.PHONY : restow
restow :
	stow $(folding) --target $(HOME) --verbose --restow common
	stow $(folding) --target $(HOME) --verbose --restow $(dir)

# Do this *before* moving to another directory.
.PHONY : delete
delete :
	stow $(folding) --target $(HOME) --verbose --delete common
	stow $(folding) --target $(HOME) --verbose --delete $(dir)

.PHONY : adopt
adopt :
	stow $(folding) --target $(HOME) --verbose --adopt common
	stow $(folding) --target $(HOME) --verbose --adopt $(dir)
