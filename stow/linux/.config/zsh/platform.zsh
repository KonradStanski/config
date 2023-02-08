# Platform specific zsh stuff goes in here.
# This is linux specific zsh stuff.

# enable fzf keybindings either from apt install or nixpkgs
if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] ; then
   source /usr/share/doc/fzf/examples/key-bindings.zsh
elif [ -f ~/.nix-profile/share/fzf/key-bindings.zsh ] ; then
   source ~/.nix-profile/share/fzf/key-bindings.zsh
fi
