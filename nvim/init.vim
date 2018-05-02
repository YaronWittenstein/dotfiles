" Leader
let g:mapleader=','

call plug#begin('~/.config/nvim/autoload/plug.vim')

Plug 'sheerun/vim-polyglot'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Colors
  let base16colorspace = 256

" Elixir
" Plug 'c-brenn/phoenix.vim'
Plug 'slashmili/alchemist.vim'
  let g:alchemist_tag_map = '<C-]>'
  let g:alchemist_tag_stack_map = '<C-T>'

  let g:alchemist#elixir_erlang_src = "/usr/local/Cellar"
  let g:alchemist_iex_term_size = 15
  let g:alchemist_iex_term_split = 'split'

" Rust
Plug 'rust-lang/rust.vim'
  let g:rustfmt_autosave  = 1
  let g:rust_clip_command = 'pbcopy'

Plug 'racer-rust/vim-racer'
  set hidden
  let g:racer_cmd = "racer"
  let g:racer_experimental_completer = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_smart_case = 1

  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'sebastianmarkow/deoplete-rust'
  let g:deoplete#sources#rust#documentation_max_height=20
  let g:deoplete#sources#rust#racer_binary='/Users/yaronwittenstein/.cargo/bin/racer'
  let g:deoplete#sources#rust#rust_source_path='/Users/yaronwittenstein/.rustup/toolchains/stable-x86_64-apple-darwin'

Plug 'kien/ctrlp.vim'
  nnoremap <space> :CtrlPMRU<CR>

" Set no max file limit
let g:ctrlp_max_files = 0

" Fuzzy Search
Plug 'junegunn/fzf.vim'
  set rtp+=/usr/local/opt/fzf
  nnoremap <Leader>l :Files<CR>
  nnoremap <Leader>b :Buffers<CR>

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
  nnoremap <Leader>gg :GV<CR>

" Misc
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'dietsche/vim-lastplace'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-swap'
Plug 'tomtom/tcomment_vim'

" Set the tag file search order
set tags=./tags;

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
  let test#strategy = {
    \ 'nearest': 'basic',
    \ 'file':    'basic',
    \ 'suite':   'basic'
  \}
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

" Identation
filetype plugin indent on

" Spaces
set tabstop=2
set shiftwidth=2 " identation defaults to 2 spaces"
set shiftround   " When at 3 spaces and I hit >>, go to 4, not 5.
set expandtab
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

" Misc
set noerrorbells " don't make noise
set novisualbell " don't blink

" config
"" vimrc
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

" Go to definition (ctags)
nnoremap t <C-]>

map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


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

set nowrap
set backupdir=~/.tmp
set directory=~/.tmp  " Don't clutter my dirs up with swp and tmp files
set autowrite         " Save buffer automatically when changing files"
set autoread          " If a file is changed outside of vim, automatically reload it without asking
set showmatch
set guioptions-=T
set guifont=Consolas:h14
set mouse=""
set noerrorbells " don't make noise
set novisualbell " don't blink

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
