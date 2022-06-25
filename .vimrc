set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set guicursor=
set relativenumber
set nu
set hidden
set noerrorbells

syntax on

" keeping history as per recs
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set scrolloff=8 "keeps 8 lines in the bottom always

set signcolumn=yes "adds a column, useful for LSP info e.g. lints

" begin custom plugins
call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" Plug 'nvim-treesitter/nvim-treesitter' 

call plug#end()

syntax enable
filetype plugin indent on

" run rustfmt on buffer save
let g:rustfmt_autosave = 1

" begin color scheme setup
set background=dark
colorscheme gruvbox

" inoremap { {<CR>}<Esc>ko
"inoremap { {}<Esc>li
inoremap {<CR> {<CR>}<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap [<CR> [<CR>]<C-o>O

nmap <leader>rn <Plug>(coc-rename)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

nnoremap <CR> :noh<CR><CR>

" noremap <C-O> <C-W>h<C-W>_
" noremap <C-P> <C-W>l<C-W>_


