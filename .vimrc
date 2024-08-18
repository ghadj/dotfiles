set nocompatible              " be iMproved, required
filetype off                  " required

" Netrw  {{{
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_liststyle=3

" toggling tree using Ctrl-N from CWD
nmap <C-n> :Lexplore<CR>

" toggling tree using Shift+Ctrl-N from current directory
nnoremap <leader><C-n> :Lexplore %:p:h<CR>
" }}}

" General {{{
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

set shell=/bin/zsh

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Set default clibboard register (Linux)
set clipboard=unnamedplus 
" }}}

" VIM user interface {{{
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu
set wildmode=longest:full,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldmethod=syntax

set foldcolumn=0

set number                     " Show current line number
set relativenumber             " Show relative line numbers

" fold/unfold with +
nnoremap + za
vnoremap + zf
" }}}

" Text, tab and indent related {{{
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Turn-off splitting long lines
set formatoptions-=tc

" Set maximum text width
set textwidth=80
" }}}

" Visual mode related {{{
" Visual mode pressing * or # searches for the current selection
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>
" }}}

" Moving around, tabs, windows and buffers {{{
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Search in all files in current directory
map <leader>f :vimgrep //gj **/*<left><left><left><left><left><left><left><left>

" See the buffer list and select buffer by entering the number + Enter
nnoremap <leader>b :ls<cr>:b

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bc :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

" Editing mappings {{{
" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing whitespace on save, useful for some filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.tex,*.java,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" }}}

" Spell checking {{{
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Add Unix dictionary for .tex .md and .txt files
au BufReadPost,BufNewFile *.txt,*.md,*.tex setlocal dict+=/usr/share/dict/words

" Add dictionary to autocomplete
set complete+=k

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>sr z=
" }}}

" Misc {{{
" Execute make command in the background
map <leader>m :silent make\|redraw!\|cc<CR>

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Auto-Complete pairs
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Line-wise scrolling
inoremap <C-e> <C-o><C-e>
inoremap <C-y> <C-o><C-y>
" }}}

" Colors and Fonts {{{
" Enable syntax highlighting
colorscheme default

syntax enable 

" Markdown related settings
" avoid italics or highlighting
hi! link markdownItalic Normal
hi! link markdownBlockquote Normal

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Spell check highlight
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=9 term=underline cterm=underline gui=undercurl guisp=#ff0000

highlight clear SpellCap
highlight SpellCap term=standout ctermfg=12 term=underline cterm=underline gui=undercurl guisp=#008000

" Remove background from vertical split
" Set split separator to Unicode box drawing character
set encoding=utf8
set fillchars=vert:│

set background=light

" Remove background from sign-column used in gutter plugin
highlight clear SignColumn

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" Set split color
highlight VertSplit cterm=NONE ctermfg=None ctermbg=None

" }}}

" vim:foldmethod=marker:foldlevel=0
