# USAGE: make TARGET dir=macos
#        make TARGET dir=linux

dir = macos
# folding=--no-folding
folding=


.PHONY : stow
stow :
	stow $(folding) --target $(HOME) --verbose $(dir)

.PHONY : stow-verbose
# verbosity goes from 0 to 4
VERBOSITY=1
stow-verbose :
	stow $(folding) --verbose $(VERBOSITY) --target $(HOME) --verbose $(dir)

.PHONY : dry-run
dry-run :
	stow $(folding) --no --target $(HOME) --verbose $(dir)

.PHONY : restow
restow :
	stow $(folding) --target $(HOME) --verbose --restow $(dir)

# Do this *before* moving to another directory.
.PHONY : delete
delete :
	stow $(folding) --target $(HOME) --verbose --delete $(dir)

.PHONY : adopt
adopt :
	stow $(folding) --target $(HOME) --verbose --adopt $(dir)
