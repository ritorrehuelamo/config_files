call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' " Temas para airline 
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

" Configuraciones
set title " Muestra el nombre del archivo en la ventana de la terminal
set number " Muestra los números de las lineas
set mouse=a " Permite la integración del mouse

set termguicolors " Activa true colors en la terminal
colorscheme onedark " Activa tema onedark

set cursorline " Resalta la línea actual
set colorcolumn=120 " Muestra la columna límite a 120 caracteres

" Identación a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround

function! AirlineInit()
	" Airline plugin configuration
	let g:airline#extensions#tabline#enabled = 1 " Mostrar buffers abiertos (como pestañas)
	let g:airline#extensions#tabline#fnamemod = ':t' " Mostrar sólo el nombre del archivo
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#formatter = 'default'
endfunction

autocmd VimEnter * call AirlineInit()

" Cargar fuente Powerline y símbolos (ver nota)
let g:airline_powerline_fonts = 1

set noshowmode " No mostrar el modo actual (ya lo muestra la barra de estado)

" NerdTree config
let g:NERDTreeChDirMode = 2 " Cambia el directorio actual al nodo padre actual

" Abrir/cerrar NERDTree con F2
map <F2> :NERDTreeToggle<CR>

" COC Configurations
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Don't pass messages to |ins-completation-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make suer tab is not mapped by
" other plugin before putting this into your configuration.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() = "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col(".") - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
