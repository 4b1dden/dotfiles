# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ ! -f ${HOME}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source $HOME/.zcomet/bin/zcomet.zsh

zcomet load ohmyzsh plugins/git
# Comment out vi-mode if you hate being productive
zcomet load ohmyzsh plugins/vi-mode
zcomet load ohmyzsh lib/history.zsh lib/directories.zsh lib/completion.zsh lib/termsupport.zsh

zcomet load zsh-users/zsh-completions
zcomet load zdharma-continuum/fast-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions
zcomet load romkatv/powerlevel10k

# The following lines were added by compinstall
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==32=00}:${(s.:.)LS_COLORS}")'
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# End of lines added by compinstall

autoload -Uz zmv
zcomet compinit
setopt extended_glob
setopt noclobber nohup
setopt interactivecomments

export HISTSIZE=100000
export SAVEHIST=100000

if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

if type rsync > /dev/null; then
  alias cp="rsync -avzP"
fi

alias rm="rm -i"

# Put local settings for this computer into ~/.zshrc_local
[ -f ~/.zshrc_local ] && . ~/.zshrc_local

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 70% --reverse --info=inline --multi --preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:002,hl+:034,pointer:032,marker:010,bg+:237,gutter:008'
--prompt='∼ ' --pointer='❯' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# START ALIASES
alias vi=nvim
alias vim=nvim
