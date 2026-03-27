source $HOME/.config/zsh/main.zsh

# EVERTHING BELOW IS NOT TRACKED BY GIT
# nvm (lazy-loaded)
export NVM_DIR="$HOME/.config/nvm"
nvm() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm "$@"; }
node() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; node "$@"; }
npm() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; npm "$@"; }
npx() { unset -f nvm node npm npx; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; npx "$@"; }

# bun completions
[ -s "/Users/konrad/.bun/_bun" ] && source "/Users/konrad/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source ~/.azshrc

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

wtadd() {
    local repo=$(basename $(git rev-parse --show-toplevel))
    local wtname=$1

    mkdir -p ~/wt/$repo

    git worktree add ~/wt/$repo/$wtname -b $wtname
}

wtrm() {
    local repo=$(basename $(git rev-parse --show-toplevel))
    local wtname=$1
    git worktree remove ~/wt/$repo/$wtname
}
