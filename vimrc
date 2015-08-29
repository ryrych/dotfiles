" General options
set nocompatible
set hidden
set smartindent autoindent
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set number
set nowrap
set hls
set mouse=a
set ttymouse=xterm2
set autoread
set backspace=indent,eol,start
set shortmess+=I
set timeout timeoutlen=3000 ttimeoutlen=10
set laststatus=2
set statusline=%<%f%(\ %y%m%r%)%(\ %{fugitive#statusline()}%)%=%(\ %{CtrlSpaceStartWindowIndicator()}\ %)%-3.(%l,%c%V%)\ %P
set showtabline=0
set nostartofline
set noautochdir
set colorcolumn=+1

" Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'glts/vim-textobj-comment'
Plugin 'jgdavey/vim-blockle'
Plugin 'junegunn/vim-easy-align'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-lastpat'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'oplatek/Conque-Shell'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sickill/vim-pasta'
Plugin 'szw/vim-commentary'
Plugin 'szw/vim-ctrlspace'
Plugin 'szw/vim-dict'
Plugin 'szw/vim-g'
Plugin 'szw/vim-indent-object'
Plugin 'szw/vim-kompleter'
Plugin 'szw/vim-maximizer'
Plugin 'szw/vim-smartclose'
Plugin 'szw/vim-tags'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'kablamo/vim-git-log'
Plugin 'int3/vim-extradite'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/indenthtml.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'reedes/vim-wordy'
Plugin 'reedes/vim-textobj-quote'
Plugin 'reedes/vim-lexical'
Plugin 'nelstrom/vim-qargs'
Plugin 'thoughtbot/vim-rspec'
Plugin 'sjl/gundo.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}

call vundle#end()
" Swap/backup files
set noswapfile
set dir=/tmp
set nowb
set nobackup

" Low updatetime, since we don't write swaps
set updatetime=200

" Custom .vimrcs
set exrc
set secure

" Search
set ignorecase
set smartcase
set incsearch
set noinfercase

" Command line
set history=200
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

" Folding
set foldmethod=indent
set foldlevelstart=99

nnoremap <silent><Leader>f :if &fdm == "indent" <bar> setl fdm=marker <bar> else <bar> setl fdm=indent <bar> endif<CR>

" Paste mode
set pastetoggle=<F5>

" Jumps
nnoremap <silent><S-TAB> <C-o>

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.:<CR>

" Toggle wrapping
nnoremap <silent><Leader>w :if &wrap <bar> set nowrap <bar> else <bar> set wrap <bar> endif<CR>

"Improve window resizing
nnoremap <silent><Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent><Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent><Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent><Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Insert mode with indent
nnoremap <silent>i @=empty(getline(".")) ? "S" : "i"<CR>
nnoremap <silent>I @=empty(getline(".")) ? "S" : "I"<CR>
nnoremap <silent>a @=empty(getline(".")) ? "S" : "a"<CR>
nnoremap <silent>A @=empty(getline(".")) ? "S" : "A"<CR>

" Insert datetime
inoremap <silent><Leader>dt <C-r>=strftime("%d-%m-%y %H:%M:%S")<CR>

" Encoding
set fileencoding=utf-8
" set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

" Ignore list
set wildignore=.git,.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,tags,*.tags

" Completion settings
set ofu=syntaxcomplete#Complete
set dictionary+=/usr/share/dict/words

" Omnicompletion trigger
if !has("gui_running")
  inoremap <unique><Nul> <C-x><C-o><C-p>
else
  inoremap <unique><C-Space> <C-x><C-o><C-p>
endif

" Custom language settings
syntax on
" syntax enable
filetype on
filetype plugin on
filetype indent on
runtime macros/matchit.vim

" Colors
syntax enable
set background=dark
colorscheme solarized
silent! hi SignColumn guibg=#022B35 ctermbg=bg
silent! hi NonText guifg=#022B35 gui=NONE ctermfg=bg cterm=NONE

" Remove trailing spaces
augroup TrailingSpaces
  au!
  au BufWritePre * if &ft != "markdown" | let b:cpos = [line("."), col(".")] | %s/\s\+$//e | call cursor(b:cpos) | endif
augroup END

augroup textobj_quote
  au!
  au FileType markdown call textobj#quote#init()
  au FileType textile call textobj#quote#init()
  au FileType text call textobj#quote#init({'educate': 0})
augroup END

map <silent> <leader>qc <Plug>ReplaceWithCurly
map <silent> <leader>qs <Plug>ReplaceWithStraight
nnoremap <silent> <leader>qpl :call textobj#quote#init({ 'double':'„“', 'single':'‚‘' })<cr>

augroup lexical
  au!
  au FileType markdown,mkd call lexical#init()
  au FileType textile call lexical#init()
  au FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#spelllang = ['en_us', 'en_gb', 'pl',]
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]

" Mute highlight search
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

" Lispy identifiers support
augroup LispyIdentifiers
  au!
  au FileType lisp,clojure,html,xml,xhtml,haml,eruby,css,scss,sass,javascript,coffee setlocal isk+=-
augroup END

" Custom filetype settings

augroup Ruby
  au!
  au FileType ruby,eruby,haml setlocal omnifunc=rubycomplete#Complete
  au FileType ruby,eruby,haml let g:rubycomplete_buffer_loading = 1
  au FileType ruby,eruby,haml let g:rubycomplete_rails = 1
  au FileType ruby,eruby,haml let g:rubycomplete_classes_in_global = 1
  au FileType ruby,eruby,haml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType ruby setlocal isk-=-
  au FileType ruby,eruby,haml Rvm
augroup END

augroup Python
  au!
  au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType python setlocal completeopt-=preview "turn off the preview window
  au FileType python setlocal isk-=-
augroup END

augroup Go
  au!
  au FileType go setlocal completeopt-=preview "turn off the preview window
  au FileType go setlocal isk-=-
augroup END

augroup Vimscript
  au!
  au FileType vim setlocal tabstop=4 softtabstop=4 shiftwidth=2 expandtab
  au FileType vim setlocal isk-=-
augroup END

augroup Javascript
  au!
  au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS tabstop=4 softtabstop=4 shiftwidth=4 expandtab
augroup END

augroup CoffeeScript
  au!
  au FileType coffee setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Html
  au!
  au FileType html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END

augroup Css
  au!
  au FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
  au FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Xml
  au!
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

augroup Yaml
  au!
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup Text
  au!
  au FileType text,markdown setlocal textwidth=80 formatoptions+=1
  au FileType text,markdown setlocal wrap linebreak
  au FileType text,markdown,gitcommit setlocal complete+=k infercase
  au FileType text,markdown,gitcommit setlocal isk-=-

  au FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

  " Support for the Markdown Viewer: https://github.com/szw/md
  au FileType markdown command! -buffer -nargs=0 Md :silent! :exe '! ~/.local/bin/md "' . expand('%:p') . '"' | redraw!
  au FileType markdown nnoremap <silent><buffer><F1> :Md<CR>
augroup END

" Custom plugins settings

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
" let g:syntastic_ruby_exec="~/.rvm/rubies/default/bin/ruby"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Ruby
let g:ruby_indent_access_modifier_style = "indent"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dict
let g:dict_hosts = [["dict.org", ["english"]], ["dict.mova.org", ["slovnyk_en-pl", "slovnyk_pl-en"]]]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
nmap <silent><F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maximizer
let g:maximizer_set_mapping_with_bang = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Fugitive
nnoremap <silent><F12> :Gstatus<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Fugitive
let g:mustache_abbreviations = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlSpace

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
  let g:ctrlspace_glob_command = 'ag -l --nocolor -g ""'
endif

nnoremap <silent><Leader>p :CtrlSpaceUp<CR>
nnoremap <silent><Leader>n :CtrlSpaceDown<CR>

function! CtrlSpaceStartWindowIndicator()
  return bufexists(ctrlspace#context#PluginBuffer()) && t:CtrlSpaceStartWindow == winnr() ? ctrlspace#context#Configuration().Symbols.IA . " " : ""
endfunction

let g:CtrlSpaceFileEngine = "file_engine_darwin_amd64"
let g:CtrlSpaceSymbols = { "NTM": " ⁺" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" movement in wrapped lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-pasta
let g:pasta_disabled_filetypes = ["python", "coffee", "markdown", "yaml", "slim", "haml"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indenthtml
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" expand_region
call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })

call expand_region#custom_text_objects('ruby', {
      \ 'im' :0,
      \ 'am' :0,
      \ })

" ConqueTerm
let g:ConqueTerm_ToggleKey      = '<F7>'
nnoremap <silent><F2> :ConqueTerm tmux -2u<CR>

" vim-tags
" turn off autogenerating until bug with hanging process is fixed
let g:vim_tags_auto_generate = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inline-to-reference urls in markdown (http://www.drbunsen.org/markdown-formatting/)

function! Formd(option)
    :let save_view = winsaveview()
    :let flag = a:option
    :if flag == "-r"
        :%! ~/.local/bin/formd -r
    :elseif flag == "-i"
        :%! ~/.local/bin/formd -i
    :else
        :%! ~/.local/bin/formd -f
    :endif
    :call winrestview(save_view)
endfunction

" formd mappings

nmap <leader>fr :call Formd("-r")<CR>
nmap <leader>fi :call Formd("-i")<CR>
nmap <leader>f :call Formd("-f")<CR>

map <leader>nc :NERDTreeFind<CR>

let g:instant_markdown_autostart = 0
