# Capture the output of a command so it can be retrieved with ret
_cap () { tee /tmp/capture.out; }

# Return the output of the most recent command that was captured by cap
_ret () { cat /tmp/capture.out; }

# cd to newly created directory
cdn () { cd $(\ls -dt */ | head -n1) }

# Pick command to copy from history using fzf
cpcmd () { fc -ln | fzf | xclip -sel clip }

# Colorized help
help() { "$@" --help 2>&1 | bat --plain --language=help }
