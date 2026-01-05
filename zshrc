if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

if [[ ! -f ${HOME}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source $HOME/.zcomet/bin/zcomet.zsh

zcomet load ohmyzsh plugins/git
# Comment out vi-mode if you hate being productive
zcomet load ohmyzsh plugins/vi-mode

zcomet load zsh-users/zsh-autosuggestions
zcomet load zsh-users/zsh-syntax-highlighting

zcomet compinit

# Put local settings for this computer into ~/.zshrc_local
[ -f ~/.zshrc_local ] && . ~/.zshrc_local

# enable fzf (CTRL + R fuzzy search over zsh history)
source <(fzf --zsh)

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# START ALIASES
alias vi=nvim
alias vim=nvim

[ -f "/Users/kiko/.ghcup/env" ] && . "/Users/kiko/.ghcup/env" # ghcup-env

export STM32_PRG_PATH=/Applications/STMicroelectronics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin
export PATH="$PATH:/Users/kiko/Library/Python/3.9/bin"

