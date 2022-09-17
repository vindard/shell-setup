# Functions

function aliases {
FILES=(.bashrc .zshrc .bash_aliases)
for FILENAME in "${FILES[@]}"; do
	if grep -q ^alias $HOME/$FILENAME; then
		echo "[FROM \"$FILENAME\"]"
		echo " -------"
		grep ^alias $HOME/$FILENAME
		echo
	fi
done
}

# =============================

# Ubuntu/Debian aliases
alias updt="sudo apt update && sudo apt -y upgrade"
alias inst="sudo apt update && sudo apt install -y"
alias c="xargs echo -n | xclip -selection clipboard"
alias :q="exit"
alias addmon="bash ~/.config/i3/multi-monitors.sh"
alias editmon="vim ~/.config/i3/multi-monitors.sh"

# Shell config aliases
alias bashedit="vim $HOME/.bashrc"
alias zshedit="vim $HOME/.zshrc"
alias aliases="aliases"
alias aliasedit="vim $HOME/.bash_aliases"

# Other tool aliases
alias f="fuck"

#Python aliases
alias pip="python -m pip"
alias py="python"
alias ipy="ipython"

# Git aliases
alias gst="git -c color.ui=always status"
alias gcm="git commit -m"
alias gca="git commit -a"
alias gph="git push"
alias gpl="git pull"
alias gri="git rebase -i"
alias ga="git add -A"
alias gch="git checkout"
alias gl="git log"
alias gln="git --no-pager log --pretty=oneline -n"
alias gcp="git cherry-pick"

# Pass git aliases
alias pgst="pass git status"
alias pgcm="pass git commit -m"
alias pgca="pass git commit -a"
alias pgph="pass git push"
alias pgpl="pass git pull"
alias pgri="pass git rebase -i"
alias pga="pass git add -A"
alias pgch="pass git checkout"
alias pgd="pass git diff"
alias pgl="pass git log"
alias pgln="pass git --no-pager log --pretty=oneline -n"
alias pgcp="pass git cherry-pick"
alias pundo="echo \"Undoing:\" && pgln 1 && echo && pass git reset --hard HEAD~1 && pgln 1"

# pyenv aliases
alias pyv="pyenv version"
alias pyu="pyenv shell --unset"
function pyreset() {
	pyenv uninstall $1
	rm -rf .python-version
	pyenv virtualenv $1
	pyenv local $1
	pip install --upgrade pip
	pip list
}

# Zap Wallet
alias zap="$HOME/Installs/Zap-linux-x86_64-v0.7.2-beta.AppImage && exit"

# Specter HWI Bridge
alias specter-bridge="pyenv shell specter-desktop; python -m cryptoadvance.specter server --hwibridge; unset PYENV_VERSION"

# Dropbox
alias dropbox="$HOME/.dropbox-dist/dropboxd"

# Docker aliases
alias dockerprune="levels=(system volume container image); for i in \${levels[@]}; do docker \$i prune ; done"

# Trezor Suite
alias trezor="T=\"$HOME/Installs/Trezor/Trezor-Suite-21.5.1-linux-x86_64.AppImage\"; if sha256sum -c \$T.sha256 && echo && gpg --verify \$T.asc \$T; then \$T & disown; fi"
