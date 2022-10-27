"------ GENERAL SETTINGS START set tabstop=4          " insert 4 spaces for tab set softtabstop=4      " how many cols cursor moves when pressing tab
set shiftwidth=4       " change number of space chars inserted for indentation
set expandtab          " use tabs instead of spaces
set smartindent        " make indenting smart lol
set smarttab           " tabbing will realize you have 2 vs 4

set guicursor=
set relativenumber     " toggle relative line numbers
set nu                 " toggle line numbers
set hidden             " hide instead of deleting unsaved buffer when a new file is opened
set noerrorbells       " we really don't need no error bells

set splitbelow         " horizontal splits will automatically be below
set splitright         " vertical splits will automatically be to the right

set noswapfile         " keeping history as per recs (i think from Primeagen)
set nobackup
set undodir=~/.vim/undodir
" set undofile

set scrolloff=8        " always keeps 8 lines in the bottom
set signcolumn=yes     " adds a column, useful for LSP info e.g. lints

syntax enable
syntax on              " turn on syntax
filetype plugin indent on

set formatoptions-=cro " stop newline continuation of comments


"-------- GENERAL SETTINGS END 

"-------- CUSTOM PLUGINS START

call plug#begin('~/.vim/plugged')
  Plug 'nvim-lua/plenary.nvim'                    " we need this for telescope
  Plug 'nvim-telescope/telescope.nvim'            " live grep and file lookup

  Plug 'gruvbox-community/gruvbox'                " gruvbox theme

  Plug 'neoclide/coc-eslint'                      " eslitnt for coc

  Plug 'sheerun/vim-polyglot'                     " better syntax support

  Plug 'rust-lang/rust.vim'                       " rust:)

  Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc // intellisense

  Plug 'dense-analysis/ale'                       " async lint engine for eslint

  Plug 'vim-airline/vim-airline'                  " status line
  Plug 'vim-airline/vim-airline-themes'

  Plug 'jiangmiao/auto-pairs'                     " auto pairs

  Plug 'tpope/vim-surround'                       " surround
                                        
  Plug 'junegunn/vim-easy-align'                  " easy align

  Plug 'luxed/ayu-vim'                            " maintained ayu fork colorscheme

  Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main'  }

  Plug 'junegunn/goyo.vim'                        " prose mode
call plug#end()

"-------- CUSTOM PLUGINS END

" color scheme setup
"set background=dark
"colorscheme gruvbox
set termguicolors
set background=dark
let g:ayucolor="dark"   " for dark version of theme
colorscheme ayu

" manual auto-pairs
" i switched to jiangmiao/auto-pairs for now 
" inoremap { {<CR>}<Esc>ko
" inoremap { {}<Esc>li
" inoremap {<CR> {<CR>}<C-o>O
" inoremap (<CR> (<CR>)<C-o>O
" inoremap [<CR> [<CR>]<C-o>O

"-------- COC DEFAULT CONFIG START 

nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
 inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" make hitting enter on a coc suggestion fill it in like in vscode
" this got broken after coc 0.0.82 where they changed the ui 
" from the native pop-up to a custom one 
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show docs for the object under cursor
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"
"-------- COC DEFAULT CONFIG END 

"-------- REMAPS START

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <CR> :noh<CR><CR> 

"noremap <C-O> <C-W>h<C-W>_
" noremap <C-P> <C-W>l<C-W>_

" Go to last active tab by CTRL+L
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

" alternatively, use this for tab switch with Shift H / L
" nnoremap H gT
" nnoremap L gt

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" for instance, vipga= centers the current paragraph around = 

" j and k will go down one line visually for lines that are longer than one
" screen length, very comfy and we don't need to use $ or 0 no more  
nmap <silent> j gj
nmap <silent> k gk

" use <Leader>yy to yank to system clipboard; full sys yank is: "*yy
noremap <Leader>y "*y

"-------- REMAPS END 

"-------- LANGUAGE SPECIFIC START

" python
let g:python_highlight_space_errors                 = 0

" markdown
autocmd FileType markdown let b:coc_suggest_disable = 1 " disable autosuggest in md files


" rust 
let g:rustfmt_autosave                              = 1

"-------- LANGUAGE SPECIFIC END
" set guicursor=i:ver25-iCursor " if you want to have a vertical line cursor
" in insert mode

" ------- CUSTOM FUNCTIONALITY

" add custom bindings for goyo prose mode
function! s:goyo_enter()
  set nolist noshowmode noshowcmd
endfunction

function! s:goyo_leave()
  set list showmode showcmd
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
nmap \pr :Goyo<CR>

