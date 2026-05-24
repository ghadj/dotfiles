" Vim / Neovim Cross-Compatibility Layer {{{
if !has('nvim')
    set nocompatible              " Required for legacy Vim compatibility
    syntax on                     " Enable syntax highlighting
    filetype plugin indent on     " Enable filetype plugins and indenting
    set backspace=eol,start,indent" Standardize backspace behavior
    set wildmenu                  " Enable command-line completion menu
    set incsearch                 " Incremental search
    set hlsearch                  " Highlight search matches
    set history=500               " Command history limit
endif
" }}}

" Native Runtime Path Extensions (FZF System Bridge) {{{
" Expose Homebrew's compiled binary engine to Vim/Neovim.
if isdirectory('/opt/homebrew/opt/fzf')
    set rtp+=/opt/homebrew/opt/fzf
elseif isdirectory('/usr/local/opt/fzf')
    set rtp+=/usr/local/opt/fzf
endif
" }}}

" Netrw File Explorer {{{
let g:netrw_banner = 0
let g:netrw_winsize = 20
let g:netrw_liststyle = 3

nnoremap <C-n> :Lexplore<CR>
nnoremap <leader><C-n> :Lexplore %:p:h<CR>
" }}}

" General Settings {{{
let mapleader = ","

set shell=/bin/zsh
set path+=**
set scrolloff=7
set cmdheight=1               
set lazyredraw 
set splitbelow
set splitright

" Search Parameters
set ignorecase
set smartcase

" macOS Hybrid Clipboard Engine
set clipboard=unnamed,unnamedplus 

" Tabs & Indentation
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set wrap
set linebreak
set textwidth=80
set formatoptions-=tc

" UI & Window Management
set number
set relativenumber
set foldmethod=syntax
set foldcolumn=0
set fillchars=vert:│

" System File Filter Exclusions
set wildignore+=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
" }}}

" Non-Recursive Keymaps & FZF Targets {{{
" Fast saving and privilege elevation (Protected Namespace)
nnoremap <leader>w :w!<CR>
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Async FZF Engine Mappings (Conflict-Free Layout)
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>h :History<CR>

" Search Utilities
nnoremap <space> /
nnoremap <c-space> ?
nnoremap <silent> <leader><cr> :noh<CR>

" Visual mode block selection search targeting literal blocks
xnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

" Fold Management
nnoremap + za
vnoremap + zf

" Buffer Navigation (Clean and Responsive)
nnoremap <leader>bc :bdelete<CR>
nnoremap <leader>ba :bufdo bd<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Tab Management
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove 

" Tab Toggle Variables
let g:lasttab = 1
nnoremap <Leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap 0 ^

" Insert Mode Helpers 
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
inoremap <C-e> <C-o><C-e>
inoremap <C-y> <C-o><C-y>
" }}}

" EasyMotion Navigation (Single-Leader Namespace) {{{
let g:EasyMotion_smartcase = 1

" Jump to any character globally (,es)
map <leader>es <Plug>(easymotion-bd-f)
nmap <leader>es <Plug>(easymotion-overwin-f)

" Jump to any word globally (,ew)
map <leader>ew <Plug>(easymotion-bd-w)
nmap <leader>ew <Plug>(easymotion-overwin-w)

" Line-wise jumping (,ej)
map <leader>ej <Plug>(easymotion-bd-jk)
nmap <leader>ej <Plug>(easymotion-overwin-line)

" Advanced 2-Character Search (,e/)
map <leader>e/ <Plug>(easymotion-sn)
" }}}

" Automation Utilities {{{
" Persistence: Return to previous cursor index
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Extraneous Trailing Whitespace Sanitizer
function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

autocmd BufWritePre *.tex,*.java,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
" }}}

" Spell Checking {{{
nnoremap <leader>ss :setlocal spell!<CR>
autocmd BufReadPost,BufNewFile *.txt,*.md,*.tex setlocal dict+=/usr/share/dict/words
set complete+=k

nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg
nnoremap <leader>sr z=
" }}}

" Miscellaneous & Interface Theming {{{
nnoremap <leader>m :silent make\|redraw!\|cc<CR>
nnoremap <leader>q :e ~/buffer<CR>
nnoremap <leader>x :e ~/buffer.md<CR>
nnoremap <leader>pp :setlocal paste!<CR>

set background=dark
colorscheme vim

" Typography Render Overrides
highlight! link markdownItalic Normal
highlight! link markdownBlockquote Normal

highlight clear SpellBad
highlight SpellBad term=standout ctermfg=9 term=underline cterm=underline gui=undercurl guisp=#ff0000
highlight clear SpellCap
highlight SpellCap term=standout ctermfg=12 term=underline cterm=underline gui=undercurl guisp=#008000
highlight clear SignColumn
highlight Comment cterm=italic
highlight VertSplit cterm=NONE ctermfg=None ctermbg=None
" }}}

" vim:foldmethod=marker:foldlevel=0
