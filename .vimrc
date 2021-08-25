" highlight all search results
set hlsearch
" do case insensitive search unless a capital letter is present
set ignorecase smartcase
" show incremental search results as you type, highlighting matches
set incsearch hlsearch
" show line numbers
set number
" disable swap file
set noswapfile
" enable syntax highlighting
syntax on
" enable backspacing through everything
set backspace=indent,eol,start
" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2
" always try to show 10 lines above and below the cursor
set scrolloff=10
" move cursor up and down by visual lines instead of literal lines
nnoremap j gj
nnoremap k gk
" press space to go down 10 lines, control space to go up 10 lines
nnoremap <Space> 10j
nnoremap <C-Space> 10k
