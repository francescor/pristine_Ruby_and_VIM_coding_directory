" https://github.com/VundleVim/Vundle.vim
" Launch vim and run :PluginInstall
"
set nocompatible      " We're running Vim, not Vi!
filetype off                  " required


" Set SPELLCHeCK YYAH
" set spell spelllang=en_us

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'dense-analysis/ale'
" https://www.vimfromscratch.com/articles/vim-for-ruby-and-rails-in-2019/
" Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-endwise'
Plugin 'ntpeters/vim-better-whitespace'

" https://github.com/mhartington/oceanic-next
Plugin 'mhartington/oceanic-next'

"https://github.com/shinglyu/vim-codespell
" to execute run :Codespell
Plugin 'shinglyu/vim-codespell'


" All of your Plugins must be added before the following line
call vundle#end()            " required

" https://github.com/mhartington/oceanic-next
if (has("termguicolors"))
  set termguicolors
endif

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
:let ruby_operators        = 1
:let ruby_pseudo_operators = 1
:let ruby_space_errors = 1
:let ruby_line_continuation_error = 1
:let ruby_global_variable_error   = 1
:let ruby_spellcheck_strings = 1

" https://www.vimfromscratch.com/articles/vim-for-ruby-and-rails-in-2019/
let g:ale_linters = {'ruby': ['rubocop']}
let g:ale_fixers = {'ruby': ['rubocop']}
" the folloing disabled: save automatically code modification:
" I've moved it in the .vimrc file in directory where I do want it to work
"let g:ale_fixers = {
"      \    'ruby': ['standardrb'],
"      \}
"let g:ale_fix_on_save = 1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" https://github.com/testdouble/standard/wiki/IDE:-vim
let g:ruby_indent_assignment_style = 'variable'

" https://github.com/testdouble/standard/wiki/IDE:-vim
"
:let ruby_operators        = 1
:let ruby_pseudo_operators = 1
:let ruby_space_errors = 1
:let ruby_line_continuation_error = 1
:let ruby_global_variable_error   = 1
:let ruby_spellcheck_strings = 1

" https://www.vimfromscratch.com/articles/vim-for-ruby-and-rails-in-2019/
" the following will automatically save code modification 
let g:ale_fix_on_save = 1

" Options with: :ALEInfo
"let g:ale_ruby_rubocop_options = ' --only Style/StringLiterals'


" number of spaces to use for (auto)indent step
" see https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
" press 'v', then select, then '>'
set shiftwidth=2

" https://github.com/ntpeters/vim-better-whitespace
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

