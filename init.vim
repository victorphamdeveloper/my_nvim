source $HOME/.config/nvim/vim-plug/plugins.vim
let mapleader = ","
nnoremap <leader>s :update<cr>
inoremap <leader>s <Esc>:update<cr>gi

nnoremap gn :bn<CR>
nnoremap gb :bp<CR>
nnoremap gd :bd<CR>
set whichwrap=<,>,h,l
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-p> :GFiles<Cr>
nnoremap <silent> <Leader>f :Ag<CR>
let g:fzf_layout = { 'down':  '40%'}
set number
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <leader>g :Ack<Space>
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
