if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias "vim=nvim"
alias "vi=nvim"
alias "c=xclip -selection clipboard"
alias "v=xclip -o -selection clipboard"
alias "ls=exa --icons"
alias "calendar=remind -c1 ~/.config/remind/reminders.rem"
alias "reload-fish=source ~/.config/fish/config.fish && source ~/.config/fish/conf.d/*.fish"

export PATH="$PATH:$HOME/.cargo/bin"
export DEBUGINFOD_URLS="https://debuginfod.elfutils.org/"
export PATH="$PATH:/usr/bin/pygmentize"
export TERMINAL=alacritty

pyenv init - | source

# opam configuration
source /home/jtstr/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
