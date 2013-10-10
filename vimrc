"주의: Source Explorer의 충돌을 피하기 위해서 SrcExpl_pluginList를 새로 작성

"====================================================
"= Bundle
"====================================================
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'snipMate'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'bufexplorer.zip'
Bundle 'DirDiff.vim'
Bundle 'git://github.com/wesleyche/SrcExpl.git'
Bundle 'SuperTab'
Bundle 'SuperTab-continued.'
Bundle 'cscope_macros.vim'
Bundle 'gtags.vim'
Bundle 'OmniCppComplete'
Bundle 'armasm'
Bundle 'https://github.com/dhruvasagar/vim-table-mode.git'
"주석달기: \cc, \cn, \cs
"다른모양 주석 설정: \ca
"주석해제: \<space>
Bundle 'The-NERD-Commenter'
Bundle 'AutoComplPop'

filetype plugin indent on     " required!

"====================================================
"= 어셈블리 파일을 C처럼 인식하여 주석을 달기 위한 트릭
"====================================================
au BufRead,BufNewFile *.S		set ft=c

"====================================================
"= 기본 설정
"====================================================
set cindent			"들여쓰기 설정
set ruler			" 화면 우측 하단에 현재 커서의 위치(줄,칸)를 보여준다.
set number			" 줄번호 출력
set modifiable
set hlsearch			" Highlight Search
set ts=4			" tab stop - tab 크기
set sw=4			" shift width - shift 크기 조절
set sts=4			" soft tab stop - tab 이동 크기
set expandtab
set incsearch
set printoptions=portrait:n,wrap:n,duplex:off
set fileencodings=utf-8,euc-kr
set gfn=나눔고딕코딩\ 12	" gvim용 폰트 설정
colorscheme desert

"==========================
"= autocmd
"==========================
autocmd BufEnter *.c        setlocal ts=8 sw=8 sts=8 noexpandtab
autocmd BufEnter *.S        setlocal ts=8 sw=8 sts=8 noexpandtab
autocmd BufEnter *.py       setlocal ts=8 sw=8 sts=8 noexpandtab
autocmd BufEnter Makefile   setlocal ts=8 sw=8 sts=8 noexpandtab
autocmd BufEnter .*         setlocal ts=8 sw=8 sts=8 noexpandtab nocindent
autocmd BufEnter *.md       setlocal ts=8 sw=8 sts=8 noexpandtab nocindent
autocmd BufEnter *.sh       setlocal ts=8 sw=8 sts=8 noexpandtab nocindent
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"====================================================
"= gtags.vim 설정
"====================================================
nmap <C-F2> :copen<CR>
nmap <C-F4> :cclose<CR>
nmap <C-F5> :Gtags<SPACE>
nmap <C-F6> :Gtags -f %<CR>
nmap <C-F7> :GtagsCursor<CR>
nmap <C-F8> :Gozilla<CR>
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>
nmap <C-\><C-]> :GtagsCursor<CR>

"====================================================
"= 키맵핑
"====================================================
" <F3> 이전 정의로 이동 (SrcExpl 플러그인이 설정)
" <F4> 다음 정의로 이동 (SrcExpl 플러그인이 설정)
map <F6> :BufExplorer<cr>
map <F7> :NERDTreeToggle<CR>
map <F8> :SrcExplToggle<CR>
map <F9> :TlistToggle<CR>

"=====  PageUP PageDown
map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

"===== Vim 내의 창 크기 조절
nmap <s-h> <C-W><
nmap <s-j> <C-W>-
nmap <s-k> <C-W>+
nmap <s-l> <C-W>>

"===== Vim 내에서 창 간 이동
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j 
nmap <c-k> <c-w>k 
nmap <c-l> <c-w>l 

"===== 버퍼간 이동
map ,x :bn!<CR>	  " Switch to Next File Buffer
map ,z :bp!<CR>	  " Switch to Previous File Buffer
map ,w :bw<CR>	  " Close Current File Buffer

map ,1 :b!1<CR>	  " Switch to File Buffer #1
map ,2 :b!2<CR>	  " Switch to File Buffer #2
map ,3 :b!3<CR>	  " Switch to File Buffer #3
map ,4 :b!4<CR>	  " Switch to File Buffer #4
map ,5 :b!5<CR>	  " Switch to File Buffer #5
map ,6 :b!6<CR>	  " Switch to File Buffer #6
map ,7 :b!7<CR>	  " Switch to File Buffer #7
map ,8 :b!8<CR>	  " Switch to File Buffer #8
map ,9 :b!9<CR>	  " Switch to File Buffer #9
map ,0 :b!0<CR>	  " Switch to File Buffer #0

"===== gtags.vim
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>
nmap <C-\><C-]> :GtagsCursor<CR>



"===== make
let startdir = getcwd()
func! Make()
	exe "!cd ".startdir
	exe "make"
endfunc
nmap ,mk :call Make()<cr><cr>

"===== hexViewer
let b:hexViewer = 0
func! Hv()
        if (b:hexViewer == 0)
                let b:hexViewer = 1
                exe "%!xxd"
        else
                let b:hexViewer = 0
                exe "%!xxd -r"
        endif
endfunc
nmap ,h :call Hv()<cr>

"===== man
func! Man()
	let sm = expand("<cword>")
	exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,ma :call Man()<cr><cr>

"====================================================
"= Source Explorer config
"====================================================

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8
" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100
" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to avoid conflicts, the Source Explorer should know what plugins
" // except itself are using buffers. And you need add their buffer names into
" // below listaccording to the command ":buffers!"
let g:SrcExpl_pluginList = [
				\ "__Tag_List__",
				\ "NERD_tree_1",
				\ "Source_Explorer",
				\ "[BufExplorer]"
				\ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1
" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update the tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"

" // Set "<F3>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F3>"
" // Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F4>"




"====================================================
"= Tag List
"====================================================
filetype on"vim filetpye on
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
let Tlist_Exit_OnlyWindow=0
"window close=off
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window=1

"====================================================
"= Project config
"====================================================
if filereadable(".project.vimrc")
	source .project.vimrc
endif

"====================================================
"= NERD Tree
"====================================================
let NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0



"====================================================
"= tags 설정 (cscope, ctags)
"====================================================

"Cscope의 상대경로 문제를 해결하기 위해서 매번 cscope.out파일을 새로 읽는다.
function! LoadCscope()
  exe "silent cs reset"
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()
 
"현재 디렉토리부터 root 디렉토리까지 tags를 찾는다.
set tags=tags;/


"====================================================
"= Check Symbol
"====================================================
source ~/vimconfig/plugins/checksymbol.vim
