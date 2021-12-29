let mapleader = ' '
" Use system clipboard set clipboard+=unnamedplus

"Custom Shortcuts
command! Reload execute "source ~/.config/nvim/init.vim"

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

"Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun
autocmd FileType markdown,snippets,placeholderx let b:noStripWhitespace=1
autocmd BufWritePre * call StripTrailingWhitespace()

" Enable spell checking, s for spell check
" map <leader>s :setlocal spell! spelllang=en_us<CR>
map <leader>ns :setlocal nospell<CR>
map <leader>s :setlocal spell spelllang=de<CR>
map <leader><leader>s :setlocal spell spelllang=en_us<CR>

" Enable Disable Auto Indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

map <silent><esc> :noh<CR>
"populate quickfixlist with last error and jump to it
map <leader>rm :cex system("ruby main.rb")<CR>
" Save with ZS
nnoremap ZS :wa<cr>
" Save and close all
nnoremap ZA :wqa<cr>
" Just close
nnoremap ZQ :q!<cr>

"write as sudo when forgot to open with root permissions
cmap WW w !sudo tee > /dev/null %

" compile latex
map <leader>c :w<CR>:!pdflatex *tex<CR>

"" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" nnoremap <C-m> :w<cr>:make<cr>
" nnoremap <C-m><C-m> :w<cr>:make upload<cr>

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
set smarttab
set smartindent
set rnu "relative line numbers
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set noshowmode " Dont display  -- INSERT --, ..
"No autocomment when hitting enter
set formatoptions-=cro
"set termguicolors
set mouse=a
let g:python3_host_prog = '/usr/bin/python3'

"Abbreviations
iabbrev cl console.log(
iabbrev <expr> ddd strftime('%c')
iabbrev bpry binding.pry

" var -> #{var}
let @s = 'hea}^[Bi#+<80>kb{^[A ^['
" Align paragraph
noremap <leader>a =ip

"Automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'
Plug 'habamax/vim-gruvbit'
Plug 'turbio/bracey.vim'
Plug 'neoclide/vim-jsx-improve'
Plug 'preservim/nerdtree'
Plug 'wakatime/vim-wakatime'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'will133/vim-dirdiff'
Plug 'vimwiki/vimwiki'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Still install fzf for :Snippets cmd
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
au BufEnter 192.168.178.143*node*.txt set syntax=javascript
let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }
let fc = g:firenvim_config['localSettings']
" let fc['.*'] = { 'takeover': 'never' }
" Git
Plug 'tpope/vim-fugitive'
"Ruby Plugins
"Plug 'tpope/vim-endwise'
"Plug 'ngmy/vim-rubocop'
"Icons
"Plug 'ryanoasis/vim-devicons'
"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

" autocmd FileType markdown nnoremap <buffer> <C-C> !pandoc %  -o %:r.pdf
nnoremap <buffer><nowait><silent> <F9> :<c-u>silent call system('pandoc '.expand('%:p:S').' -o '.expand('%:p:r:S').'.pdf')<cr>

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
" source $HOME/.config/nvim/plug-config/vim-airline.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/vim-fugitive.vim
source $HOME/.config/nvim/plug-config/navigation.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/vimtex.vim
source $HOME/.config/nvim/plug-config/ultisnips.vim

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
" Ruby
iabbr bpry binding.pry
map <Leader>bp obinding.pry<esc>:w<cr>
nmap <Leader>pp :<c-u>let pc = (v:count1 ? v:count1 : 1)<cr>:read !tail -<c-r>=pc<cr> ~/.irb_history<cr>:.-<c-r>=pc-1<cr>:norm <c-r>=pc<cr>==<cr>

"-----INSERT MODE MAPPINGS -----------
"correct last misspelled word
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
inoremap <C-s> <Esc>:w<cr>a
