" Leader
let g:mapleader=','

" map each number to its shift-key character
" inoremap 1 !
" inoremap 2 @
" inoremap 3 #
" inoremap 4 $
" inoremap 5 %
" inoremap 6 ^
" inoremap 7 &
" inoremap 8 *
" inoremap 9 (
" inoremap 0 )
" inoremap - _
" " and then the opposite
" inoremap ! 1
" inoremap @ 2
" inoremap # 3
" inoremap $ 4
" inoremap % 5
" inoremap ^ 6
" inoremap & 7
" inoremap * 8
" inoremap ( 9
" inoremap ) 0
" inoremap _ -


call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

" Syntastic
Plug 'vim-syntastic/syntastic'
  let g:syntastic_enable_ruby_checker = 0
  let g:syntastic_ruby_checkers = ['']

" Colors
  set background=dark
  set t_Co=256

  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  if (has("termguicolors"))
    set termguicolors
  endif

" Status line
Plug 'itchyny/lightline.vim'
  set laststatus=2

  " Format the status line
  set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

  set noshowmode
  let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

" Elixir
" Plug 'c-brenn/phoenix.vim'
Plug 'slashmili/alchemist.vim'
  let g:alchemist_tag_map = '<C-]>'
  let g:alchemist_tag_stack_map = '<C-T>'

  let g:alchemist#elixir_erlang_src = "/usr/local/Cellar"
  let g:alchemist_iex_term_size = 15
  let g:alchemist_iex_term_split = 'split'

Plug 'mhinz/vim-mix-format'
  let g:mix_format_on_save = 0
  let g:mix_format_silent_errors = 1
  " show errors on space
  nnoremap <space> :messages<CR>

" Rust
Plug 'rust-lang/rust.vim'
  let g:rustfmt_autosave  = 1
  let g:rust_clip_command = 'pbcopy'

Plug 'racer-rust/vim-racer'
  set hidden
  let g:racer_cmd = "racer"
  let g:racer_experimental_completer = 1

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'zsh install.sh',
    \ }

" Go
Plug 'zchee/deoplete-go', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/nvim/symlink.sh' }
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
  inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
  inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Kotlin
Plug 'udalov/kotlin-vim'


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#max_menu_width    = 100
  let g:deoplete#auto_complete_start_length = 1

  " use tab to forward cycle
  inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  " use tab to backward cycle
  inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

Plug 'sebastianmarkow/deoplete-rust'
  let g:deoplete#sources#rust#documentation_max_height=20
  let g:deoplete#sources#rust#racer_binary='~/.cargo/bin/racer'
  let g:deoplete#sources#rust#rust_source_path='~/.rustup/toolchains/stable-x86_64-apple-darwin'

" TypeScript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
"
" For async completion
" Plug 'Shougo/deoplete.nvim'
" For Denite features
Plug 'Shougo/denite.nvim'

Plug 'kien/ctrlp.vim'
  " nnoremap <space> :CtrlPMRU<CR>

" Set no max file limit
let g:ctrlp_max_files = 0

" Fuzzy Search
Plug 'junegunn/fzf.vim'
  set rtp+=/usr/local/opt/fzf
  nnoremap <Leader>l :Files<CR>
  nnoremap <Leader>b :Buffers<CR>

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
  nnoremap <Leader>gg :GV<CR>

" Markdown
" Plug 'junegunn/goyo.vim'
" Plug 'suan/vim-instant-markdown'
" let g:markdown_fenced_languages = ['html', 'ruby', 'elixir']

" Spelling
" Autocomplete with dictionary words when spell check is on
set complete+=kspell

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Misc
Plug 'tpope/vim-surround'

" can ruin the ( -> 9, ) -> 0 mappings
"so we use `vim-closer` instead
" Plug 'jiangmiao/auto-pairs'
Plug 'rstacruz/vim-closer'

Plug 'dietsche/vim-lastplace'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-swap'
Plug 'tomtom/tcomment_vim'

" Ctags
" Set the tag file search order
set tags=./tags;

" Go to definition (ctags)
nnoremap t <C-]>

" Index ctags from any project, including those outside Rails
nnoremap <Leader>ct :!ctags -R .<CR>

Plug 'neomake/neomake'
  " Run Neomake when I save any buffer
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END

  " Don't tell me to use smartquotes in markdown ok?
  let g:neomake_markdown_enabled_makers = []
  let g:neomake_elixir_enabled_makers = ['mix', 'credo']

" Testing
Plug 'janko-m/vim-test'
  " let test#strategy = "neovim"
  let test#strategy = "basic"

  let g:test#preserve_screen       = 0
  let test#ruby#rspec#executable   = 'bundle exec rspec'
  let test#ruby#rspec#file_pattern = '_spec\.rb'

  nnoremap <Leader>t :TestNearest<cr>
  nnoremap <Leader>f :TestFile<cr>
  nnoremap <Leader>a :TestSuite<cr>

call plug#end()

" Mouse
set mouse=""

" Encoding
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Identation
filetype plugin indent on

" Spaces
set tabstop=2
set shiftwidth=2 " identation defaults to 2 spaces"
set shiftround   " When at 3 spaces and I hit >>, go to 4, not 5.

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Search
set incsearch      " incremental search, search as you type
set hlsearch       " higlight search results
set ignorecase     " ignore case when searching
set smartcase      " ignore case when searching lowercase"
set nocursorline   " do not highlight current line
set nocursorcolumn " do not highlight current column

" Search and replace the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" vimrc file
nnoremap <Leader>vi :tabe $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

" clear the search buffer when hitting return
nnoremap <CR> :nohl<cr>

 " Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Better? completion on command line
set wildmenu
set wildmode=longest,list,full

" (Hopefully) removes the delay when hitting esc in insert mode
" set noesckeys
set ttimeout
set ttimeoutlen=0
set notimeout

" Delete in Insert Mode
inoremap <C-h> <Left><Del>

" Emacs-like beginning and end of line.
inoremap <c-e> <c-o>$
inoremap <c-a> <c-o>^

" treat :W as :w
cnoremap <expr> W (getcmdtype() is# ':' && empty(getcmdline())) ? 'w' : 'W'

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>

map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c

" Get off my lawn
nnoremap <Left> :echo "Use h"<CR>
nnoremap <Right> :echo "Use l"<CR>
nnoremap <Up> :echo "Use k"<CR>
nnoremap <Down> :echo "Use j"<CR>

" Make Y yank to the end of line
nnoremap Y y$

" git blame
" vnoremap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Move visual block up or down easily
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Reselect visual block after indent/outdent indent visual
vnoremap < <gv
vnoremap > >gv

" Edit
"  edit another file in the same directory as the current file
"  uses expression to extract path from current file's path
nnoremap <Leader><Leader> :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

" Buffers
"# close the current buffer
nnoremap <C-q> :bd<CR>

" better command-line editing
cnoremap <C-f> <right>
cnoremap <C-b> <left>
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cnoremap <C-d> <del>

" enter command mode with one keystroke
nnoremap ; :
nnoremap : ;

"  expand path of current file in command mode remapping command-line mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Misc
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set scrolloff=3    " keep more context when scrolling off the end of a buffer
set nowritebackup  " only in case you don't want a backup file while editing
set noswapfile
set number
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp  " Don't clutter my dirs up with swp and tmp files
set autowrite         " Save buffer automatically when changing files"
set autoread          " If a file is changed outside of vim, automatically reload it without asking
set guioptions-=T
set guifont=Consolas:h14
set mouse=""

" No annoying sound on errors
set noerrorbells " don't make noise
set novisualbell " don't blink
set t_vb=
set tm=500

set updatecount=10    "Save buffer every 10 chars typed"

 map <C-h> <C-w>h
 map <C-j> <C-w>j
 map <C-k> <C-w>k
 map <C-l> <C-w>l

 " Keep the cursor in place while joining lines
nnoremap J mzJ`z`

" Force Saving Files that Require Root Permission edit sudo root file tee save
cnoremap w!! %!sudo tee > /dev/null

" Search and replace the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Fast saving
nmap <Leader>w :w!<cr>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"Always show current position
set ruler

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" Remap VIM 0 to first non-blank character
map 0 ^

" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
nnoremap <Leader>rn :call RenameFile()<cr>


""""" Normalization ====================
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite * silent call DeleteTrailingWS()
""""" End Normalization ================""

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
 endfunction
