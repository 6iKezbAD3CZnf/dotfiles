"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General:
"     -> Ale
"     -> FZF
"     -> NERDCommenter
"     -> NERDTree
"     -> UltiSnips
"
" Layout:
"     -> Lightline
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
map <leader>d :ALEGoToDefinition<cr>

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



" -------------------- Layouts ----------------------------{{{1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }



" -------------------- Filetype ---------------------------{{{1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = { 'build_dir' : 'latex_build' }
