" URL: http://vim.wikia.com/wiki/E
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
 
"------------------------------------------------------------
" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
 
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
 
 
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
 
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 
 
"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
 
" Display line numbers on the left
set number
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-M> :nohl<CR><C-L>
 
"------------------------------------------------------------
" Custom mapping
"------------------------------------------------------------

inoremap jj <Esc>

" Assign a leader key
"nnoremap <SPACE> <Nop>
"map <Space> <Leader>
let mapleader = " "

nnoremap <leader>w :w<cr> 
nnoremap <leader>q :q<cr> 
nnoremap <leader>r :set rnu!<cr> 
nnoremap <leader>l :ls<cr>:b<space>

" Shortcuts for using netwr
nnoremap <leader>ex :Explore<CR>
nnoremap <leader>dh :Lexplore %:p:h<CR>
nnoremap <leader>dd :bd<CR>
nnoremap <leader>ca :bufdo bd <CR>
nnoremap <leader>da :%bd <bar> e# <bar> bd# <CR>

" Yank to/from system clipboard
nnoremap <leader>y "*y
nnoremap <leader>p "*p

"""""""""""""""""""""""""""""""
" Split and Tabbed Files
"""""""""""""""""""""""""""""""

set splitbelow splitright

" Re
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusting split sizes a bit more friendly
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Switch to a open buffer.
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap gb :ls<CR>:b<Space>

" Change 2 split windwos from vert to horiz or from horiz to vert
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" Removes pipes | that acts as separator on splits
set fillchars+=vert:\ 

" Toggle search highlight
nnoremap <leader>m ::set invhlsearch<cr>

colorscheme molokai

" Cursorline highligt colors
set cursorline      " Highlight current line
highlight CursorLine ctermbg=237
highlight Visual cterm=bold ctermbg=7 ctermfg=NONE


" Cursor settings.
" https://github.com/microsoft/terminal/issues/4335
if &term =~ '^xterm'
    " normal mode
    let &t_EI .= "\<Esc>[1 q"
    " insert mode
    let &t_SI .= "\<Esc>[5 q"
endif

" restore cursor shape to 'bar |', at vim's exit
let &t_TE .= "\<Esc>[5 q"

" set lcs=trail:.     " Show trail spaces as “.”, use it with set list
" :set list     will show what kind of spaces or trailing spaces is being
" used.
set listchars=eol:$,nbsp:_,tab:<->,trail:~,extends:> ",space:+

" <C-o> is used to issue a normal mode command without leaving insert mode.
inoremap <C-e> <C-o>a

" FINDING FILES
" Search down into subfolder
    " Provides tab-completion for all file-related tasks
set path+=**
nnoremap <leader>f :find *

" Display all matching files when we tab complet
"set wildmenu

" NOW WE CAN
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER
" - :b lets you autocomplete any open buffer

" To highlight the split on focus. See vim splits on gg doc.
hi StatusLine term=bold,reverse cterm=bold ctermbg=245 ctermfg=16 gui=bold guibg=#808070 guifg=#000000
hi StatusLineNC term=reverse cterm=NONE ctermbg=59 ctermfg=16 gui=italic guibg=#404c4c guifg=#000000

" Customer command aliases 
command! Cs set ft=cs

" let g:netwr_browse_split = 0
" For netrw explorer to take 20% of screen, when using v
let g:netrw_winsize = 80

" vim-plug secction
call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
call plug#end()
