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

echo "
                      __---__
                   _-       _--______
              __--( /     \ )XXXXXXXXXXXXX_
            --XXX(   O   O  )XXXXXXXXXXXXXXX-
           /XXX(       U     )        XXXXXXX\\
         /XXXXX(              )--_  XXXXXXXXXXX\\
        /XXXXX/ (      O     )   XXXXXX   \XXXXX\\
        XXXXX/   /            XXXXXX   \__ \XXXXX----
        XXXXXX__/          XXXXXX         \__----  -
---___  XXX__/          XXXXXX      \__         ---
  --  --__/   ___/\  XXXXXX            /  ___---=
    -_    ___/    XXXXXX              '--- XXXXXX
      --\/XXX\ XXXXXX                      /XXXXX
        \XXXXXXXXX                        /XXXXX/
         \XXXXXX                        _/XXXXX/
           \XXXXX--__/              __-- XXXX/
            --XXXXXXX---------------  XXXXX--
               \XXXXXXXXXXXXXXXXXXXXXXXX-
                 --XXXXXXXXXXXXXXXXXX-

           * * * * * who ya gonna call? * * * * *
                 * * * ghostbusters!! * * *"
