" Set line wrapping and allow cursor to move visual lines and not actual
" lines
setlocal wrap
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Turn on spell checking
setlocal spell

" Add wordcount to status
setlocal statusline=%f\ %h%w%m%r
setlocal statusline+=%=%{wordcount().words}\ words\ -\ %P
