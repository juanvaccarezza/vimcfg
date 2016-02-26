
" General {
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
     set tm=2000
     " Allow the normal use of "," by pressing it twice
     noremap ,, ,
     " Use par for prettier line formatting
     set formatprg="PARINIT='rTbgqR B=.,?_A_a Q=_s>|' par\ -w72"
     " Kill the damned Ex mode.
     nnoremap Q <nop>
     " Exit Insert mode without getting Carpal Tunnel Syndrome.
     inoremap jk <esc>
"}

" Vundle {
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
     " Support bundles
     Bundle 'benmills/vimux'
     " Bundle 'Shougo/vimproc.vim'
     Bundle 'ervandew/supertab'
     Bundle 'scrooloose/syntastic'
     "Falta configurar algo para eliminar los buffers con el leader (ir a mirar lla página)
     Bundle 'moll/vim-bbye' 
     " Bundle 'nathanaelkane/vim-indent-guides'
     " Bundle 'vim-scripts/gitignore'
     " " Git
     " Bundle 'tpope/vim-fugitive'
     " Bundle 'int3/vim-extradite'

     " Bars, panels, and files
     Bundle 'scrooloose/nerdtree'
     Bundle 'bling/vim-airline'
     Bundle 'kien/ctrlp.vim'
     "Bundle 'majutsushi/tagbar' "Plugin para ver los tags de un archivo por ahora
     "no lo queremos

     " Text manipulation
      Bundle 'vim-scripts/Align'
     " Bundle 'vim-scripts/Gundo' Do not install requires python suppor
      Bundle 'tpope/vim-commentary'
      Bundle 'godlygeek/tabular'
      Bundle 'michaeljsmith/vim-indent-object'
      Bundle 'rust-lang/rust.vim'
      " Bundle 'phildawes/racer'
      " " Allow pane movement to jump out of vim into tmux
      Bundle 'christoomey/vim-tmux-navigator'
      Bundle 'vim-voom/VOoM'
      Bundle 'vimwiki/vimwiki'
      Bundle 'davidoc/taskpaper.vim'
      " " Custom bundles
      " if filereadable(expand("~/.vim.local/bundles.vim"))
      " source ~/.vim.local/bundles.vim
      " endif
      " All of your Plugins must be added before the following line
      call vundle#end()            " required
      filetype plugin indent on    " required
" }
" VIM racer configuration{
    
      " let g:racer_cmd = "/home/juan/datos/projects/Personal/rust/racer/target/release/racer"
      " let $RUST_SRC_PATH="/home/juan/datos/projects/Personal/rust/rustc-1.0.0/src/"
" }

" Vim-Wiki {
    " Don't override tab for the tables
      let g:vimwiki_table_mappings = 0
" }
" VIM user interface {{{
     " Set 7 lines to the cursor - when moving vertically using j/k
     set so=7
     " Turn on the WiLd menu
     set wildmenu
     " Tab-complete files up to longest unambiguous prefix
     set wildmode=list:longest,full
     " Always show current position
     set ruler
     set number
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
     if &term =~ '256color'
     " disable Background Color Erase (BCE) so that color schemes
     " render properly when inside 256-color tmux and GNU screen.
     " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
     set t_ut=
     endif
     " Force redraw
     map <silent> <leader>r :redraw!<CR>
     " Turn mouse mode on
     nnoremap <leader>ma :set mouse=a<cr>
     " Turn mouse mode off
     nnoremap <leader>mo :set mouse=<cr>
     " Default to mouse mode on
     set mouse=a

     " In normal mode or in insert mode, press Alt-j to move the current line down, or press Alt-k to move the current line up.
     " After visually selecting a block of lines (for example, by pressing V then moving the cursor down), press Alt-j to move the whole block down, or press Alt-k to move the block up. 
     execute "set <M-j>=\ej"
     execute "set <M-k>=\ek"
     execute "set <M-h>=\eh"
     execute "set <M-l>=\el"
     nnoremap <M-j> :m .+1<CR>==
     nnoremap <M-k> :m .-2<CR>==
     inoremap <M-j> <Esc>:m .+1<CR>==gi
     inoremap <M-k> <Esc>:m .-2<CR>==gi
     vnoremap <M-j> :m '>+1<CR>gv=gv
     vnoremap <M-k> :m '<-2<CR>gv=gv
" }

"Colors and Fonts {
    Bundle 'vim-scripts/wombat256.vim'
    try
        colorscheme wombat256mod
    catch
    endtry
    " Enable syntax highlighting
    " syntax enable
    " Adjust signscolumn and syntastic to match wombat
    hi! link SignColumn LineNr
    hi! link SyntasticErrorSign ErrorMsg
    hi! link SyntasticWarningSign WarningMsg
    " Use pleasant but very visible search hilighting
    hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d
    hi! link Visual Search

    " Enable filetype plugins
    filetype plugin on
    filetype indent on

    " Match wombat colors in nerd tree
    hi Directory guifg=#8ac6f2

    " Searing red very visible cursor
    hi Cursor guibg=red

    " Use same color behind concealed unicode characters
    hi clear Conceal

    " Don't blink normal mode cursor
    set guicursor=n-v-c:block-Cursor
    set guicursor+=n-v-c:blinkon0
    set t_Co=256

    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8

    " Use Unix as the standard file type
    set ffs=unix,dos,mac

"}

" Files, backups and undo {
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

    " Fuzzy find files
    nnoremap <silent> <Leader><space> :CtrlP<CR>
    let g:ctrlp_max_files=0
    let g:ctrlp_show_hidden=1
    let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git)$' }
" }

" Text, tab and indent related {
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
    
    " Use the context to seach for completion (the smartest :D)
    let g:SuperTabDefaultCompletionType = "context"
" }

" Visual mode related {
    " Visual mode pressing * or # searches for the current selection
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :call VisualSelection('f', '')<CR>
    vnoremap <silent> # :call VisualSelection('b', '')<CR>
" }

" Moving around, tabs, windows and buffers {
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

    " Manually create key mappings (to avoid rebinding C-\)
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

    " Vimux commnads
    map <Leader>vp :VimuxPromptCommand<CR>
    map <Leader>vl :VimuxRunLastCommand<CR>
    map <Leader>vq :VimuxCloseRunner<CR>

    " don't close buffers when you aren't displaying them
    set hidden

    " previous buffer, next buffer
    nnoremap <leader>bp :bp<cr>
    nnoremap <leader>bn :bn<cr>

    " delete buffer without closing pane
    noremap <leader>bd :Bd<cr>

    " fuzzy find buffers
    noremap <leader>b<space> :CtrlPBuffer<cr>
" }

" Status line {
    " Always show the status line
    set laststatus=2
" }

" Spell checking {
    " Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>
" }

" NERDTree {
    " Close nerdtree after a file is selected
    let NERDTreeQuitOnOpen = 1
    function! IsNERDTreeOpen()
      return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
    endfunction
    function! ToggleFindNerd()
      if IsNERDTreeOpen()
        exec ':NERDTreeToggle'
      else
        exec ':NERDTreeFind'
      endif
    endfunction
    " If nerd tree is closed, find current file, if open, close it
    nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
    nmap <silent> <C-s> <ESC>:call ToggleFindNerd()<CR>
" }

"Alignment {{{
    " Stop Align plugin from forcing its mappings on us
    let g:loaded_AlignMapsPlugin=1
    " Align on equal signs
    map <Leader>a= :Align =<CR>
    " Align on commas
    map <Leader>a, :Align ,<CR>
    " Align on pipes
    map <Leader>a<bar> :Align <bar><CR>
    " Prompt for align character
    map <leader>ap :Align 
    " Align on spaces 
    map <leader>a<space> :Align ws <CR> 
" }}}
