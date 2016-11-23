" General options
set shell=/bin/zsh
set hidden
set smartindent
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set number
set nowrap
set hls
set shortmess+=I
set timeout timeoutlen=3000 ttimeoutlen=10

if !has('nvim')
    set ttymouse=xterm2
endif

" http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim#5381514
" %-0{minwid}.{maxwid}{item}
set statusline=
set statusline+=%<%f%(\ %y%m%r%) "file status (full path, modified, readonly flags)
set statusline+=%(\ %{fugitive#statusline()}%) "git branch name
set statusline+=\ %{rvm#statusline()} "e.g [ruby-2.3.0]
set statusline+=%=%(\ %{CtrlSpaceStartWindowIndicator()}\ %) "vim-ctrlspace window status
set statusline+=%-3.(%l,%c%V%)\ %P "document position (line & column number, % of progress)
set statusline+=\ %{PencilMode()}

set showtabline=0
set nostartofline
set noautochdir
set cursorline
set textwidth=90
set clipboard=unnamed
set listchars=tab:»·,space:·,eol:¬,trail:·,nbsp:_
set nolist
let &colorcolumn=join(range(91,999),",")

let mapleader=","
noremap \ ,

let g:dotfilesPath  = '~/dotfiles/'
let g:vimrcBundles  = g:dotfilesPath . 'vimrc.bundles'
let g:vimrcAugroups = g:dotfilesPath . 'vimrc.augroups'
let g:vimrcWriting  = g:dotfilesPath . 'vimrc.writing'

exe 'source ' g:vimrcBundles

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
set noinfercase

" Command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <C-d>  <Delete>
cnoremap <C-g>  <C-c>

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

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.:<CR>

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Paste mode
set pastetoggle=<F5>

" Toggle wrapping
nnoremap <silent><Leader>w :if &wrap <bar> set nowrap <bar> else <bar> set wrap <bar> endif<CR>

" Toggle invisibles
nmap <leader>ti :set list!<CR>

" Mute highlight search
nnoremap <space> :nohlsearch<cr>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nmap <A-h> <C-w>h
nmap <A-j> <C-w>j
nmap <A-k> <C-w>k
nmap <A-l> <C-w>l

" Insert mode with indent
nnoremap <silent>i @=empty(getline(".")) ? "S" : "i"<CR>
nnoremap <silent>I @=empty(getline(".")) ? "S" : "I"<CR>
nnoremap <silent>a @=empty(getline(".")) ? "S" : "a"<CR>
nnoremap <silent>A @=empty(getline(".")) ? "S" : "A"<CR>

" Insert datetime
inoremap <silent><Leader>dt <C-r>=strftime("%d-%m-%y %H:%M:%S")<CR>

" Copy file path to clipboard
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" Expand current file path to directory it is in
" e.g ~/projects/foo/bar.js => ~/projects/foo/
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Encoding
set fileencoding=utf-8
" set fileencodings=utf-8
set termencoding=utf-8

" Ignore list
set wildignore=.git,.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,tags,*.tags

" Completion settings
set ofu=syntaxcomplete#Complete

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

" enable Vim built-in plugin for enhanced `%` command jump
runtime macros/matchit.vim

" Colors
syntax enable
set background=dark
colorscheme PaperColor

" Vim-Ruby
let g:ruby_indent_access_modifier_style = "indent"

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>la :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" vim-lexical
let g:lexical#spelllang = ['en_us', 'en_gb', 'pl',]
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]


" MacDict.vim
map <leader>d "dyiw:call MacDict(@d)<CR>

" Maximizer
let g:maximizer_set_mapping_with_bang = 1

" Vim-Fugitive
nnoremap <silent><F12> :Gstatus<CR>
let g:mustache_abbreviations = 1

" jshint2
set runtimepath+=~/.vim/bundle/jshint2.vim
let jshint2_save = 0
let jshint2_min_height = 3
let jshint2_max_height = 12

" jshint validation
nnoremap <silent><F1> :JSHint<CR>

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = "/usr/local/bin/EditorConfig"

" CtrlSpace
nnoremap <silent><Leader>p :CtrlSpaceGoUp<CR>
nnoremap <silent><Leader>n :CtrlSpaceGoDown<CR>

let g:CtrlSpaceFileEngine = "file_engine_darwin_amd64"
let g:CtrlSpaceSymbols = { "NTM": " ⁺" }

" Ag
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

function! CtrlSpaceStartWindowIndicator()
    return ctrlspace#api#BufNr() != -1 && t:CtrlSpaceStartWindow == winnr() ? ctrlspace#context#Configuration().Symbols.IA . " " : ""
endfunction

" easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" EasyMotion
map <Leader><leader>w <Plug>(easymotion-wl)

" vim-pasta
let g:pasta_disabled_filetypes = ["python", "markdown", "yaml", "slim", "haml"]

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
let g:vim_tags_ctags_binary = '/usr/bin/ctags'
let g:vim_tags_project_tags_command = "{CTAGS} -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "{CTAGS} -R {OPTIONS} `bundle show --paths` 2>/dev/null"
let g:vim_tags_use_vim_dispatch = 1
let g:vim_tags_use_language_field = 1

" neoterm config
if has("nvim")
  " change cursor to bar in insert mode
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  " run tests with :T
  let test#strategy = "neoterm"

  " pretty much essential: by default in terminal mode, you have to press ctrl-\-n to get into normal mode
  " ain't nobody got time for that
  tnoremap <Esc> <C-\><C-n>
endif

exe 'source ' g:vimrcWriting
exe 'source ' g:vimrcAugroups

" http://www.bestofvim.com/tip/leave-ex-mode-good/
nnoremap Q <nop>

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

let g:pencil#conceallevel = 0     " 0=disable, 1=onechar, 2=hidechar, 3=hideall (def)
let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)

" Center screen on next/previous selection.
nmap N Nzz
" Last and next jump should center too.
nmap <C-o> <C-o>zz
nmap <C-i> <C-i>zz

" Twitvim
let twitvim_enable_python3 = 1
let twitvim_browser_cmd = 'open'

if filereadable(expand("./vimrc.local"))
  source ./vimrc.local
endif
