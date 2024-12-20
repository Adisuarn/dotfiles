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

    # Bright variants
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
  else
    readonly RESET="" BOLD="" DIM=""
    readonly BLUE="" GREEN="" YELLOW="" RED="" CYAN="" MAGENTA=""
    readonly BRIGHT_BLUE="" BRIGHT_GREEN="" BRIGHT_YELLOW="" BRIGHT_RED="" BRIGHT_CYAN="" BRIGHT_MAGENTA=""
    readonly INFO_ICON=""
    readonly SUCCESS_ICON=""
    readonly WARNING_ICON=""
    readonly ERROR_ICON=""
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
