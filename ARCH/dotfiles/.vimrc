" Custom Configuration

" Attempt to auto-indent lines by identifying language by filetype
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Enable line numbering
set number

" Reuse same window and switch from an unsaved buffer without saving
" first; keep an undo history for multiple files when reusing same
" window
set hidden

" Use "+ register fr clipboard (CLIPBOARD buffer in X)
"set clipboard=unnamedplus
set clipboard=unnamed

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display cursor position on last line of screen
set ruler

" Enable use of a mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2


