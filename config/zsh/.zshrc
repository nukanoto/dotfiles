DOTPATH=~/dotfiles

## Deno
DENO_INSTALL=$HOME/.deno

# Cargo
if [ -f $HOME/.cargo/env ]; then
  source $HOME/.cargo/env
fi

mkdir -p /tmp/$USER-zsh-completions/
if hash rustup 2>/dev/null; then
    rustup completions zsh > /tmp/$USER-zsh-completions/_rustup
fi

fpath=(
    /tmp/$USER-zsh-completions/
    $fpath)

if hash rustc 2>/dev/null; then
    fpath=($(rustc --print sysroot)/share/zsh/site-functions $fpath)
fi

## Command alias
alias ls="exa"
alias yay='PATH="/bin/:$PATH" yay'
alias cat="bat"
alias vi="nvim"
alias lg="lazygit"
alias g="git"
alias less="less -RF"
alias rustcheck="RUSTFLAGS='-D warnings' cargo clippy && cargo fmt --all -- --check && cargo test"
alias linesSource='cat $(fd . "./src/" --type f) | wc -l';
alias rp='rsync --recursive --human-readable --partial --progress --dry-run'

function cast-eth() {
  cast $@ --rpc-url $MAINNET_RPC_URL
}

function cast-arb() {
  cast $@ --rpc-url $ARBITRUM_RPC_URL
}

function cast-avax() {
  cast $@ --rpc-url $AVAX_RPC_URL
}

bindkey -v # Use vim keybind
bindkey '^R' history-incremental-search-backward

# Change default editor to Neovim
export EDITOR=nvim

# prompt
export PURE_PROMPT_SYMBOL='%%'

function ghq-fzf() {
  local src=$(fd --base-directory=$HOME/repos/ --strip-cwd-prefix --max-depth 1 -td | fzf)
  if [ -n "$src" ]; then
    BUFFER="cd $HOME/repos/$src"
    zle accept-line
  fi
  zle -R -c
}

function faesenc() {
  openssl enc -pbkdf2 -aes-256-cbc -in $1 -out $1.enc -v
}

function faesdec() {
  openssl enc -d -pbkdf2 -aes-256-cbc -in $1.enc -out $1 -v
}

zle -N nvim-fzf
zle -N ghq-fzf

bindkey '^g' ghq-fzf

# direnv
eval "$(direnv hook zsh)"

autoload bashcompinit
bashcompinit

autoload -U compinit
compinit -u

autoload -Uz colors
colors

gpgconf --launch gpg-agent
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

source ~/.config/zsh/plugins.zsh
if [ -n "$PYTHONPATH" ]; then
    export PYTHONPATH='/home/yasuna/.local/lib/python3.10/site-packages/pdm/pep582':$PYTHONPATH
else
    export PYTHONPATH='/home/yasuna/.local/lib/python3.10/site-packages/pdm/pep582'
fi

# asdf
source /opt/asdf-vm/asdf.sh

# huff
export PATH="$PATH:/home/yasuna/.huff/bin"

