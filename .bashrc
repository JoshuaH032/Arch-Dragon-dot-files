# ~/.bashrc  — Arch-Dragon minimal + purple prompt + fastfetch

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

# --- Colors for ls/grep (use ~/.dircolors if present) ---
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
  [[ -n "$o" ]] && sudo pacman -Rns $o || echo "No orphaned packages."
}

# --- Kitty/terminal title (nice with tiling bars) ---
set_title() { printf "\033]2;%s\007" "$*"; }
PROMPT_COMMAND="set_title \"\u@\h: \w\"; $PROMPT_COMMAND"

# --- Purple prompt to match the astral theme ---
# username (violet) @ host (deep blue) cwd (lavender)
PS1='\[\e[38;5;135m\]\u\[\e[0m\]@\[\e[38;5;63m\]\h \[\e[38;5;141m\]\W\[\e[0m\]\$ '

# --- Arch-Dragon Welcome ---
clear
echo -e "\e[36m======================================\e[0m"
echo -e "   🐉 Welcome back, Arch-Dragon 🧊"
echo -e "   Host: \e[35m$(uname -n)\e[0m"
echo -e "   Kernel: \e[32m$(uname -r)\e[0m"
echo -e "   Uptime: \e[33m$(uptime -p | cut -d ' ' -f2-)\e[0m"
echo -e "   Date:   \e[36m$(date)\e[0m"
echo -e "\e[36m======================================\e[0m"
echo -e "   🐧 ArchLinux is ready to serve you 🐧"
echo

# --- Fastfetch (if available) ---
command -v fastfetch >/dev/null 2>&1 && fastfetch

# ~/.warp-proxy-on
export ALL_PROXY="socks5h://127.0.0.1:40000"
export HTTP_PROXY="$ALL_PROXY"
export HTTPS_PROXY="$ALL_PROXY"
export NO_PROXY="127.0.0.1,localhost,::1"

# ~/.warp-proxy-off
unset ALL_PROXY HTTP_PROXY HTTPS_PROXY NO_PROXY

alias config='/usr/bin/git --git-dir=/home/joshuah/.cfg/ --work-tree=/home/joshuah'
alias config='/usr/bin/git --git-dir=/home/joshuah/.cfg/ --work-tree=/home/joshuah'
