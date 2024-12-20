#!/usr/bin/env bash

# Color setup
setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    # Basic colors
    readonly RESET="\033[0m"
    readonly BOLD="\033[1m"
    readonly DIM="\033[2m"
    readonly BLUE="\033[34m"
    readonly GREEN="\033[32m"
    readonly YELLOW="\033[33m"
    readonly RED="\033[31m"
    readonly CYAN="\033[36m"
    readonly MAGENTA="\033[35m"
    readonly BLACK="\033[30m"
    readonly BRIGHT_BLACK="\033[90m"
    readonly BRIGHT_BLUE="\033[94m"
    readonly BRIGHT_GREEN="\033[92m"
    readonly BRIGHT_YELLOW="\033[93m"
    readonly BRIGHT_RED="\033[91m"
    readonly BRIGHT_CYAN="\033[96m"
    readonly BRIGHT_MAGENTA="\033[95m"
    readonly INFO_ICON="ℹ"
    readonly SUCCESS_ICON="✔"
    readonly WARNING_ICON="⚠"
    readonly ERROR_ICON="✖"
    readonly BG_BLACK="\033[40m"
    readonly BG_BLUE="\033[44m"
    readonly BG_BRIGHT_BLUE="\033[104m"
    readonly BG_MAGENTA="\033[45m"
    readonly BG_BRIGHT_MAGENTA="\033[105m"
    readonly BG_GREEN="\033[42m"
    readonly BG_BRIGHT_GREEN="\033[102m"
    readonly BG_CYAN="\033[46m"
    readonly BG_BRIGHT_CYAN="\033[106m"
    readonly UNDERLINE="\033[4m"
  else
    readonly RESET="" BOLD="" DIM=""
    readonly BLUE="" GREEN="" YELLOW="" RED="" CYAN="" MAGENTA=""
    readonly BRIGHT_BLUE="" BRIGHT_GREEN="" BRIGHT_YELLOW="" BRIGHT_RED="" BRIGHT_CYAN="" BRIGHT_MAGENTA=""
    readonly INFO_ICON=""
    readonly SUCCESS_ICON=""
    readonly WARNING_ICON=""
    readonly ERROR_ICON=""
    readonly BLACK=""
    readonly BRIGHT_BLACK=""
    readonly BG_BLACK=""
    readonly BG_BLUE=""
    readonly BG_BRIGHT_BLUE=""
    readonly BG_MAGENTA=""
    readonly BG_BRIGHT_MAGENTA=""
    readonly BG_GREEN=""
    readonly BG_BRIGHT_GREEN=""
    readonly BG_CYAN=""
    readonly BG_BRIGHT_CYAN=""
    readonly UNDERLINE=""
  fi
}

# Enhanced logging functions with icons and colored text
log_info() { printf "${BRIGHT_BLUE}${BOLD}${INFO_ICON}${RESET} ${BLUE}%s${RESET}\n" "$1"; }
log_success() { printf "${BRIGHT_GREEN}${BOLD}${SUCCESS_ICON}${RESET} ${GREEN}%s${RESET}\n" "$1"; }
log_warning() { printf "${BRIGHT_YELLOW}${BOLD}${WARNING_ICON}${RESET} ${YELLOW}%s${RESET}\n" "$1"; }
log_error() { printf "${BRIGHT_RED}${BOLD}${ERROR_ICON}${RESET} ${RED}%s${RESET}\n" "$1" >&2; }

# Helper for formatted output
fmt_key() { printf "${CYAN}${BOLD}%s${RESET}" "$1"; }
fmt_value() { printf "${BRIGHT_CYAN}%s${RESET}" "$1"; }
fmt_cmd() { printf "${MAGENTA}${BOLD}%s${RESET}" "$1"; }
fmt_path() { printf "${BRIGHT_BLUE}%s${RESET}" "$1"; }
fmt_title() { printf "${BRIGHT_BLUE}${BOLD} %s ${RESET}\n" "$1"; }
fmt_title_underline() { printf "${BRIGHT_BLUE}${BOLD}${UNDERLINE}%s${RESET}\n" "$1"; }
fmt_title_border() {
  local text="$1"
  local len=${#text}
  printf "${BRIGHT_BLUE}${BOLD}┌─%s─┐${RESET}\n" "$(printf '─%.0s' $(seq "$len"))"
  printf "${BRIGHT_BLUE}${BOLD}│ %s │${RESET}\n" "$text"
  printf "${BRIGHT_BLUE}${BOLD}└─%s─┘${RESET}\n" "$(printf '─%.0s' $(seq "$len"))"
}
