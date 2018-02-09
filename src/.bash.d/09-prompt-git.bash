fill_git_prompt() {
    local status

    PROMPT_GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

    if [[ $PROMPT_GIT_BRANCH == "HEAD" ]]; then
        PROMPT_GIT_BRANCH='-detached-'
    fi

    PROMPT_GIT_DIRTY=
    PROMPT_GIT_COLOR=

    if [ -n "$PROMPT_GIT_BRANCH" ]; then
        PROMPT_GIT_BRANCH="($PROMPT_GIT_BRANCH)"
        status='@'$(git status --porcelain 2>/dev/null | tr '\n' '@')

        if [[ $status =~ '@?? ' ]]; then
            PROMPT_GIT_DIRTY='≠'
            PROMPT_GIT_COLOR=$PROMPT_RED
        elif [[ $status =~ @.[MARCD][[:space:]] ]]; then
            PROMPT_GIT_DIRTY='≠'
            PROMPT_GIT_COLOR=$PROMPT_ORANGE
        elif [[ $status =~ @[MARCD][[:space:]][[:space:]] ]]; then
            PROMPT_GIT_DIRTY='≠'
            PROMPT_GIT_COLOR=$PROMPT_BLUE
        fi
    fi
}

PROMPT_COMMAND="fill_git_prompt; $PROMPT_COMMAND"

PROMPT_MODULES=$PROMPT_MODULES'\[$PROMPT_LIGHTGREY\]'"\$PROMPT_GIT_BRANCH"

PROMPT_MODULES=$PROMPT_MODULES'\[$PROMPT_GIT_COLOR\]'"\$PROMPT_GIT_DIRTY"
