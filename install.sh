#!/usr/bin/env bash

#
# Improved NixOS Flake Installation Script
#
# This script guides a user through setting up a new NixOS configuration
# from this flake, personalizing it with their username and host type.
#

# --- Configuration ---
# The placeholder username that exists in the template files.
# This string will be replaced with the user's actual username.
# IMPORTANT: If you change this, you must also change it in the template files.
readonly PLACEHOLDER_USERNAME="__USERNAME__"

# --- Script Setup ---
# Exit immediately if a command exits with a non-zero status.
set -e

# --- Formatting and Colors ---
# Use printf for better portability and to avoid issues with 'echo -e'.
# Colors are disabled if the terminal is not interactive.
if [ -t 1 ]; then
  readonly T_BOLD=$(tput bold)
  readonly T_UNDERLINE=$(tput smul)
  readonly T_RED=$(tput setaf 1)
  readonly T_GREEN=$(tput setaf 2)
  readonly T_YELLOW=$(tput setaf 3)
  readonly T_BLUE=$(tput setaf 4)
  readonly T_MAGENTA=$(tput setaf 5)
  readonly T_CYAN=$(tput setaf 6)
  readonly T_NORMAL=$(tput sgr0)
else
  readonly T_BOLD=""
  readonly T_UNDERLINE=""
  readonly T_RED=""
  readonly T_GREEN=""
  readonly T_YELLOW=""
  readonly T_BLUE=""
  readonly T_MAGENTA=""
  readonly T_CYAN=""
  readonly T_NORMAL=""
fi

# --- Helper Functions ---

# Prints a formatted header for a section.
# Usage: print_section "Setting up User"
print_section() {
  # The final \n\n adds a blank line after the header for spacing.
  printf "\n%s\n\n" "${T_BLUE}===${T_NORMAL} ${T_BOLD}$1${T_NORMAL} ${T_BLUE}===${T_NORMAL}"
}

# Prints an error message and exits.
# Usage: die "Failed to copy hardware config."
die() {
  printf "\n%sError: %s%s\n" "${T_RED}" "$1" "${T_NORMAL}" >&2
  exit 1
}

# Prompts the user for a yes/no confirmation.
# Exits if the user does not answer 'y' or 'Y'.
# Usage: confirm "Continue with installation?"
confirm() {
  printf "%s" "$1 [${T_GREEN}y${T_NORMAL}/${T_RED}n${T_NORMAL}]: "
  read -n 1 -r REPLY
  printf "\n"
  if [[ ! "$REPLY" =~ ^[Yy]$ ]]; then
    printf "Installation cancelled by user.\n"
    exit 0
  fi
}

# --- Main Functions ---

print_header() {
  printf "%sNixOS Flake Installer%s\n\n" "${T_BOLD}" "${T_NORMAL}"
  printf "%sWarning: This script will modify system configuration files.%s\n" "${T_YELLOW}" "${T_NORMAL}"
  printf "         Ensure you have backups if necessary.\n"
}

check_root() {
  if [ "$EUID" -eq 0 ]; then
    die "This script should not be run as root. The 'nixos-rebuild' command will ask for sudo password when needed."
  fi
}

get_username() {
  local username_input
  print_section "Username Configuration"
  while true; do
    read -rp "Enter your desired username: " username_input
    if [[ -z "$username_input" ]]; then
      printf "%sUsername cannot be empty. Please try again.%s\n" "${T_RED}" "${T_NORMAL}"
    else
      # Username is valid (not empty), set it and exit the loop.
      USERNAME="$username_input"
      printf "Username set to: %s%s%s\n" "${T_YELLOW}" "${USERNAME}" "${T_NORMAL}"
      break
    fi
  done
}

get_host() {
  print_section "Host Configuration"
  printf "Choose a host type:\n"
  printf "  [${T_YELLOW}D${T_NORMAL}]esktop\n"
  printf "  [${T_YELLOW}L${T_NORMAL}]aptop\n"
  printf "  [${T_YELLOW}V${T_NORMAL}]irtual Machine\n\n"

  local host_choice
  while true; do
    read -n 1 -rp "Enter your choice: " host_choice
    printf "\n"
    case "$host_choice" in
      [Dd]) HOST="desktop"; break ;;
      [Ll]) HOST="laptop";  break ;;
      [Vv]) HOST="vm";      break ;;
      *) printf "%sInvalid choice. Please try again.%s\n" "${T_RED}" "${T_NORMAL}" ;;
    esac
  done
  printf "Host type set to: %s%s%s\n" "${T_YELLOW}" "${HOST}" "${T_NORMAL}"
}

apply_configuration() {
  print_section "Applying Configuration"

  printf " > Replacing placeholder '%s' with '%s' in configuration files...\n" "${T_YELLOW}${PLACEHOLDER_USERNAME}${T_NORMAL}" "${T_YELLOW}${USERNAME}${T_NORMAL}"
  # Use find and sed to replace the placeholder in all .nix files.
  # This is more robust than targeting specific files.
  find . -type f -name "*.nix" -exec sed -i "s/${PLACEHOLDER_USERNAME}/${USERNAME}/g" {} +
  printf " > Replacement complete.\n\n"

  printf " > Setting up user directories...\n"
  mkdir -p "$HOME/Documents"
  mkdir -p "$HOME/Pictures/wallpapers"
  printf " > Done.\n\n"

  printf " > Copying wallpaper assets...\n"
  cp -r wallpapers/* "$HOME/Pictures/wallpapers/"
  printf " > Done.\n\n"

  local hardware_config_path="hosts/${HOST}/hardware-configuration.nix"
  printf " > Copying hardware configuration to '%s'...\n" "${T_MAGENTA}${hardware_config_path}${T_NORMAL}"
  if [ -f "/etc/nixos/hardware-configuration.nix" ]; then
    cp "/etc/nixos/hardware-configuration.nix" "$hardware_config_path"
    printf " > Done.\n"
  else
    die "Could not find '/etc/nixos/hardware-configuration.nix'. Please generate it first."
  fi
}

build_system() {
  print_section "System Build"
  confirm "Ready to build the system for host '${T_YELLOW}${HOST}${T_NORMAL}'. This will take some time. Proceed?"

  printf "\n%sExecuting: sudo nixos-rebuild switch --flake .#%s%s\n\n" "${T_CYAN}" "${HOST}" "${T_NORMAL}"
  if sudo nixos-rebuild switch --flake ".#${HOST}"; then
    printf "\n%sSystem build successful! Welcome to your new NixOS setup.%s\n" "${T_GREEN}${T_BOLD}" "${T_NORMAL}"
  else
    die "NixOS rebuild failed. Please check the errors above."
  fi
}

# --- Main Execution ---
main() {
  check_root
  print_header
  get_username
  get_host
  apply_configuration
  build_system
}

# Run the main function and exit with its status code.
main
