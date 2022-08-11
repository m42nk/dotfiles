# bind C-s run "tmux-fuzzy-session"
# unbind "'"
# bind "'" run "tmux-fuzzy-window"

# # unbind Tab
# # bind -n Tab run "tmux-fuzzy-session"

# # Custom terminal commands
# bind Enter run "tmux-quickterm #{pane_current_path}"

# # managing todos
# bind t menu -x 0 -y S \
#   -T "Todo" \
#   "Add Todo" a 'display-popup -h 3 -d "#{pane_current_path}" -E "sh -c todo-add"' \
#   "Show Todo" s 'neww -c "#{pane_current_path}" "taskell #(find-todo)"'

# bind Space 'display-popup -h 80% -w 80% -d "#{pane_current_path}" -E "taskell #(find-todo)"'

# # cheatsheet
# # bind -r i run "tmux neww tmux-cht.sh"
# bind i display-popup -E tmux-cht

# # Set title suffix to "- TMUX"
# set-option -g set-titles on
# set-option -g set-titles-string '#S: #W - TMUX'

#####################################
## TODO: 
#####################################
## - 'help' binding to show keybind
## - tmux-fuzzy-session
## - tmux-fuzzy-window
## - add indicator to window status name if contain multiple pane
## - add todo
## - try to attach to existing session instead of creating one
## - prompt to connect to existing session when detaching
## - tdrop focus on terminal if already open in another display
## - create blog about resetting tmux config (iterating)
## - create blog about tmux display-menu
## - create blog about tmux "COMMANDS" (see man) for relative operations
## - create blog about useful vim-motions
## - create blog 'what is idempotency'

# tmux -f /dev/null -L temp start-server \; list-keys

# ## Edit dotfiles
# bind e run "tmux neww dots"

