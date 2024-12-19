#
# ~/.bashrc
#

tmux_cleanup_and_create() {
    # List all tmux sessions and filter out the active ones
    inactive_sessions=$(tmux list-sessions -F "#{session_name}:#{?session_attached,active,inactive}" | grep "inactive" | cut -d":" -f1)

    # Kill all inactive sessions
    for session in $inactive_sessions; do
        tmux kill-session -t "$session"
    done

    # Create a new tmux session for the current terminal window
    tmux new-session
}

# Check if not already inside a tmux session
if [ -z "$TMUX" ]; then
    tmux_cleanup_and_create
fi

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -l'
alias ff='fastfetch'
alias nf='neofetch'
alias c='clear'
alias cl='clear && ls'
alias vim='nvim'
alias grep='grep --color=auto'
alias gl='git log -n 10 --oneline --graph --all'
alias up='sudo nala update && sudo nala upgrade -y && flatpak update -y'
PS1='[\u@\h \W]\$ '
export PATH=$PATH:$HOME/go/bin
export PATH=$HOME/.local/bin:$PATH
