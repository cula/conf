" Specify a directory for plugins
call plug#begin('~/.vim/bundle')

" Common settings
set nocompatible
set expandtab
set smarttab
set cindent
set ts=4
set sts=4
set sw=4
set lbr
set wrap
set nu
set ru
set et
set showmatch
set showcmd
set showmode
set hlsearch
set autoread
set cursorline
set cursorcolumn
set modifiable
set fenc=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set foldenable
set foldmethod=indent
set foldlevel=4
set modifiable
set background=dark

"set pastetoggle=<F4>
let home=$HOME

" Plugins and their settings

" colors
Plug 'altercation/vim-colors-solarized'


" show indent
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

" ag
Plug 'rking/ag.vim'
let g:ag_working_path_mode="r"
map <F2> :Ag! 

" Mru open the recent files
Plug 'vim-scripts/mru.vim'
let MRU_File = home . '/.vim_mru_files'
nnoremap <buffer> <C-w>b :MRU<CR>
highlight link MRUFileName LineNr

" Grepper
Plug 'mhinz/vim-grepper'

" auto pairs
Plug 'jiangmiao/auto-pairs'

" surround
Plug 'tpope/vim-surround'

" Nerd tree related plugins config
Plug 'scrooloose/nerdtree'
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$', '__pycache__']
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
au BufRead,BufNewFile,Filetype java,javac let g:NERDTreeWinSize = 45
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jdonaldson/nerdtree-execute'

" auto format
Plug 'Chiel92/vim-autoformat'
noremap <F4> :Autoformat<CR>
let g:formatter_yapf_style = 'pep8'

" statusline
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='monochrome'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" auto complete
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'

" Markdown
Plug 'tpope/vim-markdown'

" Json
Plug 'elzr/vim-json'
au BufRead,BufNewFile,FileType json,jsonp,json5 set sw=2 sts=2 ts=8
Plug 'hjson/vim-hjson'
Plug 'gutenye/json5.vim'

" Html, css, js
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'

" Nodejs
Plug 'moll/vim-node'

" react
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Ruby
Plug 'tpope/vim-rails'

" synctastic: code style check
Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['eslint']

" Python
Plug 'python-mode/python-mode'


" Bash
au BufRead,BufNewFile,FileType sh nnoremap <F5> :!bash % <CR>


" C
au BufRead,BufNewFile,FileType c,h set ts=8 sts=8 sw=0 noexpandtab fdm=indent
func! CompileRunGcc()
    exec "!gcc % -o %< && ./%<"
endfunc
au BufRead,BufNewFile,FileType c,h nnoremap <F5> :call CompileRunGcc()<CR>


" C++
au BufRead,BufNewFile,FileType cpp,h set ts=8 sts=8 sw=0 noexpandtab fdm=indent
func! CompileRunGpp()
    "exec "w"
    exec "!g++ % -o %< && ./%<"
endfunc
au BufRead,BufNewFile,FileType cpp,h nnoremap <F5> :call CompileRunGpp()<CR>


" JS
au BufRead,BufNewFile,FileType js,javascript,es6,es7 set colorcolumn=120
au BufRead,BufNewFile,FileType js,javascript,es6,es7 nnoremap <F5> :!babel-node %<CR>
au BufRead,BufNewFile,FileType js,javascript,es6,es7 nnoremap <F6> :!babel-node debug %<CR>
au BufRead,BufNewFile,FileType js,javascript,es6,es7 nnoremap <buffer> <C-w>f <Plug>NodeVSplitGotoFile

" Python
" python-mode
au BufRead,BufNewFile,FileType py,pyc,python nnoremap <F5> :!python %<CR>
:set completeopt-=preview
let g:pymode_rope = 0
let g:pymode_lint_ignore="C0111,W0621,W0703,W0403"

" Initialize plugin system
call plug#end()

" Must be after the end
colorscheme solarized
