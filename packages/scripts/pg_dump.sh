# For datagrip installed using flatpak

exec flatpak-spawn --host --watch-bus --clear-env pg_dump "$@"
