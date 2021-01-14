let mapleader = ' '
" Use system clipboard
set clipboard+=unnamedplus

"Custom Shortcuts
command! Reload execute "source ~/.config/nvim/init.vim"
"Vertically center document when entering insert mode
"autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
"autocmd BufWritePre * %s/\s\+$//e

" Enable spell checking, s for spell check
"map <leader>s :setlocal spell! spelllang=en_au<CR>

" Enable Disable Auto Indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>
" Remove highlightening
map <leader>c :noh<CR>
" Save with ZS
nnoremap ZS :wa<cr>
" Save and close all
nnoremap ZA :wqa<cr>
" Just close
nnoremap ZQ :q!<cr>

" Autocompletion ui
set wildmode=longest,list,full

" Fix indenting visual block
vmap < <gv
vmap > >gv

"Faster window Switch
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k> 
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"Set new split windows to bottom right
set splitbelow
set splitright

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax on
" set hidden
set noerrorbells
"https://stackoverflow.com/questions/36724209/disable-beep-of-linux-bash-on-windows-10
set visualbell
set tabstop=2 softtabstop=2
set shiftwidth=2
"Move by shiftwidth ( only indent 2 4 6 .. possible not 5 to 7)
set shiftround
set expandtab
set smartindent
set rnu "relative line numbers
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
"No autocomment when hitting enter
set formatoptions-=r
"set termguicolors

"Abbreviations
iabbrev cl console.log(
iabbrev <expr> ddd strftime('%c')
iabbrev bpry binding.pry

" var -> #{var}
let @s = 'hea}^[Bi#+<80>kb{^[A ^['
" Align paragraph
noremap <leader>a =ip

call plug#begin('~/local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'habamax/vim-gruvbit'
Plug 'turbio/bracey.vim'
Plug 'neoclide/vim-jsx-improve'
Plug 'preservim/nerdtree'
Plug 'wakatime/vim-wakatime'
Plug 'vim-airline/vim-airline' 
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'will133/vim-dirdiff'
Plug 'vimwiki/vimwiki'
" Git
Plug 'tpope/vim-fugitive'
"Ruby Plugins
"Plug 'tpope/vim-endwise'
"Plug 'ngmy/vim-rubocop'
"Icons
"Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme gruvbox
set background=dark

" NERDTree Settings
" Toggle Nerdtree
nmap <C-f> :NERDTreeToggle<CR>
"Open Nerdtree on VIM startup
"autocmd vimenter * NERDTree
"Close vim if Nerdtree is only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
   
"ALE Settings
" Set specific linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1 
"Enable vim-airline integration
let g:airline#extensions#ale#enabled = 1
"Show left error collumn always for smooth start
set signcolumn=yes
"Set hotkey to ALEFix file with rubocop
map <leader>af :ALEFix rubocop<CR>
map <leader>at :ALEToggle<CR>
" Disable ALE auto highlights
let g:ale_set_highlights = 0 

"use gf : Go File
source $HOME/.config/nvim/plug-config/vim-airline.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/vim-fugitive.vim

" CTRL+Arrows to resize splits
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-down> :resize +5<cr>
nnoremap <C-up> :resize -5<cr>
nnoremap <C-right> :vertical resize +5<cr>

nnoremap <leader>l gg/control 30[0-9][0-9][0-9] 10<Enter>n:echo 'LINKS'<Enter>"
nnoremap <leader>r gg/control 31[0-9][0-9][0-9] 10<Enter>n:echo 'RECHTS'<Enter>"
nnoremap <leader>o gg/control 30[0-9][0-9][0-9] 1[0-9][0-9] <Enter>n:echo 'OBEN'<Enter>"
" nnoremap <leader>u gg/control 31[0-9][0-9][0-9] 2[0-9][0-9][0-9] <Enter>n:echo 'UNTEN'<Enter>"
nnoremap <leader>u gg/control 30[0-9][0-9][0-9] 2[0-9][0-9][0-9] <Enter>n:echo 'UNTEN'<Enter>"
