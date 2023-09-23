source $HOME/.config/nvim/vim-plug/plugins.vim
let mapleader = ","
nnoremap <leader>s :update<cr>
inoremap <leader>s <Esc>:update<cr>gi

nnoremap gn :bn<CR>
nnoremap gb :bp<CR>
nnoremap gd :bd<CR>
set whichwrap+=<,>,h,l,[,]

nnoremap <leader>n :NERDTreeToggle<CR>
" nnoremap <C-p> :GFiles<Cr>
nnoremap <silent> <Leader>f :Ag<CR>
autocmd BufWritePre * :%s/\s\+$//e
" let g:fzf_layout = { 'down':  '40%'}
set number
" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <leader>g :Ack<Space>

" nnoremap <silent> <Leader>b :Buffers<CR>
" nnoremap <silent> <C-f> :Files<CR>
" nnoremap <silent> <Leader>f :Rg<CR>
" nnoremap <silent> <Leader>/ :BLines<CR>
" nnoremap <silent> <Leader>' :Marks<CR>
" nnoremap <silent> <Leader>c :Commits<CR>
" nnoremap <silent> <Leader>H :Helptags<CR>
" nnoremap <silent> <Leader>h :History<CR>
" nnoremap <silent> <Leader>h: :History:<CR>
" nnoremap <silent> <Leader>h/ :History/<CR>

nnoremap <silent> <Leader>o :ZoomWinTabToggle<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
set showtabline=2
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 1

let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ ['close'] ]
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ }
    \ }

if has('macunix')
  set clipboard+=unnamedplus
else
  let g:loaded_clipboard_provider = 1
  set clipboard=unnamedplus
  let s:clip = '/mnt/c/Windows/System32/clip.exe'
  if executable(s:clip)
    augroup WSLYank
    autocmd!
      autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
  endif
endif

let NERDTreeWinSize = 35

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<cr>
nnoremap <silent> <C-f> <cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
lua <<EOF
require('telescope').setup{
  defaults = {
    path_display={"smart"},
    mappings = {
      i = {
	["<C-h>"] = "select_vertical"
      }
    }
  }
}
EOF

hi IncSearch cterm=NONE ctermfg=yellow ctermbg=red

source $HOME/.config/nvim/coc.vim

hi NormalFloat ctermfg=LightGrey

set splitbelow
set splitright
map <leader>r :NERDTreeFind<cr>
