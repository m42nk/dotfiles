## Zsh options

setopt auto_cd              # cd to directories without typing cd
setopt auto_pushd           # Push the current directory visited on the stack.
setopt pushd_ignore_dups    # Don't store duplicates in the stack.
setopt pushd_silent         # Don't print the directory stack after pushd or popd.
setopt interactive_comments # Allow comments on interactive shell

setopt append_history       # Allow multiple zsh instance to append to history
setopt extended_history     # Extended history format
setopt inc_append_history   # Append to history without having to exit zsh
setopt hist_find_no_dups    # Remove duplicate from find history (ctrl+r)
setopt hist_ignore_all_dups # Remove older command if duplicated
setopt hist_reduce_blanks   # Remove unnecessary blanks
setopt hist_ignore_space    # Don't add to history if a command starts with space

# Completion options
setopt extended_glob        # Extended globbing
setopt nomatch              # Print error if no match is found
setopt list_rows_first      # Sort match in row instead of cols
setopt list_packed          # Completion menu takes less space
setopt no_auto_param_slash  # Add trailing / at the end of directory
setopt auto_remove_slash    # Add trailing / at the end of directory
# setopt menu_complete      # Put first match if multiple match is found

_comp_options+=(globdots)   # Include dotfile in completion without typing `.`
