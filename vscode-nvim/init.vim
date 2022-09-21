lua require("plugins")
echo "halo"

" ---
" Options
" ---

let mapleader = " "

set clipboard=unnamedplus
set ignorecase
set smartcase
set incsearch
set foldmethod=syntax

" ---
" Mappings
" ---

nnoremap <C-K>s <Cmd>call VSCodeNotify("workbench.action.openGlobalKeybindings")<CR>
nnoremap <C-K>o <Cmd>call VSCodeNotify("workbench.action.openRecent")<CR>
nnoremap <C-K><C-A> <Cmd>call VSCodeNotify("workbench.action.toggleActivityBarVisibility")<CR>
nnoremap <C-K><C-R> <Cmd>call VSCodeNotify("workbench.action.reloadWindow")<CR>

" Close sidebar
"  nnoremap <Esc> <Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>
nnoremap <C-K><C-K> <Cmd>call VSCodeNotify("workbench.action.toggleSidebarVisibility")<CR>

" Save
nnoremap <Leader><Space> <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>

" Next/Previous tabs
nnoremap H <Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>
nnoremap L <Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>

" No highlight search
nnoremap <Leader>h :nohlsearch<CR>

" Go to next problem in file
nnoremap <Leader>gj <Cmd>call VSCodeNotify("editor.action.marker.nextInFiles")<CR>
nnoremap <Leader>gk <Cmd>call VSCodeNotify("editor.action.marker.previousInFiles")<CR>


" Open Ctrl+{Shift}+P menu
nnoremap <Leader>f <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <Leader>F <Cmd>call VSCodeNotify('workbench.action.showCommands')<CR>
xnoremap <C-S-P> <Cmd>call VSCodeNotifyVisual('workbench.action.showCommands', 1)<CR>

" Format
nnoremap <M-S-F> <Cmd>call VSCodeNotify("editor.action.formatDocument")<CR>

" Quickfix
nnoremap gl <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>

" Close tab
nnoremap <Leader>c  <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <C-w>  <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

" Open file explorer
nnoremap <Leader>e <Cmd>call VSCodeNotify('workbench.explorer.fileView.focus')<CR>

" Toggle panel
nnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.togglePanel')<CR>

" Move line
nnoremap <Leader>j <Cmd>call VSCodeNotify('editor.action.moveLinesDownAction')<CR>
nnoremap <Leader>k <Cmd>call VSCodeNotify('editor.action.moveLinesUpAction')<CR>
xnoremap <Leader>j <Cmd>call VSCodeNotifyVisual('editor.action.moveLinesDownAction', 0)<CR><Esc>
xnoremap <Leader>k <Cmd>call VSCodeNotifyVisual('editor.action.moveLinesUpAction', 0)<CR><Esc>

" Dupe line
nnoremap <Leader>J <Cmd>call VSCodeNotify('editor.action.copyLinesDownAction')<CR>
nnoremap <Leader>K <Cmd>call VSCodeNotify('editor.action.copyLinesUpAction')<CR>
xnoremap <Leader>J <Cmd>call VSCodeNotifyVisual('editor.action.copyLinesDownAction', 0)<CR><Esc>
xnoremap <Leader>K <Cmd>call VSCodeNotifyVisual('editor.action.copyLinesUpAction', 0)<CR><Esc>

" Comments
xnoremap <Leader>/  <Plug>VSCodeCommentary
nnoremap <Leader>/ <Plug>VSCodeCommentaryLine
xnoremap gc  <Plug>VSCodeCommentary
nnoremap gc  <Plug>VSCodeCommentary
onoremap gc  <Plug>VSCodeCommentary
nnoremap gcc <Plug>VSCodeCommentaryLine

" Quick search and replace
"  nnoremap <Leader>s :s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
"  nnoremap <Leader>S :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <BSlash>s :s/\<<C-r><C-w>\>/
nnoremap <BSlash>S :%s/\<<C-r><C-w>\>/

" Others
nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z


"  nnoremap <Leader>vwh :h <C-R>=expand("<cword>")<CR><CR>
"  nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>


" Code folding
nnoremap <silent> za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
nnoremap <silent> zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
nnoremap <silent> zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
nnoremap <silent> zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
nnoremap <silent> zc <Cmd>call VSCodeNotify('editor.fold')<CR>
nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>

nnoremap <silent> z1 <Cmd>call VSCodeNotify('editor.foldLevel1')<CR>
nnoremap <silent> z2 <Cmd>call VSCodeNotify('editor.foldLevel2')<CR>
nnoremap <silent> z3 <Cmd>call VSCodeNotify('editor.foldLevel3')<CR>
nnoremap <silent> z4 <Cmd>call VSCodeNotify('editor.foldLevel4')<CR>
nnoremap <silent> z5 <Cmd>call VSCodeNotify('editor.foldLevel5')<CR>
nnoremap <silent> z6 <Cmd>call VSCodeNotify('editor.foldLevel6')<CR>
nnoremap <silent> z7 <Cmd>call VSCodeNotify('editor.foldLevel7')<CR>

xnoremap <silent> zV <Cmd>call VSCodeNotify('editor.foldAllExcept')<CR>

" Move cursor without opening folds
function! MoveCursor(direction) abort
  if(reg_recording() == '' && reg_executing() == '')
      return 'g'.a:direction
  else
      return a:direction
  endif
endfunction

nmap <expr> j MoveCursor('j')
nmap <expr> k MoveCursor('k')


" ---
" Autocmds
" ---

autocmd TextYankPost * silent! lua vim.highlight.on_yank()
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

