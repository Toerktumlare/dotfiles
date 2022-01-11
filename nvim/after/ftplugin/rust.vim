set makeprg=cargo

" rust settings
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------
nmap <Leader>x :!clear; cargo run<CR>
nmap <Leader>f :RustFmt<CR>
nmap <Leader>b :!clear; cargo test -- --nocapture<CR>
nmap <Leader>B :!clear;env RUST_BACKTRACE=1 cargo test -- --nocapture<CR>

let g:rooter_patterns = ['*.toml']

nnoremap <Leader>k :CocCommand rust-analyzer.openDocs<CR>

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
