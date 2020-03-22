color gruvbox

" text stuff
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set autoindent
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set cmdheight=2
set cursorline
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
set completeopt=longest

" ale config
let g:ale_linters = { 'cs': ['OmniSharp'] }

" airline
let g:airline_powerline_fonts = 1

" asyncomplete tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" OmniSharp Stuff
filetype indent plugin on
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 3
let g:OmniSharp_prefer_global_sln = 1
let g:OmniSharp_want_snippet=1

augroup omnisharp_commands
    autocmd!
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
augroup END

nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
" end OmniSharp Stuff
