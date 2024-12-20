#!/usr/bin/env bash

setup_colors() {
  # Check if function has already run
  if [[ -n "${SETUP_COLORS_COMPLETE:-}" ]]; then
    return 0
  fi

  # Check if colors should be enabled
  local use_colors=true
  if [[ ! -t 2 ]] || [[ -n "${NO_COLOR-}" ]] || [[ "${TERM-}" == "dumb" ]]; then
    use_colors=false
  fi

  # Function to set a readonly variable with conditional value
  set_color() {
    local var_name=$1
    local color_value=$2
    if [[ "$use_colors" == true ]]; then
      readonly "$var_name=$color_value"
    else
      readonly "$var_name="
    fi
  }

  # Basic formatting
  set_color RESET "\033[0m"
  set_color BOLD "\033[1m"
  set_color DIM "\033[2m"
  set_color UNDERLINE "\033[4m"

  # Standard colors
  set_color BLUE "\033[34m"
  set_color GREEN "\033[32m"
  set_color YELLOW "\033[33m"
  set_color RED "\033[31m"
  set_color CYAN "\033[36m"
  set_color MAGENTA "\033[35m"
  set_color BLACK "\033[30m"

  # Bright colors
  set_color BRIGHT_BLACK "\033[90m"
  set_color BRIGHT_BLUE "\033[94m"
  set_color BRIGHT_GREEN "\033[92m"
  set_color BRIGHT_YELLOW "\033[93m"
  set_color BRIGHT_RED "\033[91m"
  set_color BRIGHT_CYAN "\033[96m"
  set_color BRIGHT_MAGENTA "\033[95m"

  # Background colors
  set_color BG_BLACK "\033[40m"
  set_color BG_BLUE "\033[44m"
  set_color BG_BRIGHT_BLUE "\033[104m"
  set_color BG_MAGENTA "\033[45m"
  set_color BG_BRIGHT_MAGENTA "\033[105m"
  set_color BG_GREEN "\033[42m"
  set_color BG_BRIGHT_GREEN "\033[102m"
  set_color BG_CYAN "\033[46m"
  set_color BG_BRIGHT_CYAN "\033[106m"

  # Icons
  set_color INFO_ICON "ℹ"
  set_color SUCCESS_ICON "✔"
  set_color WARNING_ICON "⚠"
  set_color ERROR_ICON "✖"

  SETUP_COLORS_COMPLETE=1
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

setup_colors
