"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General:
"     -> Ale
"     -> FZF
"     -> NERDCommenter
"     -> NERDTree
"     -> UltiSnips
"
" Filetype:
"     -> Vimtex
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" -------------------- General ----------------------------{{{1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \}
let g:ale_fix_on_save = 1

map <silent> <leader>a <Plug>(ale_next_wrap)
nmap <leader>ad :ALEGoToDefinition<cr>
nmap <leader>at :ALEGoToDefinition -tab<cr>

" Enabling highlighting
let g:ale_set_highlights = 1

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1

" Avoid cursor disappearing
let g:ale_echo_cursor = 1

" Autocomplete
let g:ale_completion_enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERD Commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERD Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 35
let g:NERDTreeQuitOnOpen = 3
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/bin/fzf
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-i': 'split',
            \ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'down': '40%' }
map <leader>f :FZF<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width = "85%"
let g:goyo_height = "85%"



" -------------------- Filetype ---------------------------{{{1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = { 'build_dir' : 'latex_build' }
let g:vimtex_quickfix_open_on_warning = 0
