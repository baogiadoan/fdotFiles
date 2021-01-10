"  Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-eunuch'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'liuchengxu/space-vim-dark'
call plug#end()

" No explanation needed
set nocompatible
syntax on
set encoding=utf-8
colorscheme gruvbox
" colorscheme dracula
" colorscheme space-vim-dark
" colorscheme default
"
"
highlight Normal ctermbg=16 guibg=#000000 
set nofoldenable

let mapleader = " "
let maplocalleader = ","
" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_contrast_light = 'hard'
set background=dark
set cursorline

" Time out for key mapping and sequence respectively
set timeoutlen=500
set ttimeoutlen=0

" Trigger filetype based plugins and indentations
filetype plugin indent on

" Relative numbering
set number relativenumber

" Use the appropriate number of spaces instead of tab, and set tab size to 2
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Never scroll all the way to the bottom of the page
set scrolloff=5

" Set all registers to clipboard. Maybe change at a later date to better take
" advantage of registers
set clipboard=unnamedplus

" Better searching
set inccommand=nosplit
set incsearch
set hlsearch

" Wildmenu better complete
set wildmenu
set wildmode=longest:list,full

" Splits open at the bottom and right:
set splitbelow splitright


"" Commands

" Write to read only file
cmap w!! w !sudo tee % > /dev/null


"" Mappings

" C-v to paste in insert mode
inoremap <c-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
imap <C-k> <esc>ldwa

" Move inside line
nmap <C-J> gj
nmap <C-K> gk


" fzf shortcut
"
function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  "Set the position, size, etc. of the floating window.
  "The size configuration here may not be so flexible, and there's room for further improvement.
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

" <C-w>l
"Let the input go up and the search list go down
let $FZF_DEFAULT_OPTS = '--layout=reverse'
let $FZF_DEFAULT_COMMAND = 'rg --files'
map ' :Files<CR>

"Open FZF and choose floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }


nmap <C-t> :TagbarToggle<CR>

" Disable Ex mode and vim history mode
map q: <Nop>
nnoremap Q <Nop>

" Turn off search highlight
nnoremap <silent> <C-_> :nohlsearch<CR>


"  Plugins
 


" UltiSnips

" let g:UltiSnipsSnippetsDir = "~/.config/nvim/my_snippets"
" let g:UltiSnipsSnippetDirectories=['my_snippets']
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsListSnippets="<c-tab>"

" coc-snippets
"
"" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-l> <Plug>(coc-snippets-expand-jump)


" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_quickfix_latexlog = {'default' : 0}
set conceallevel=1
let g:vimtex_imaps_disabled = ['K']
let g:tex_conceal=''
" let g:tex_conceal='abdmg'
let g:vimtex_mappings_disable = {
  \ 'n': ['K'],
\}

" let g:vimtex_compiler_latexmk = {
"     \ 'options' : [
"     \   '-pdf',
"     \   '-pdflatex="xelatex --shell-escape %O %S"',
"     \   '-verbose',
"     \   '-file-line-error',
"     \   '-synctex=1',
"     \   '-interaction=nonstopmode',
"     \ ]
"     \}

let g:vimtex_compiler_latexmk = {
  \ 'options' : [
  \   '-shell-escape',
  \   '-verbose',
  \   '-file-line-error',
  \   '-synctex=1',
  \   '-interaction=nonstopmode',
  \ ],
  \ 'continuous' : 0,
\ }



" Vimwiki

let g:vimwiki_list = [{'path': '~/.vimwiki/',
  \ 'syntax': 'markdown',
  \ 'ext': '.wiki',
  \ 'template_path': '~/.vimwiki/templates/',
  \ 'template_default': 'default',
  \ 'path_html': '~/.vimwiki/site_html',
  \ 'custom_wiki2html': 'vimwiki_markdown',
  \ 'template_ext': '.tpl'}]

au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map <leader>d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map <leader>c :call ToggleCalendar()


" Restore cursor position
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
    \ execute("normal `\"") |
  \ endif


" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1


" Bar at top
nmap <C-l> :bnext<CR>
nmap <C-h> :bprevious<CR>
nmap <leader>q :bp<bar>bd #<CR>
nmap <leader>ba :ls<CR>

" Airline
let g:airline_theme = 'gruvbox'
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" COC Stuff

command! -nargs=0 Prettier :CocCommand prettier.formatFile


let g:coc_global_extensions = [
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json', 
  \ 'coc-python', 
  \ 'coc-tsserver', 
  \ ]

"" Todo: 

" \ 'coc-python',
" \ 'coc-pyls',
" Configre vimfugitive
" set diffopt+=vertical
 
" avoid whitespace comparison
" set diffopt+=iwhite

map <C-n> :NERDTreeToggle <CR>
 
" " sync open file with NERDTree
" " " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" 
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
    call feedkeys("\<C-w>l")  
  endif
endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
autocmd BufReadPost * call SyncTree()


" source ~/.config/nvim/big-stuff.vim

