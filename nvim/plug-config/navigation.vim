nnoremap <silent><C-j> :cnext<CR>zz
nnoremap <silent><C-k> :cprev<CR>zz
nnoremap <silent><C-f> :call ToggleQFList()<CR>

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList()
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            " vert copen
            copen
            wincmd =
        end
endfun

" nnoremap <silent><C-b> :vimgrep binding *rb<CR>
