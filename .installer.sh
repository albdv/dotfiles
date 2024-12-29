#!/usr/bin/env bash

brew_install() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        (
        echo
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    ) >>"$HOME"/.zprofile
}

brew_env() {
    eval "$($BREWPREFIX/brew shellenv)"

}

chezmoi_install() {
    "$BREWPREFIX"/brew install chezmoi
    chezmoi init albdv
    chezmoi apply -v
}

op_install() {
    "$BREWPREFIX"/brew install 1password 1password-cli
}

# Check arch
arch=$(uname -m)
if [ "$arch" = "x86_64" ]; then
    BREWPREFIX="/usr/local/bin/"
elif [ "$arch" = "arm64" ]; then
    BREWPREFIX="/opt/homebrew/bin/"
fi


if command -v brew > /dev/null; then
    echo "Brew package manager successfully installed"
else
    echo "Installing brew"
    brew_install
    if [ ! "${PATH##*"$BREWPREFIX"*}" ]; then
        echo "Add brew to PATH if it's not there"
        brew_env
    fi
fi

if command -v op > /dev/null; then
    echo "OnePassword cli successfully installed"
else
    op_install
fi

if command -v chezmoi > /dev/null; then
    echo "Chezmoi dotfile manager successfully installed"
else
    chezmoi_install
fi
