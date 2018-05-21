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
set clipboard=unnamedplus

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

" Integrate LaTeX plugin
autocmd FileType tex setlocal spell spelllang=en_us
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_ViewRule_pdf = "evince2"
let g:Tex_DefaultTargetFormat = "pdf"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
" SHORTCUTS
" \ll	compile
" \lv	view



" Pathogen plugin manager stuff
execute pathogen#infect()


" Arduino plugin options
let g:arduino_cmd 	= '/usr/bin/arduino'	"path to arduino command
let g:arduino_dir 	= '/home/$USER/Arduino'	"path to arduino directory
let g:arduino_args 	= '--verbose-upload'	"additional arguments passed to arduino command
let g:arduino_board 	= 'archlinux-arduino:avr:uno'	"board type when compiling
let g:arduino_programmer= 'arduino:usbtinyisp'	"programmer type when compiling
let g:arduino_serial_baud=9600			"baud rate for debugging serial
let g:arduino_auto_baud	= 1			"detect baud if 'Serial.begin()'
let g:arduino_serial_tmux ='split-window -d'	"run serial monitor inside tmux command if running
let g:arduino_serial_port = '/dev/ttyACM0'	"connect to this serial port when uploading
let g:arduino_serial_port_globs = ['dev/ttyACM*', 
				\'/dev/ttyUSB*',
				\'/dev/tty.usbmodem*',
				\'/dev/tty.usbserial*'] "search patterns to find likely serial port

" Arduino commands:
"
" :ArduinoChooseBoard <board>		Set currently selected board in the
"					format 'package:arch:board[:parameters]'
"					(set shortcut: '\ab')
" :ArduinoChooseProgrammer <programmer>	Set programmer of current board in the
" 					format 'package:programmer' (set
" 					shortcut: '\ap')
" :ArduinoChoosePort <port>		Set currently selected serial port; no
" 					arguments gives list
" :ArduinoVerify			Compile project (set 
" 					shortcut: '\av')
" :ArduinoUpload			Compile and upload project (set
" 					shortcut: '\au')
" :ArduinoSerial			Open serial port connection (set
" 					shortcut: )
" :ArduinoUploadAndSerial		Compile and upload project (set
" 					shortcut: '\ad')
"-------
" Arduino Shortcuts configured in ~/.vim/bundle/vim-arduino/ftplugin
" Arduino Boards:
" archlinux-arduino:avr:mega:cpu=atmega2560
" archlinux-arduino:avr:uno



" Vim Powerline status
"if display
if $DISPLAY != ""
	"powerline status bar
	let g:powerline_pycmd="py3"
	"set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim
	set rtp+=/home/trevorbautista/.vim/bundle/powerline/bindings/vim
	"always show statusline
	set laststatus=2
	"use 256 colors
	set t_Co=256
"if no display
else
	"
	let g:powerline_loaded = 1
endif
