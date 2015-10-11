
" Allows you to have multiple buffers open
set hidden
" Lines of code will not wrap to the next line
" set nowrap
" Make backspace behave like other editors
set backspace=indent,eol,start
" Automatically indent on new lines
set autoindent
" Copy the indentation of the previous line if auto indent doesn't know what to do
set copyindent
" Indenting a line with >> or << will indent or un-indent by 4
set shiftwidth=4
" Pressing tab in insert mode will use 4 spaces
set softtabstop=4
" Use spaces instead of tabs
set expandtab
" Highlight matching braces/tags
set showmatch
" Ignore case when searching
set ignorecase
" ...unless there's a capital letter in the query
set smartcase
" Indent to correct location with tab
set smarttab
" Highlight search matches
set hlsearch
" Search while you enter the query, not after
set incsearch
" display line number
set number
" More undos
set undolevels=1000
" Vim can set the title of the terminal window
set title
" Use a visual indicator instead of a beep
set visualbell
" Or just turn error bells off with this
set noerrorbells
" Enable syntax highlighting
syntax enable
" Tell vim that your terminal supports 256 colors
set t_Co=256
" Toggle paste mode with F2
set pastetoggle=<F2>
" Use ; instead of : to enter commands, saves a lot of keystrokes in the long run
nnoremap ; :
" Force dark background
set background=dark
" base16 ocean theme
colorscheme base16-ocean
hi LineNr ctermfg=darkgrey ctermbg=black
