""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> C
"    -> Rust
"    -> Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => C
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup Filetype_c
    autocmd!
    autocmd FileType c let g:ale_c_cc_executable = 'gcc'
    autocmd FileType c let g:ale_linters['C'] = ['gcc']
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rust
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup Filetype_rust
    autocmd!
    autocmd FileType rust let g:ale_linters['rust'] = ['analyzer']
    autocmd FileType rust let g:ale_fixers['rust'] = ['rustfmt']
    autocmd FileType rust let g:ale_rust_analyzer_config = {
            \  "cargo": {
            \    "loadOutDirsFromCheck": 'true',
            \  },
            \  "procMacro": {
            \    "enable": 'true',
            \  }
            \}
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup Filetype_python
    autocmd!
    autocmd FileType python let g:NERDTreeIgnore += ['\.pyc$', '__pycache__']
augroup END
