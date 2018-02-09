# define static prompt part
PS1='\[$PROMPT_BG_GREY$PROMPT_GREEN\]\u'

# show host name if ssh
PS1=$PS1'\[$PROMPT_HALFGREY\]$PROMPT_SEP_INNER\[$PROMPT_BG_HALFGREY$PROMPT_BLUE\]\h'

# show path
PS1=$PS1'\[$PROMPT_DARKGREY\]$PROMPT_SEP_INNER\[$PROMPT_BG_DARKGREY$PROMPT_WHITE\]\w'

# include prompt modules defined by .bash.d/
PS1=$PS1$PROMPT_MODULES

# close the prompt
export PS1=$PS1'\[$PROMPT_RESET$PROMPT_DARKGREY\]$PROMPT_SEP_OUTER\[$PROMPT_RESET\]'
