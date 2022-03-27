"         __                     
" .--.--.|__|.--------.----.----.
" |  |  ||  ||        |   _|  __|
"  \___/ |__||__|__|__|__| |____|
"

"Plugins 
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/plugins')
Plugin 'VundleVim/Vundle.vim'

"{{{BASIC CUSTOMIZATION
"
Plugin 'itchyny/lightline.vim'
Plugin 'ryanoasis/vim-devicons'			" For icons
Plugin 'catppuccin/nvim', {'as': 'catppuccin'}
Plugin 'dracula/vim', { 'name': 'dracula' } 
Plugin 'sainnhe/everforest'
Plugin 'dylanaraps/wal.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'morhetz/gruvbox'

" }}}

"{{{ BASIC PLUGINS

Plugin 'tpope/vim-surround'    
Plugin 'preservim/nerdtree'			" added nerdtree
Plugin 'junegunn/goyo.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'mhinz/vim-startify'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'komissarex/vim-progress'
Plugin 'honza/vim-snippets'
Plugin 'lervag/vimtex'
Plugin 'lukas-reineke/indent-blankline.nvim'
Plugin 'voldikss/vim-floaterm'

"}}} 

"{{{Web Development

Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'
Plugin 'pantharshit00/vim-prisma'
Plugin 'turbio/bracey.vim',{'do': 'npm install --prefix server'}
Plugin 'joukevandermaas/vim-ember-hbs'

"}}} 

" Python Development
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Syntax highlighting
Plugin 'vim-python/python-syntax'
Plugin 'plasticboy/vim-markdown'

" Vim Wiki
Plugin 'vimwiki/vimwiki'

"Git plugins {{{
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

call vundle#end()
"}}}

"{{{Basic Configuration

set nocompatible
syntax on

filetype off 
set termguicolors
set autoread
set t_Co=256
set number
set path+=""
set encoding=UTF-8
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
"set fillchars+=eob:\
set autoindent
set nu
set nowrap
set incsearch
set laststatus=2
set ve+=onemore
set clipboard=unnamedplus
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

"}}}

"For Note Taking
let g:vimwiki_list = [{ 'path': '~/Documents/notes/',
       \ 'syntax':'markdown', 'ext': '.md' }]

"For terminal
if $TERM == "xterm-256color"
  set t_Co=256
endif

"Map leader 
let g:multi_cursor_use_default_mapping=0
let mapleader = " "

"{{{LIGHTLINE
let g:lightline = {
			\ 'colorscheme': 'catppuccin',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
	  \ 'component_function': {
	  \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
	  \ },
  \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"}}}

"Read ejs files as html
au BufNewFile,BufRead *.ejs set filetype=html

"{{{PRINTCODE
function! PrintCode()
	let name = expand('%:t:r')
	let filename = name . ".pdf"
	:hardcopy > test.ps
	:exe "!ps2pdf test.ps " . filename
	:exe "!zathura " . filename . " &"
	:! rm -r test.ps
endfunction
"}}}

colorscheme catppuccin

"{{{  KEYBINDINGS
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
nnoremap <C-f> :NERDTreeFind<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

nnoremap <F2> :1only<CR>
nnoremap <F3> :call PrintCode()<CR>
nnoremap <F6> :cd %:h <bar> :NERDTree %<CR>


"Disable git gutter bindings
let g:gitgutter_map_keys = 0

"Command Palette (FZF)
nnoremap <silent> <c-P> :FZF<CR>
nnoremap <silent> <c-O> :History<CR>
nnoremap <silent> <c-I> :BLines<CR>


"Keybindings for split resizing
noremap <silent> <A-l> :vertical resize +2<CR>
noremap <silent> <A-h> :vertical resize -2<CR>
noremap <silent> <A-k> :resize +2<CR>
noremap <silent> <A-j> :resize -2<CR>

" Remap keys for ultisnips 
let g:UltiSnipsExpandTrigger="<S-t>"
let g:UltiSnipsJumpForwardTrigger="<S-f>"
let g:UltiSnipsJumpBackwardTrigger="<S-b>"

"}}}

" STARTIFY {{{
let g:startify_files_number = 10
let g:startify_update_oldfiles = 1
let g:startify_change_to_vcs_root = 0
let g:startify_padding_left = 4
let g:startify_session_autoload = 0
let g:startify_session_dir = '~/.vim/session'
" let g:startify_custom_header =
"             \ startify#pad(split(system('figlet -f chunky technicaldc'), '\n'))

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   BOOKMARKS:']      },
          \ { 'type': 'files',     'header': ['   RECENTS:']            },
          \ { 'type': 'dir',       'header': ['   CURRENT DIRECTORY: '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   SESSIONS:']       },
          \ { 'type': 'commands',  'header': ['   COMMANDS:']       },
          \ ]

let g:startify_bookmarks = [
		\ { 'g': '~/github_token.md' },
		\ { 'p': '~/ContributingProjects' },
		\ { 'w': '~/vimwiki/index.wiki' },
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
"
"{{{ FLOATING TERMINAL
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_kill   = '<F10>'
let g:floaterm_keymap_toggle = '<F12>'
"}}}

"{{{BRACEY VIM
let g:Bracey = '<F1>'
let g:BraceyStop = '<F2>'
"}}} 

" NERD TREE CONFIG {{{

nnoremap <silent> tt :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=0
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=23

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" }}}

"{{{ Split Terminal in Bottom
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <Esc> <C-\><C-n>

"}}}

"{{{ COC EXtENSINOS

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"}}}

"{{{ CODERUNNER

" PYTHON
autocmd filetype python nnoremap <F4> :w <bar> exec '!python3 '.shellescape('%')<CR>
" C
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
" C++
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

"}}}
