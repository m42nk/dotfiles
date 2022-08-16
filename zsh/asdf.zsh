if [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  src $HOME/.asdf/asdf.sh
  fpath=(${ASDF_DIR}/completions $fpath)
fi
