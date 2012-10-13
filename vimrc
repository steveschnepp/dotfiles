map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
" Map to switch tabs
map  <leader>1 :tabn 1<CR>
imap <leader>1 <Esc> :tabn 1<CR>
map  <leader>2 :tabn 2<CR>
imap <leader>2 <Esc> :tabn 2<CR>
map  <leader>3 :tabn 3<CR>
imap <leader>3 <Esc> :tabn 3<CR>
map  <leader>4 :tabn 4<CR>
imap <leader>4 <Esc> :tabn 4<CR>
map  <leader>5 :tabn 5<CR>
imap <leader>5 <Esc> :tabn 5<CR>
map  <leader>6 :tabn 6<CR>
imap <leader>6 <Esc> :tabn 6<CR>
map  <leader>7 :tabn 7<CR>
imap <leader>7 <Esc> :tabn 7<CR>
map  <leader>8 :tabn 8<CR>
imap <leader>8 <Esc> :tabn 8<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/bin/bundle/vundle/README.md')
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
    silent !mkdir -p ~/bin/bundle/vundle/
    silent !git clone https://github.com/gmarik/vundle ~/bin/bundle/vundle/
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'msanders/snipmate.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'benmills/vimux'
Bundle 'Lokaltog/vim-powerline'
Bundle 'brantb/vim-colors-solarized'
if iCanHazVundle == 0
	echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
	filetype plugin indent on
endif
" Setting up Vundle - the vim plugin bundler end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c.h.cpp.java :set cindent
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:solarized_termcolors=256

syntax on
colorscheme elflord

set nu
set history=500
set ruler
set visualbell
"""""""""""""""""""""""""""""tabsize
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2
set showtabline=2
set cmdheight=2
"""""""""""""""""""""""""""search
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
set showmatch
""""""""""""""""""""""""""mouse
set mouse=r
"""""""""""""""""""""""backup
set backup
set backupdir=$HOME/.vim_backups,/tmp
set directory=/tmp,$HOME/.vim_backups
""""""""""""""""""""""""""title
set showcmd
set showmode
"set ls=2
"set title
"set statusline=%<%f\ %h%m%r%y%{\"[\".(&fenc==\"\"?&enc:&fenc).\"]\"}
"			\%{exists('g:loaded_rbenv')?rbenv#statusline_ft_ruby():''}
"			\%{exists('g:loaded_perlbrew')?perlbrew#statusline_ft_perl():''}
"			\%{exists('g:loaded_fugitive')?fugitive#statusline():''}
"			\%=%-14.(%l,%c%V%)\ %P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags,/sogang/under/cs20091631/Projects/minho-pintos/pintos/src/tags,/sogang/under/cs20091631/.local/usr/include/tags,/sogang/under/cs20091631/.local/usr/src/linux-headers-2.6.32-33/tags
nnoremap <silent> <F7> :TlistUpdate<CR> 
nnoremap <silent> <F8> :Tlist<CR> 
nnoremap <silent> <F9> :TlistSync<CR> 
set csprg=/sogang/under/cs20091631/private/.local/bin_32/cscope
set csto=0
set cst
set nocsverb
if filereadable("./cscope.out")
	cs add cscope.out
else
	cs add /sogang/under/cs20091631/.local/usr/src/linux-headers-2.6.32-33/cscope.out
endif
set csverb
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

