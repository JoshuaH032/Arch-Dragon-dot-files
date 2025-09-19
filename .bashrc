# ~/.bashrc — Arch-Dragon Autumn Mosaic 🌅🐉
# Minimal + colorful + reload toolkit

# Bail if non-interactive
[[ $- != *i* ]] && return

# --- Locale ---
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# --- Wayland tweaks ---
export NIXOS_OZONE_WL=1
export QT_QPA_PLATFORM=wayland
export XDG_SESSION_TYPE=wayland

# --- Bash behavior niceties ---
shopt -s histappend checkwinsize cdspell autocd
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:ignorespace
HISTTIMEFORMAT="%F %T "
PROMPT_COMMAND='history -a; history -c; history -r'

# --- Bash completion ---
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi
fi

# Extra completions
complete -o default -o filenames nano
complete -o default -o filenames config

# --- Colors for ls/grep ---
if command -v dircolors >/dev/null 2>&1; then
  [[ -f ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# QoL aliases
alias ..='cd ..'
alias ...='cd ../..'
alias update='sudo pacman -Syu'
cleanup() {                           # remove orphans safely
  local o; o="$(pacman -Qdtq 2>/dev/null || true)"
  [[ -n "$o" ]] && sudo pacman -Rns $o || echo "🌿 No orphaned packages."
}

# --- Reload toolkit ---
reload() {
  source ~/.bashrc && echo -e "🍂 Bashrc reloaded!"
}
reload.alacritty() {
  pkill -USR1 -x alacritty && echo -e "🔥 Alacritty config reloaded!"
}
reload.waybar() {
  pkill waybar && waybar & disown
  echo -e "📊 Waybar reloaded!"
}

# --- Terminal title ---
set_title() { printf "\033]2;%s\007" "$*"; }
PROMPT_COMMAND="set_title \"\u@\h: \w\"; $PROMPT_COMMAND"

# --- Autumn Mosaic Prompt ---
PS1='\[\e[38;5;208m\]\u\[\e[0m\]@\[\e[38;5;130m\]\h \[\e[38;5;172m\]\W\[\e[0m\]\$ '

# --- Arch-Dragon Autumn Welcome ---
clear
echo -e "\e[38;5;208m======================================\e[0m"
echo -e "   🐉 Welcome back, \e[38;5;172mArch-Dragon\e[0m"
echo -e "   Host:   \e[35m$(uname -n)\e[0m"
echo -e "   Kernel: \e[32m$(uname -r)\e[0m"
echo -e "   Uptime: \e[33m$(uptime -p | cut -d ' ' -f2-)\e[0m"
echo -e "   Date:   \e[36m$(date)\e[0m"
echo -e "\e[38;5;208m======================================\e[0m"
echo -e "   🍁 ArchLinux is ready to serve you 🍁"
echo

# --- Fastfetch (if available) ---
command -v fastfetch >/dev/null 2>&1 && fastfetch

# --- Dotfiles alias (bare git repo) ---
alias config='/usr/bin/git --git-dir=/home/joshuah/.cfg/ --work-tree=/home/joshuah'
