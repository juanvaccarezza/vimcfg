" General
     " use indentation for folds
     set foldmethod=indent
     set foldnestmax=5
     set foldlevelstart=99
     set foldcolumn=0
     " Sets how many lines of history VIM has to remember
     set history=700
     " Set to auto read when a file is changed from the outside
     set autoread
     " With a map leader it's possible to do extra key combinations
     " like <leader>w saves the current file
     let mapleader = ","
     let g:mapleader = ","
     " Leader key timeout
     set tm=1000
     " Allow the normal use of "," by pressing it twice
     noremap ,, ,
     " Use par for prettier line formatting
     set formatprg="PARINIT='rTbgqR B=.,?_A_a Q=_s>|' par\ -w72"
     " Kill the damned Ex mode.
     nnoremap Q <nop>
     " Exit Insert mode without getting Carpal Tunnel Syndrome.
     inoremap jk <esc>

"Vundle
    set nocompatible
    filetype off
    if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
            !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    endif
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " let Vundle manage Vundle
    " required!
    Bundle 'gmarik/vundle'
    " Theme
       Bundle 'vim-scripts/wombat256.vim'
        try
            colorscheme wombat256mod
        catch
        endtr
    "Supertab completes with tab while inserting
        Bundle 'ervandew/supertab'
        " Use the context to seach for completion (the smartest :D)
        let g:SuperTabDefaultCompletionType = "context"
    "Bbye closes the buffers without modify the windows layout
        Bundle 'moll/vim-bbye'
        noremap <leader>bd :Bd<CR>
    " Syntastic check syntax for almost everithing :P
        Bundle 'scrooloose/syntastic'
    " Airline places the nice status bar on the bottom
        Bundle 'vim-airline/vim-airline'
        Bundle 'vim-airline/vim-airline-themes'
        set laststatus=2 " Always show the airline
        set noshowmode " Only shoy the mode on the airline
        let g:airline#extensions#tabline#enabled = 1
    "NERDTree shows a file system navigator
        Bundle 'scrooloose/nerdtree'
        " returns true iff is NERDTree open/active
        function! IsNERDTreeOpen()
            return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
        endfunction
        " If nerd tree is closed, find current file, if open, close it
        function! ToggleFindNerd()
            if IsNERDTreeOpen()
                exec ':NERDTreeToggle'
            else
                exec ':NERDTreeFind'
            endif
         endfunction
         nmap <silent> <leader>nt <ESC>:call ToggleFindNerd()<CR>
    "CtrlP finds files and buffers
        Bundle 'kien/ctrlp.vim'
        " Fuzzy find files
        nnoremap <silent> <Leader><space> :CtrlP<CR>
        let g:ctrlp_max_files=0
        let g:ctrlp_show_hidden=1
        let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git)$' }
        " Fuzzy find buffers
        noremap <leader>b<space> :CtrlPBuffer<cr>
    "Tabular makes aligments and tabulations easy
        Bundle 'godlygeek/tabular'
        "Calling Tabularize remove_leading_spaces alings to left
        noremap <leader>tl :Tabularize remove_leading_spaces<CR>
        noremap <leader>t= :Tabularize /=\zs<CR>
        noremap <leader>t: :Tabularize /:\zs<CR>
        noremap <leader>t, :Tabularize /,<CR>
        noremap <leader>t<bar> :Tabularize /<bar><CR>
    "Commentary comments on code
        Bundle 'tpope/vim-commentary'
    "Vimwiki has your own wiki on the disk with links and format.
        Bundle 'vimwiki/vimwiki'
    "Taskpaper GTD based on the taskpaper for mak
        Bundle 'davidoc/taskpaper.vim'
    "Fugitive git console commands wrapper
        Bundle 'tpope/vim-fugitive'
        set diffopt=vertical
    " Vimux sends and open tmux terminals
        Bundle 'benmills/vimux'
        map <Leader>vp :VimuxPromptCommand<CR>
        map <Leader>vl :VimuxRunLastCommand<CR>
        map <Leader>vq :VimuxCloseRunner<CR>   
    " Allow pane movement to jump out of vim into tmux
        Bundle 'christoomey/vim-tmux-navigator'

  " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required

" VIM user interface 
     " Set 7 lines to the cursor - when moving vertically using j/k
     set so=7
     " Turn on the WiLd menu
     set wildmenu
     " Tab-complete files up to longest unambiguous prefix
     set wildmode=list:longest,full
     " Always show current position
     set ruler
     set number
     set cursorline
     " Show trailing whitespace
     set list
     " But only interesting whitespace
     if &listchars ==# 'eol:$'
     set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
     endif
     " Height of the command bar
     set cmdheight=1
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
     set vb t_vb=
    " Force redraw
     map <silent> <leader>r :redraw!<CR>
     " Turn mouse mode on
     nnoremap <leader>ma :set mouse=a<cr>
     " Turn mouse mode off
     nnoremap <leader>mo :set mouse=<cr>
     " Default to mouse mode on
     set mouse=a

"Colors and Fonts 
    if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
    endif
    try
       colorscheme wombat256mod
    catch
    endtry
    syntax on
    " Use same color behind concealed unicode characters
    hi clear Conceal

    " Don't blink normal mode cursor
    set guicursor=n-v-c:block-Cursor
    set guicursor+=n-v-c:blinkon0
    set t_Co=256

    " Searing red very visible cursor
    hi Cursor guibg=red

    " Use pleasant but very visible search hilighting
    hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d
    hi! link Visual Search

    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8

    " Use Unix as the standard file type
    set ffs=unix,dos,mac

" Text, tab and indent related 
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

" Moving around, tabs, windows and buffers 
    " Treat long lines as break lines (useful when moving around in them)
    nnoremap j gj
    nnoremap k gk
    noremap <c-h> <c-w>h
    noremap <c-k> <c-w>k
    noremap <c-j> <c-w>j
    noremap <c-l> <c-w>l

    " Disable highlight when <leader><cr> is pressed
    " but preserve cursor coloring
    nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>

    " Return to last edit position when opening files (You want this!)
    augroup last_edit
    autocmd!
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \ exe "normal! g`\"" |
          \ endif
    augroup END

    " Remember info about open buffers on close
    set viminfo^=%

    " Open window splits in various places
    nmap <leader>sh :leftabove vnew<CR>
    nmap <leader>sl :rightbelow vnew<CR>
    nmap <leader>sk :leftabove new<CR>
    nmap <leader>sj :rightbelow new<CR>

    " don't close buffers when you aren't displaying them
    set hidden

    " previous buffer, next buffer
    nnoremap <leader>bp :bp<cr>
    nnoremap <leader>bn :bn<cr>

" Files, backups and undo 
    " Turn backup off, since most stuff is in Git anyway...
    set nobackup
    set nowb
    set noswapfile

    " Source the vimrc file after saving it
    augroup sourcing
    autocmd!
    autocmd bufwritepost .vimrc source $MYVIMRC
    augroup END

    " Open file prompt with current path
    nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

