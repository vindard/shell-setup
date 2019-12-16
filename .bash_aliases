alias updt="sudo apt update && sudo apt -y upgrade"
alias inst="sudo apt update && sudo apt install -y"
alias bashedit="vim ~/.bashrc"
alias zshedit="vim ~/.zshrc"
alias aliasedit="vim ~/.bash_aliases"
alias c="xargs echo -n | xclip -selection clipboard"
alias gsta="git status"
alias gc="git commit -m"
alias gph="git push"
alias gpl="git pull"
alias gri="git rebase -i"
alias pip="python -m pip"
alias ipy="ipython"
alias f="fuck"

function aliases {
FILES=(~/.bashrc ~/.zshrc ~/.bash_aliases)
for FILENAME in "${FILES[@]}"; do
	if grep ^alias $FILENAME; then
		echo
	fi
done
}
alias aliases="aliases"

