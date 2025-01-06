# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
neofetch

# Created by `pipx` on 2024-02-19 18:17:27
export PATH="$PATH:/home/sensy/.local/bin"
export EDITOR=nvim
# export PATH="$PATH:/home/sensy/Downloads/zig-linux-x86_64-0.12.0-dev.2063+804cee3b9/"
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="nvim -d"
alias ls="eza --grid --icons --header --git"
alias la="eza -all --grid --icons --header --git"
alias l="eza -all --grid --icons --header --git"
alias zelle="zellij -l strider"
alias sshpi="ssh sensy@192.168.69.118"

eval "$(starship init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
