#!/bin/bash

project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
source "${project_root}/scripts/utils.sh"

# check bash version
function check_bash_version() {
  if utils_check_bash_version ; then
    return 0
  fi

  # if bash version is too low, exit now
  return 1
}

# check and install oh-my-zsh
function check_install_oh_my_zsh() {
  local oh_my_zsh_target_dir="${HOME}/.oh-my-zsh"
  if [ -d "${oh_my_zsh_target_dir}" ]; then
    utils_print_green_line "oh-my-zsh is already installed."
  else
    utils_print_yellow_line "oh-my-zsh is not installed. Installing..."
    bash -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >/dev/null
  fi
  
  return 0
}

# check and install oh-my-zsh-plugins
function check_install_oh_my_zsh_plugins() {
  local oh_my_zsh_dir="${HOME}/.oh-my-zsh"
  local oh_my_zsh_plugins_dir="${HOME}/.oh-my-zsh/custom/plugins"
  if [[ ! -d "${oh_my_zsh_dir}" ]]; then
    utils_print_yellow_line "oh-my-zsh plugins directory has broken, exit now..."
    return 1
  fi

  declare -A to_install_plugins=(
    ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
    ["zsh-vi-mode"]="https://github.com/jeffreytse/zsh-vi-mode.git"
    ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions.git"
    ["fzf-tab"]="https://github.com/Aloxaf/fzf-tab"
  )

  for plugin in "${!to_install_plugins[@]}"; do
    if [[ ! -d "${oh_my_zsh_plugins_dir}/${plugin}" ]]; then
      utils_print_yellow_line "${plugin} is not installed. Installing..."
      git clone "${to_install_plugins[$plugin]}" "${oh_my_zsh_plugins_dir}/${plugin}"
    else
      printf "%s" "${plugin} "
      utils_print_green_line "is already installed."
    fi
  done

  return 0
}

check_bash_version \
  && check_install_oh_my_zsh \
  && check_install_oh_my_zsh_plugins