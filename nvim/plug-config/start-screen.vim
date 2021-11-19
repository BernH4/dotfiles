" https://github.com/mhinz/vim-startify
" https://www.chrisatmachine.com/Neovim/11-startify/  Press: gx under cursor

let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'b': '~/.bashrc' },
            \ { 'a': '~/.bash_aliases' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'p': '~/.pryrc' },
            \ { 'r': '~/projects/the_odin_project/ruby/ruby_exercises/binary_search_tree' },
            \ ]
"            \ '~/Pics',

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
" I dont map autosave because exiting one by another will only save the latest
"let g:startify_session_persistence = 1
let g:startify_enable_special = 0
