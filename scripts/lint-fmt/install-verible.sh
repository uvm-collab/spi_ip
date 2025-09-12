#!/usr/bin/env bash

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## [Filename]       install-verible.sh
## [Project]        lint-fmt
## [Author]         Ciro Bermudez - cirofabian.bermudez@gmail.com
## [Language]       Bash Scripting
## [Created]        Sep 2025
## [Modified]       -
## [Description]    Script to install Verible and check for dependencies
## [Notes]          -
## [Status]         stable
## [Revisions]      -
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ================================ VARIABLES ==================================

INSTALL_DIR="$HOME/bin/verible"
VERIBLE_VERSION="v0.0-4023-gc1271a00"
FILE_NAME="verible-${VERIBLE_VERSION}-linux-static-x86_64.tar.gz"
REPO_URL="https://github.com/chipsalliance/verible/releases/download/${VERIBLE_VERSION}/${FILE_NAME}"

# Colors
C_RED="\033[31m"
C_GRE="\033[32m"
C_BLU="\033[34m"
C_YEL="\033[33m"
C_ORA="\033[38;5;214m"
NC="\033[0m"

# ============================= DEPENDENCY CHECK ==============================

printf "${C_ORA}[INFO]: Checking dependencies ...\n${NC}"
DEPENDENCIES=("tar" "wget")
for item in "${DEPENDENCIES[@]}"; do
  if command -v "${item}" &> /dev/null; then
    printf "  > %8s is INSTALLED\n" "${item}"
  else 
    printf "  > %8s is NOT INSTALLED\n" "${item}"
    exit 1
  fi
done
printf "  > All dependencies found\n"

# =========================== VERIBLE INSTALLATION ============================

if [[ $(uname -p) == "x86_64" ]]; then
    printf "${C_ORA}[INFO]: Installing Verible ...\n${NC}"
    printf "  > Installation directory: ${INSTALL_DIR}\n"
    # read -p "Do you want to delete old installation? (y/n): " answer
    # if [[ "${answer}" == [Yy]* ]]; then
    #     printf "[INFO]: Deleting old installation ...\n"
    # fi
    printf "  > Deleting old installation\n"
    rm -rf "${INSTALL_DIR}"
    printf "  > Creating installation directory\n"
    mkdir -p "${INSTALL_DIR}"
    cd "${INSTALL_DIR}"
    printf "  > Downloading ${FILE_NAME}\n"
    wget -q "${REPO_URL}" -O "${FILE_NAME}"
    printf "  > Decompressing ${FILE_NAME}\n"
    tar -xzf "${FILE_NAME}" --strip-components=1
    printf "  > Removing ${FILE_NAME}\n"
    rm -rf "${FILE_NAME}"
    printf "${C_ORA}[INFO]: To add Verible to your PATH:\n${NC}"
    printf "  # For bash (add this line to ~/.bashrc)\n" 
    printf "  export PATH=${INSTALL_DIR}/bin:\$PATH\n" 
    printf "  # For tcsh (add this line to ~/.tcshrc)\n" 
    printf "  setenv PATH ${INSTALL_DIR}/bin:\$PATH\n" 
    printf "${C_ORA}[INFO]: Check that it works with:\n${NC}"
    printf "  verible-verilog-lint   --version\n"
    printf "  verible-verilog-format --version\n"
    printf "  verible-verilog-syntax --version\n"
else
    printf "${C_RED}[ERROR]: Unsupported architecture\n${NC}"
    exit 1
fi