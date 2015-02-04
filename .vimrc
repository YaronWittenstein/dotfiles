" possible, as it has side effects.
set nocompatible
filetype off  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/dotfiles/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'ervandew/supertab'
Plugin 'skwp/greplace.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'    " navigate up a directory with '-' in netrw, among other things
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wincent/Command-T'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'elixir-lang/vim-elixir'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'dietsche/vim-lastplace'
Plugin 'itchyny/lightline.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'bling/vim-airline'

set laststatus=2  " Always display the status line
let g:airline#extensions#tabline#enabled = 1

Plugin 'roman/golden-ratio'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End UI Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nelstrom's plugin depends on kana's
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Colors
Plugin 'nanotech/jellybeans.vim'
set t_Co=256 " 256 colors

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set number
set scrolloff=3    " keep more context when scrolling off the end of a buffer
set nobackup
set nowritebackup  " only in case you don't want a backup file while editing
set noswapfile
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500   " keep 500 lines of command line history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set autowrite     " Automatically :write before running commands
set autoindent    " always set autoindenting on
set gdefault      " assume the /g flag on :s substitutions to replace all matches in a line

set incsearch
set hlsearch      " make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set nocursorline  " do not highlight current line

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

scriptencoding utf-8
set encoding=utf-8

" Set the tag file search order
set tags=./tags;

" Use Silver Searcher instead of grep
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround   " When at 3 spaces and I hit >>, go to 4, not 5.
set expandtab
set smarttab

" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

command! Q q " Bind :Q to :q
command! W w
command! WQ wq
command! Wq wq
command! Qall qall

" Better? completion on command line
set wildmenu
set wildmode=longest,list,full

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=0
set notimeout

let g:airline#extensions#tabline#enabled = 1 " enable vim-airline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Emacs-like beginning and end of line.
inoremap <c-e> <c-o>$
inoremap <c-a> <c-o>^

" add easy date insertion
inoremap <Leader>ds     <C-R>=strftime("%Y-%m-%d %T")<CR>
inoremap <Leader>ymd    <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <Leader>mdy    <C-R>=strftime("%m/%d/%y")<CR>
inoremap <Leader>Mdy    <C-R>=strftime("%b %d, %Y")<CR>
inoremap <Leader>hms    <C-R>=strftime("%T")<CR>

" Clear the search buffer when hitting return
nnoremap <CR> :nohl<cr>

cnoremap <expr> Q (getcmdtype() is# ':' && empty(getcmdline())) ? 'q' : 'Q'

" disable encryption with :X in vim
cnoremap <expr> X (getcmdtype() is# ':' && empty(getcmdline())) ? 'x' : 'X'

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
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Insert a hash rocket with <c-l>
inoremap <c-l> <space>=><space>

inoremap <Tab> <C-P>

" Let's be reasonable, shall we?
nnoremap k gk
nnoremap j gj

" Make Y yank to the end of line
nnoremap Y y$

" ex mode commands made easy
nnoremap <space> :

" Leader
let mapleader=","

" identation
nnoremap <leader>i mmgg=G`m<CR>

" replace all
nnoremap <leader>ra :%s/

" execute the current line
nnoremap <leader>x :exec getline(".")<cr>

" git blame
vnoremap <leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" git commit and push WIP
nnoremap <leader>gg :!git add . && git commit -m 'WIP' && git push<cr>

nnoremap <leader>gs :Gstauts<cr>
nnoremap <leader>gc :Gcommit<cr>

" Move visual block up or down easily.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Reselect visual block after indent/outdent indent visual
vnoremap < <gv
vnoremap > >gv

" Switch between the last two files
nnoremap <leader><leader> <c-^>

nnoremap <leader>l :CommandT<CR>
nnoremap <leader>m :CommandTMRU<CR>
nnoremap <leader>rf :CommandTFlush<CR>:CommandT<CR>

let g:CommandTCancelMap=['<C-x>', '<C-c>']
set wildignore+=*.o,*.obj,.git

nnoremap <leader>vi :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z`

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
nnoremap <leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>

nnoremap <C-c> :bnext<CR>
nnoremap <C-b> :bprev<CR>
nnoremap <C-q> :bd<CR>

nnoremap <leader>rr :topleft :split config/routes.rb<cr>

" Better comand-line editing
cnoremap <C-f> <right>
cnoremap <C-b> <left>
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <home>
cnoremap <C-e> <end>
cnoremap <C-d> <del>

" Expand path of current file in command mode remapping command-line mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Force Saving Files that Require Root Permission edit sudo root file tee save
cnoremap w!! %!sudo tee > /dev/null %

" Search and replace the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Close all other windows, open a vertical split, and open this file's test
" alternate in it.
function! FocusOnFile()
  tabnew %
  normal! v
  normal! l
  call OpenTestAlternate()
  normal! h
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-k> <c-w>k
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

let t:run_test_command = ''

function! RunTests(filename)
    silent !clear
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end

    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        " First choice: project-specific test script
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        " Fall back to the .test-commands pipe if available, assuming someone
        " is reading the other side and running the commands
        elseif filewritable(".test-commands")
          let cmd = t:run_test_command . ' rspec --color --format progress --require "~/lib/vim_rspec_formatter" --format VimFormatter --out tmp/quickfix'
          exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

          " Write an empty string to block until the command completes
          sleep 100m " milliseconds
          :!echo > .test-commands
          redraw!
        " Fall back to a blocking test run with Bundler
        elseif filereadable("Gemfile")
            exec ":!bundle exec " . t:run_test_command . " rspec --color " . a:filename
        " Fall back to a normal blocking test run
        else
            exec ":!bundle exec " . t:run_test_command . " rspec --color " . a:filename
        end
    end
endfunction

nnoremap <leader>t :call RunNearestTest()<cr>
nnoremap <leader>a :call RunTests('')<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78

  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal path+='lib/*'

  " Make ? part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

  " Make _ part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=_

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
augroup END

" Remove trailing whitespace on save for ruby files
au BufWritePre *.rb :%s/\s\+$//e

" Save when losing focus
au FocusLost * :wa

" Enable built-in matchit plugin
runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test quickfix list management
"
" If the tests write a tmp/quickfix file, these mappings will navigate through
" it
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! BufferIsOpen(bufname)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      return 1
    endif
  endfor
  return 0
endfunction

function! ToggleQuickfix()
  if BufferIsOpen("Quickfix List")
    cclose
  else
    call OpenQuickfix()
  endif
endfunction

function! OpenQuickfix()
  cgetfile tmp/quickfix
  topleft cwindow
  if &ft == "qf"
      cc
  endif
endfunction

" nnoremap <leader>q :call ToggleQuickfix()<cr>
" nnoremap <leader>Q :cc<cr>
" nnoremap <leader>j :cnext<cr>
" nnoremap <leader>k :cprev<cr>

function! SearchForCallSitesCursor()
  let searchTerm = expand("<cword>")
  call SearchForCallSites(searchTerm)
endfunction

" Search for call sites for term (excluding its definition) and
" load into the quickfix list.
function! SearchForCallSites(term)
  cexpr system('ag ' . shellescape(a:term) . '\| grep -v def')
endfunction

nnoremap <Leader>cs :call SearchForCallSitesCursor()<CR>

" Index ctags from any project, including those outside Rails
nnoremap <Leader>ct :!ctags -R .<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" Display extra whitespace
set list listchars=tab:»·,trail:·


""""" Normalization ====================
" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite * silent call DeleteTrailingWS()
""""" End Normalization ================""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

let g:lastplace_ignore = "gitcommit,svn"
