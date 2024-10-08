" This file contains my personal Vim configuration.
" It customizes various aspects of Vim's behavior, including tabs, 
" search, indentation, and more:
"   - Command history and viminfo
"   - Tab and indentation settings
"   - Search behavior
"   - Auto-indentation
"   - User-defined commands and functions
"   - File type detection and specific settings
"

syntax off

" Command history and viminfo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Increase the number of commands in history
set history=10000

" Settings for the .viminfo file
set viminfo='10000,s10000,h


" Tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4        " Set tab width to 4 spaces
set shiftwidth=4     " Set indentation width to 4 spaces
set expandtab        " Replace tab characters with spaces
"set noexpandtab      " Allow insertion of tab characters when pressing Tab


" Search settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch

"set ignorecase   " Ignore case during incremental search
set smartcase

"set cursorline   " Automatically highlight the word under the cursor


" Auto-indentation settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent        
set smartindent


" User custom commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set a user custom alias for the path /usr/include/*
command! StdHeaders cd ~/bin/glibc-2.39/include

function! MyFileCompletion(ArgLead, CmdLine, CursorPos)
    " Get a list of files in the current directory, starting with ArgLead
    let files = split(glob(a:ArgLead . '*'), "\n")

    " Return the list of files suitable for auto-completion
    return files
endfunction


" Set up auto-completion function for the custom Bs command
command! -nargs=+ -complete=customlist,MyFileCompletion BelowSplit belowright split <args>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
au BufNewFile,BufRead *.sh setlocal shiftwidth=2 tabstop=2 softtabstop=2
au BufNewFile,BufRead * if getline(1) =~ '^#!.*sh' | setfiletype sh | endif
" ... for additional settings ...

filetype plugin indent on
au BufNewFile,BufRead *.sh,*.bash setlocal shiftwidth=2 tabstop=2 softtabstop=2
au BufNewFile,BufRead * if getline(1) =~ '^#!.*\bash\>' | setfiletype sh | endif

