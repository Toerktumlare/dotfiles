set makeprg=cargo

" -----------------------------------------------------------------------------
"     - Key mappings -
" -----------------------------------------------------------------------------
nmap <C-b> :!clear; cargo check<CR>
nmap <Leader>x :!clear; cargo run<CR>
nmap <Leader>f :RustFmt<CR>
nmap <Leader>b :!clear; cargo test -- --nocapture<CR>
nmap <Leader>B :!clear;env RUST_BACKTRACE=1 cargo test -- --nocapture<CR>
