# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
#
#PS1='[\u@\h \w]\$ '
#PS1='\[\e[32m\] \[\e[m\] \h\[\e[36m\][\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]\\$ '
PS1='\[\e[1;32m\] \[\e[m\] \h\[\e[36m\][\[\e[m\]\[\e[36m\]\w\[\e[m\]\[\e[36m\]]\[\e[m\]\\$ '

if [ -f ~/.bash_aliases ]; then 
    . ~/.bash_aliases;
fi

# FZF
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_COMPLETION_OPTS='--border --info=inline'

# z is a script to use with fzf to cd into freq use directories
# https://github.com/rupa/z
. ~/z/z.sh

# j is another script to use together with z
# https://www.youtube.com/watch?v=WAklMjri3Qc
# https://gist.github.com/nikvdp/330c113ed6187ac04785acf6162081c7
j() {
    [ $# -gt 0 ] && z "$*" && return
    cd "$(z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}


