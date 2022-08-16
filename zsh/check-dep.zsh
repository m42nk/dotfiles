deps=(
  fzf
  exa
  rg
  fd
  tldr
  lazygit
  starship
  pfetch
)

for dep in $deps; do
  echo $dep
done

unset deps
