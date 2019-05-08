
" .vimrc / init.vim
" The following vim/neovim configuration works for both Vim and NeoVim

" Appearance {{{
  set relativenumber "rnu
  set autoread " detect when a file is changed
  set wrap " turn on line wrapping
  set wrapmargin=4 " wrap lines when coming within n characters from side
  set linebreak " set soft wrapping
  set showbreak=… " show ellipsis at breaking
  set autoindent " automatically set indent of new line
  set ttyfast " faster redrawing
  set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
  set laststatus=2 " show the satus line all the time

  set wildmenu
  set so=999

  set history=1000 " change history to 1000
  set textwidth=180

  set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


  " code folding settings
  set foldmethod=syntax " fold based on indent
  set foldlevelstart=99
  set foldnestmax=10 " deepest fold is 10 levels
  set nofoldenable " don't fold by default
  set foldlevel=1

  " toggle invisible characters
  set list
  set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
  set showbreak=↪

  set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

  if &term =~ '256color'
  " disable background color erase
    set t_ut=
  endif

  " enable 24 bit color support if supported
  if (has("termguicolors"))
      if (!(has("nvim")))
          let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
          let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      endif
      set termguicolors
  endif


  if (has('nvim'))
    " show results of substition as they're happening
    " but don't open a split
    set inccommand=nosplit
  endif

  set backspace=indent,eol,start " make backspace behave in a sane manner

  " Use osx keyboard
  set clipboard=unnamedplus
  if has('mac')
    set clipboard=unnamed
  endif

  if has('mouse')
    set mouse=a
  endif

  " Searching
  set ignorecase " case insensitive searching
  set smartcase " case-sensitive if expresson contains a capital letter
  set hlsearch " highlight search results
  set incsearch " set incremental search, like modern browsers
  set nolazyredraw " don't redraw while executing macros

  set magic " Set magic on, for regex

  " error bells
  set noerrorbells
  set visualbell
  set t_vb=
  set tm=500

  " Tab control
  set expandtab " insert tabs rather than spaces for <Tab>
  set tabstop=2 " the visible width of tabs
  set softtabstop=2 " edit as if the tabs are 2 characters wide
  set shiftwidth=2 " number of spaces to use for indent and unindent
  set shiftround " round indent to a multiple of 'shiftwidth'

  " File behaviour "
  set linebreak
  set breakindent
  set nostartofline
  set smartindent

  set splitbelow
  set splitright

  "}}}

  call plug#begin('~/.config/nvim/plugged')

    " On-demand loading
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    " Plugin outside ~/.vim/plugged with post-update hook
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'w0rp/ale'
    Plug 'vim-airline/vim-airline'
    Plug 'jlanzarotta/bufexplorer'
    
  call plug#end()

  let NERDTreeShowHidden = 1

  map <C-b> :NERDTreeToggle<CR>
  map ; :FZF<CR>:w

  "ALE config
  let g:ale_linters = {
  \   'javascript': ['prettier']
  \}
  let g:ale_fixers = {
  \   'javascript': ['prettier']
  \}
  let g:ale_linters_explicit = 1
  let g:ale_fix_on_save = 1


  "Vim Airline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#ale#enabled = 1

  "cycle through buffers with tab
  "reverse with shift + tab
  nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
  nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
