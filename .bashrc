if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi

# load source files in ~/.bash
for file in ~/.bash/{aliases,completions,config,paths,functions,prompt}; do
    if [ -d "$file" ]; then 
    	for f in $file/*; do
    		[ -r "$f" ] && source "$f"
    	done
    	unset f
    else
    	[ -r "$file" ] && source "$file"
    fi
done
unset file

figlet "Alex Banna"
