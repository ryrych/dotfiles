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
set autoread
set backspace=indent,eol,start
set shortmess+=I
set timeout timeoutlen=3000 ttimeoutlen=10
set laststatus=2

if !has('nvim')
    set ttymouse=xterm2
endif

" http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim#5381514
" %-0{minwid}.{maxwid}{item}
set statusline=
set statusline+=%<%f%(\ %y%m%r%) "file status (full path, modified, readonly flags)
set statusline+=%(\ %{fugitive#statusline()}%) "git branch name
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
let &colorcolumn=join(range(91,999),",")

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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

" Toggle wrapping
nnoremap <silent><Leader>w :if &wrap <bar> set nowrap <bar> else <bar> set wrap <bar> endif<CR>

" Toggle invisibles
nmap <leader>ti :set list!<CR>

" Mute highlight search
nmap \q :nohlsearch<CR>

"Improve window resizing
nnoremap <silent><Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent><Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent><Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent><Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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

" vim-markdown
map <Plug> <Plug>Markdown_MoveToCurHeader

" MacDict.vim
map <leader>d "dyiw:call MacDict(@d)<CR>

" Tagbar
nmap <silent><F8> :TagbarToggle<CR>

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

let g:ag_prg="/usr/local/bin/ag --vimgrep --nocolor --nogroup --column --ignore node_modules --ignore bower_components --ignore dist --ignore tmp"
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

function! CtrlSpaceStartWindowIndicator()
    return ctrlspace#api#BufNr() != -1 && t:CtrlSpaceStartWindow == winnr() ? ctrlspace#context#Configuration().Symbols.IA . " " : ""
endfunction

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" EasyMotion
map <Leader><leader>w <Plug>(easymotion-wl)

" vim-pasta
let g:pasta_disabled_filetypes = ["python", "coffee", "markdown", "yaml", "slim", "haml"]

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
let g:vim_tags_project_tags_command = "{CTAGS} -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "{CTAGS} -R {OPTIONS} `bundle show --paths` 2>/dev/null"
let g:vim_tags_use_vim_dispatch = 1
let g:vim_tags_use_language_field = 1

if filereadable(expand("~/.vimrc.augroups"))
  source ~/.vimrc.augroups
endif

if filereadable(expand("~/.vimrc.writing"))
  source ~/.vimrc.writing
endif
