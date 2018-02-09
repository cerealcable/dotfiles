# check color support
ncolors=$(tput colors)

if test -n "$ncolors" && test $ncolors -gt 8; then
    # define terminal highlights
    PROMPT_BG_DARKGREY="$(tput setab 235)"
    PROMPT_BG_GREY="$(tput setab 237)"
    PROMPT_BG_HALFGREY="$(tput setab 236)"
    PROMPT_BLUE="$(tput setaf 4)"
    PROMPT_DARKGREY="$(tput setaf 235)"
    PROMPT_GREEN="$(tput setaf 10)"
    PROMPT_HALFGREY="$(tput setaf 236)"
    PROMPT_LIGHTGREY="$(tput setaf 8)"
    PROMPT_ORANGE="$(tput setaf 208)"
    PROMPT_RED="$(tput setaf 9)"
    PROMPT_RESET="$(tput sgr0)"
    PROMPT_WHITE="$(tput setaf 7)"

    # prompt separators
    PROMPT_SEP_INNER=▐
    PROMPT_SEP_OUTER=▌
else
    # low color mode
    PROMPT_BG_DARKGREY="$(tput setab 7)"
    PROMPT_BG_GREY="$(tput setab 7)"
    PROMPT_BG_HALFGREY="$(tput setab 7)"
    PROMPT_BLUE="$(tput setaf 4)"
    PROMPT_DARKGREY="$(tput setaf 0)"
    PROMPT_GREEN="$(tput setaf 2)"
    PROMPT_HALFGREY="$(tput setaf 0)"
    PROMPT_LIGHTGREY="$(tput setaf 0)"
    PROMPT_ORANGE="$(tput setaf 3)"
    PROMPT_RED="$(tput setaf 1)"
    PROMPT_RESET="$(tput sgr0)"
    PROMPT_WHITE="$(tput setaf 0)"

    # prompt separators
    PROMPT_SEP_INNER='|'
    PROMPT_SEP_OUTER=' '
fi
