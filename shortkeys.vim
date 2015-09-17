nnoremap <Leader>i mzgg=G`z<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nmap <Leader><Leader> V

" expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Tabularize
nnoremap <leader>t,    :Tabularize /,\zs<CR>
vnoremap <leader>t,    :Tabularize /,\zs<CR>
nnoremap <leader>t::   :Tabularize /\s:<CR>
vnoremap <leader>t::   :Tabularize /\s:<CR>
nnoremap <leader>t=    :Tabularize /=>\@!<CR>
vnoremap <leader>t=    :Tabularize /=>\@!<CR>
nnoremap <leader>t=>   :Tabularize /=><CR>
vnoremap <leader>t=>   :Tabularize /=><CR>
nnoremap <leader>t->   :Tabularize /-><CR>
vnoremap <leader>t->   :Tabularize /-><CR>
nnoremap <leader>t{    :Tabularize /{<CR>
vnoremap <leader>t{    :Tabularize /{<CR>
nnoremap <leader>t}    :Tabularize /}<CR>
vnoremap <leader>t}    :Tabularize /}<CR>
nnoremap <leader>t:    :Tabularize /:\zs<CR>
vnoremap <leader>t:    :Tabularize /:\zs<CR>
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        B
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
