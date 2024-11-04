## Zsh options

setopt auto_cd              # cd to directories without typing cd
setopt auto_pushd           # Push the current directory visited on the stack.
setopt pushd_ignore_dups    # Don't store duplicates in the stack.
setopt pushd_silent         # Don't print the directory stack after pushd or popd.
setopt interactive_comments # Allow comments on interactive shell

setopt extended_history     # Extended history format (‘: <beginning time>:<elapsed seconds>;<command>’.)
setopt inc_append_history_time   # Append to history after each command is completed (to include exec time)
# setopt inc_append_history   # Append to history after each command is started

setopt hist_ignore_space    # Don't add to history if a command starts with space
setopt hist_reduce_blanks   # Remove unnecessary blanks (replace multiple consecutive space with single space)
setopt hist_find_no_dups    # Remove duplicate from find history (ctrl+r)
setopt hist_ignore_all_dups # Remove older dupe regardless if they aren't consecutive
# setopt hist_ignore_dups     # Don't add command to history if it's the same as the previous one

# Completion options
setopt extended_glob        # Extended globbing
setopt nomatch              # Print error if no match is found
setopt list_rows_first      # Sort match in row instead of cols
setopt list_packed          # Completion menu takes less space
setopt no_auto_param_slash  # Add trailing / at the end of directory
setopt auto_remove_slash    # Add trailing / at the end of directory
# setopt menu_complete      # Put first match if multiple match is found

setopt globdots # Include dotfile in completion without typing `.`
