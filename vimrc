" General options
set shell=/bin/zsh
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
set cursorline
set textwidth=80
set clipboard=unnamed
let &colorcolumn=join(range(81,999),",")

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
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
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
Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'
Plugin 'tpope/vim-haml'
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
Plugin 'nelstrom/vim-qargs'
Plugin 'plasticboy/vim-markdown'
Plugin 'reedes/vim-lexical'
Plugin 'reedes/vim-textobj-quote'
Plugin 'sjl/gundo.vim'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-vinegar'
Plugin 'lukaszkorecki/CoffeeTags'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'cohama/lexima.vim'
Plugin 'gorodinskiy/vim-coloresque'

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
set history=1000
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

" Jumps
nnoremap <silent><S-TAB> <C-o>

" Movement in wrapped lines
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

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.:<CR>

" Toggle wrapping
nnoremap <silent><Leader>w :if &wrap <bar> set nowrap <bar> else <bar> set wrap <bar> endif<CR>

" Mute highlight search
nnoremap <silent><C-l> :<C-u>nohlsearch<CR><C-l>

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

" Copy file path to clipboard
noremap <silent> <F4> :let @+=expand("%:p")<CR>

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

" Custom filetype settings

" Remove trailing spaces
augroup TrailingSpaces
  au!
  au BufWritePre * if &ft != "markdown" | let b:cpos = [line("."), col(".")] | %s/\s\+$//e | call cursor(b:cpos) | endif
augroup END

augroup Text
  au!
  au FileType markdown setlocal textwidth=80 formatoptions+=1
  au FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType markdown setlocal wrap linebreak
  au FileType markdown,text,gitcommit setlocal complete+=k infercase
  au FileType markdown,text,gitcommit setlocal isk-=-

  au FileType markdown,text call textobj#quote#init()
  au FileType markdown,text map <silent> <leader>qc <Plug>ReplaceWithCurly
  au FileType markdown,text map <silent> <leader>qs <Plug>ReplaceWithStraight
  au FileType markdown,text nnoremap <silent> <leader>qpl :call textobj#quote#init({ 'double':'„”', 'single':'‚’' })<cr>

  au FileType markdown,text nmap <leader>fr :call Formd("-r")<CR>
  au FileType markdown,text nmap <leader>fi :call Formd("-i")<CR>
  au FileType markdown,text nmap <leader>ft :call Formd("-f")<CR>

  au FileType markdown call lexical#init()
augroup END

" Lispy identifiers support
augroup LispyIdentifiers
  au!
  au FileType lisp,clojure,html,xml,xhtml,haml,eruby,css,scss,sass,javascript,coffee setlocal isk+=-
augroup END

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

" Custom plugins settings

" Vim-Ruby
let g:ruby_indent_access_modifier_style = "indent"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>al :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"

" Dict
let g:dict_hosts = [["dict.org", ["english"]], ["dict.mova.org", ["slovnyk_en-pl", "slovnyk_pl-en"]]]

" vim-lexical
let g:lexical#spelllang = ['en_us', 'en_gb', 'pl',]
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]

" Tagbar
nmap <silent><F8> :TagbarToggle<CR>

" Maximizer
let g:maximizer_set_mapping_with_bang = 1

" Vim-Fugitive
nnoremap <silent><F12> :Gstatus<CR>

" Vim-Fugitive
let g:mustache_abbreviations = 1

" CtrlSpace
nnoremap <silent><Leader>p :CtrlSpaceGoUp<CR>
nnoremap <silent><Leader>n :CtrlSpaceGoDown<CR>

let g:CtrlSpaceFileEngine = "file_engine_darwin_amd64"
let g:CtrlSpaceSymbols = { "NTM": " ⁺" }

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
  let g:ctrlspace_glob_command = 'ag -l --nocolor -g ""'
endif

function! CtrlSpaceStartWindowIndicator()
    return ctrlspace#api#BufNr() != -1 && t:CtrlSpaceStartWindow == winnr() ? ctrlspace#context#Configuration().Symbols.IA . " " : ""
endfunction

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" vim-pasta
let g:pasta_disabled_filetypes = ["python", "coffee", "markdown", "yaml", "slim", "haml"]

" Ctags
nnoremap <F5> :!ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths) 2>/dev/null<CR>

" Ag
let g:agprg="/usr/local/bin/ag --vimgrep"

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

" vim-tags
" turn off autogenerating until bug with hanging process is fixed
let g:vim_tags_auto_generate = 0
let g:vim_tags_ctags_binary = ctags
let g:vim_tags_project_tags_command = "{CTAGS} -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "{CTAGS} -R {OPTIONS} `bundle show --paths` 2>/dev/null"
let g:vim_tags_use_vim_dispatch = 1
let g:vim_tags_use_language_field = 1

let g:CoffeeAutoTagDisabled=1
let g:CoffeeAutoTagFile='./coffeetags'
let g:CoffeeAutoTagIncludeVars=1
" let g:CoffeeAutoTagTagRelative=0

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

let g:instant_markdown_autostart = 0
