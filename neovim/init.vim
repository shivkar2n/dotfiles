
"  ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
" ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
" ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
" ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
" ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
" ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 

"{{{ PLUGINS
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins')

	"{{{ BASIC PLUGINS
		Plugin 'VundleVim/Vundle.vim'
		Plugin 'tpope/vim-surround'    
		Plugin 'preservim/nerdtree'			
		Plugin 'mhinz/vim-startify'
		Plugin 'voldikss/vim-floaterm'
		Plugin 'jiangmiao/auto-pairs'
		Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plugin 'junegunn/fzf.vim'
		Plugin 'preservim/nerdcommenter'
		Plugin 'lukas-reineke/indent-blankline.nvim'
		Plugin 'chrisbra/Colorizer'
		Plugin 'mbbill/undotree'
		Plugin 'dominickng/fzf-session.vim'
		Plugin 'Shougo/deoplete.nvim'
		Plugin 'ap/vim-css-color'
		Plugin 'dense-analysis/ale'
	"}}} 
	
	"{{{ GIT PLUGINS
		Plugin 'airblade/vim-gitgutter'
		Plugin 'tpope/vim-fugitive'
	"}}}
	
"{{{SNIPPETS
" Snippets engine
Plugin 'SirVer/ultisnips'
" Snippets library
Plugin 'honza/vim-snippets'
"}}}

"{{{ DOCKER 
		Plugin 'ekalinin/Dockerfile.vim'
"}}}

"{{{ CUSTOMIZATION
	Plugin 'itchyny/lightline.vim'
	Plugin 'shaunsingh/nord.nvim'
	Plugin 'catppuccin/nvim', {'as': 'catppuccin'}
	Plugin 'sainnhe/everforest', {'as': 'everforest'}
	Plugin 'ryanoasis/vim-devicons'			
" }}}

call vundle#end()
"}}}

"{{{SNIPPETS CONFIGURATION
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
nnoremap <A-t> :Snippets<CR>
"}}}

"{{{ BASIC CONFIGURATION

set nocompatible
colorscheme everforest
filetype off 
set termguicolors
set autoread
set t_Co=256
set number
set path+=""
set encoding=utf8
set wildignore=*.o,*.obj,*.bak,*.exe,*.hi,*.dyn_hi,*.dyn_o,*.zip,*.pdf
set cursorline
set showmatch
set linebreak
set ignorecase
set smartcase
set clipboard+=unnamedplus
set mouse=a
set tabstop=4
set shiftwidth=4
set softtabstop=4
set spelllang=en_us
set fillchars+=eob:\
set autoindent
set nu
set nowrap
set incsearch
set laststatus=2
set ve+=onemore
set nolist
set listchars=tab:│\
set noshowmode
set updatetime=100
set foldenable
set foldmethod=marker
set foldmarker={{{,}}}
set relativenumber
set hidden
set nobackup
set nowritebackup
set shortmess+=c
"set guifont=Hack\ Regular\ 15.0
"set guifont=JetBrains\ Mono\ Medium\ 15
set guifontwide=JetBrains\ Mono\ Medium\ 15
syntax on

if $TERM == "xterm-256color" "For terminal
  set t_Co=256
endif

"}}}

	" COMPLETION ENGINE {{{ 
	let g:deoplete#enable_at_startup = 1
	call deoplete#custom#option('sources', {
	\ '_': ['ale', 'ultisnips'],
	\})
	" }}}
	
"{{{SESSIONS 
let g:fzf_session_path = '/home/shivkar2n/.vim/sessions'
nnoremap <A-m> :Sessions<CR>
"}}}

"{{{  KEYBINDINGS
let mapleader = " "

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>i :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

nnoremap <F6> :cd %:p:h <bar> :NERDTree %<CR>

"Disable git gutter bindings
let g:gitgutter_map_keys = 0

"Command Palette (FZF)
nnoremap <silent> <A-u> :BLines<CR>
nnoremap <silent> <A-i> :Windows<CR>
nnoremap <silent> <A-o> :History<CR>
nnoremap <silent> <A-y> :FZF<CR>
nnoremap <silent> <A-[> :Rg<CR>

"Split resizing
noremap <silent> <A-l> :vertical resize +2<CR>
noremap <silent> <A-h> :vertical resize -2<CR>
noremap <silent> <A-k> :resize +2<CR>
noremap <silent> <A-j> :resize -2<CR>

"}}}

"{{{LIGHTLINE
let g:lightline = {
	  \ 'colorscheme': 'everforest',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
	  \ 'component_function': {
	  \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
	  \ },
  \ }

 "'charvaluehex' :'\ue0a0',
 

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"}}}

"{{{ STARTIFY 
let g:startify_files_number = 5 
let g:startify_update_oldfiles = 1
let g:startify_change_to_vcs_root = 0
let g:startify_padding_left = 4 
let g:startify_session_autoload = 0
let g:startify_session_dir = '~/.vim/session'
" let g:startify_custom_header =
"             \ startify#pad(split(system('figlet -f chunky technicaldc'), '\n'))

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['	BOOKMARKS:']      },
          \ { 'type': 'files',     'header': ['	RECENTS:']            },
          \ { 'type': 'dir',       'header': ['	CURRENT DIRECTORY: '. getcwd()] },
          \ { 'type': 'commands',  'header': ['	COMMANDS:']       },
          \ ]

let g:startify_bookmarks = [
		\ { 'g': '~/github_token.md' },
		\ { 'p': '~/ContributingProjects' },
		\ { 'c': '~/Desktop/CodeChef' },
		\ { 'f': '~/Desktop/CodeForces' },
		\]

let g:startify_custom_header = [ "", 
	\ "",
	\ "	███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗		",
	\ "	████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      ",
	\ "	██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      ",
	\ "	██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      ",
	\ "	██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║		",
	\ "	╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝		",
	\ "",
	\ ]

let g:startify_custom_footer = ''

highlight StartifyBracket ctermfg=Green
highlight StartifySlash ctermfg=Green
highlight StartifyFile ctermfg=Yellow
highlight StartifySection cterm=Bold ctermfg=Red
highlight StartifySpecial ctermfg=Magenta

" }}}

"{{{ NERD TREE CONFIG

nnoremap <silent> tt :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=0
let NERDTreeMinimalUI =1
let g:NERDTreeWinSize=20

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
	\ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
	\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"" }}}

"{{{ CUSTOM SCRIPTS

function! PrintCode() "Print code in pdf format
	:cd %:h
	let name = expand('%:t:r')
	let filename = name . ".pdf"
	:hardcopy > test.ps
	:exe "!ps2pdf test.ps " . filename
	:exe "!evince " . filename . " &"
	:! rm -r test.ps
endfunction

function! Markdown2Pdf() "Convert markdown file to pdf
	:cd %:h
	let name = expand('%:t:r')
	:! str="${".name."// /_}"
	let filename = "" . name . ".pdf"
	:exe "!cat " . name . ".md | npx md-to-pdf > " . filename  
	:exe "!evince " . filename " &" 
endfunction


let g:hex_toggle = 0
function! HexModeToggle() "View file as a byte stream
	if g:hex_toggle == 0
		let g:hex_toggle = 1
		:%!xxd
	else 
		let g:hex_toggle = 0
		:%!xxd -r
	endif
endfunction
"}}}

" FLOAT-TERMINAL CONFIG {{{1 
nnoremap <silent> <leader>o :FloatermNew --height=0.4 --width=1.0 --wintype=float --name=floaterm1 --position=bottom --autoclose=2 <CR>
tnoremap <silent> <leader>o <C-\><C-n> :FloatermNew --height=0.4 --width=1.0 --wintype=float --name=floaterm1 --position=bottom --autoclose=2 <CR>
nnoremap <silent> <leader>t :FloatermToggle <CR>
tnoremap <silent> <leader>t <C-\><C-n> :FloatermToggle <CR>
nnoremap <silent> <leader>` FloatermKill <CR>
tnoremap <silent> <leader>` <C-\><C-n>:FloatermKill<CR>
nnoremap <silent> <leader>[ :FloatermPrev<CR>
tnoremap <silent> <leader>[ <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <leader>] :FloatermNext<CR>
tnoremap <silent> <leader>] <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <leader>g :FloatermNew --height=0.8 --width=1.0 --wintype=float --name=floaterm1 --position=center --autoclose=2 lazygit <CR>
nnoremap <silent> <leader>d :FloatermNew --height=0.8 --width=1.0 --wintype=float --name=floaterm1 --position=center --autoclose=2 lazydocker <CR>
" 1}}} 

" ASYNCHRONOUS LINTING ENGINE  {{{ 
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\	'go': ['gopls'],
\   'javascript': ['quick-lint-js'],
\   'py': ['pylint'],
\   'cpp': ['ccls'],
\   'c': ['ccls'],
\}
" }}} ASYNCHRONOUS LINTING ENGINE

"{{{CODE FORMATTER
" PYTHON
autocmd FileType python autocmd BufWritePre <buffer> exec '!autopep8 '.shellescape('%') '--in-place'
" C
autocmd FileType c autocmd BufWritePre <buffer> exec '!clang-format -i '.shellescape('%')
" CPP
autocmd FileType cpp autocmd BufWritePre <buffer> exec '!clang-format -i '.shellescape('%')
" GO
autocmd FileType go autocmd BufWritePre <buffer> exec '!go fmt '.shellescape('%')
"}}}

"{{{ CODERUNNER
" PYTHON
autocmd filetype python nnoremap <F4> :FloatermNew --height=0.4 --width=1.0 --wintype=float --name=floaterm1 --position=bottom --autoclose=0 python3 %< <CR>
" C
autocmd filetype c nnoremap <F4> :FloatermNew --height=0.4 --width=1.0 --wintype=float --name=floaterm1 --position=bottom --autoclose=0 gcc % -o %< && ./%<
" C++
autocmd filetype cpp nnoremap <F4> :FloatermNew --height=0.4 --width=1.0 --wintype=float --name=floaterm1 --position=bottom --autoclose=0 g++ % -o %< && ./%<<CR>
" JAVASCRIPT
autocmd filetype javascript nnoremap <F4> :FloatermNew --height=0.4 --width=1.0 --wintype=float --name=floaterm1 --position=bottom --autoclose=0 node %< <CR>
" GO
autocmd filetype go nnoremap <F4> :FloatermNew --height=0.4 --width=1.0 --wintype=float --name=floaterm1 --position=bottom --autoclose=0 go run %< <CR>
" YAML
autocmd filetype yaml nnoremap <F4> :FloatermNew --height=0.4 --width=1.0 --wintype=float --name=floaterm1 --position=bottom --autoclose=0 yamllint %< <CR>
"}}}

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
