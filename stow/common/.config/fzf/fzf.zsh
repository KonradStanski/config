export FZF_DEFAULT_OPTS='--bind=k:up,j:down,q:close,tab:accept'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
