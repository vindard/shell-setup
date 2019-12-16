alias updt="sudo apt update && sudo apt -y upgrade"
alias inst="sudo apt update && sudo apt install -y"
alias bashedit="vim $HOME/.bashrc"
alias zshedit="vim $HOME/.zshrc"
alias aliasedit="vim $HOME/.bash_aliases"
alias c="xargs echo -n | xclip -selection clipboard"
alias gst="git status"
alias gc="git commit -m"
alias gph="git push"
alias gpl="git pull"
alias gri="git rebase -i"
alias ga="git add -A"
alias pip="python -m pip"
alias ipy="ipython"
alias f="fuck"

function aliases {
FILES=($HOME/.bashrc $HOME/.zshrc $HOME/.bash_aliases)
for FILENAME in "${FILES[@]}"; do
	if grep -q ^alias $FILENAME; then
		echo "[FROM \"$FILENAME\"]"
		echo " -------"
		grep ^alias $FILENAME
		echo
	fi
done
}
alias aliases="aliases"

