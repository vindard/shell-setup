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
alias gst="git status"
alias gc="git commit -m"
alias gph="git push"
alias gpl="git pull"
alias gri="git rebase -i"
alias ga="git add -A"
alias gch="git checkout"
