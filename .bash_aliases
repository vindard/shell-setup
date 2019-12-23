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
alias gl="git log"
alias gln="git --no-pager log --pretty=oneline -n"

# Pass git aliases
alias pgst="pass git status"
alias pgc="pass git commit -m"
alias pgph="pass git push"
alias pgpl="pass git pull"
alias pgri="pass git rebase -i"
alias pga="pass git add -A"
alias pgch="pass git checkout"
alias pgd="pass git diff"
alias pgl="pass git log"
alias pgln="pass git --no-pager log --pretty=oneline -n"
alias pundo="echo \"Undoing:\" && pgln 1 && echo && pass git reset --hard HEAD~1 && pgln 1"

