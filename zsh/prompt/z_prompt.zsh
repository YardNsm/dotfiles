# --------------------------------------- #
# | The prompt itself
# --------------------------------------- #

# Prompt values
local current_dir="%{$fg[blue]%}%3~%{$reset_color%}"
local symbol="%(?.$PROMPT_SYMBOL.%{$fg[red]%}$EXIT_PROMPT_SYMBOL)"

# The prompt
PROMPT='
 ${symbol} $(background_jobs_info) $(user_host)${current_dir} '

# Right prompt, show git info
RPROMPT=' $(git_prompt_info)  '

PROMPT2=' ${PROMPT2_SYMBOL} %_ >>> '
