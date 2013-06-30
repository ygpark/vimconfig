"주의: Source Explorer의 충돌을 피하기 위해서 SrcExpl_pluginList를 새로 작성


"==========================
"= tags 등록
"==========================
set tags=./tags
"set tags+=/home/ygpark/bin/ndk/platforms/android-14/arch-arm/usr/include/tags
set tags+=~/repo/iamroot-linux-arm10c/tags
"set tags+=~/.vimtags/cpp

"==========================
"= Bundle
"==========================
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
"Bundle 'AutoComplPop'
Bundle 'SuperTab'
Bundle 'SuperTab-continued.'
Bundle 'cscope_macros.vim'
Bundle 'vmark.vim--Visual-Bookmarking'

filetype plugin indent on     " required!



"==========================
"= 기본 설정
"==========================
set cindent			"들여쓰기 설정
set ruler			" 화면 우측 하단에 현재 커서의 위치(줄,칸)를 보여준다.
set number			" 줄번호 출력
set modifiable
set hlsearch			" Highlight Search
set ts=8			" tab stop - tab 크기
set sw=8			" shift width - shift 크기 조절
set sts=8			" soft tab stop - tab 이동 크기
set incsearch
set ignorecase
set printoptions=portrait:n,wrap:n,duplex:off
set fileencodings=utf-8,euc-kr
set gfn=나눔고딕코딩\ 10	" gvim용 폰트 설정
colorscheme desert




"==========================
"= 키맵핑
"==========================

"=====  펑션키: F1 ~ F12
"map <F2> v]}zf				"코드의 { 부분에서 영역 접기
"map <F3> zo				"영역 펼치기
map <F4> :set fileencoding=utf-8<cr>	"파일 인코딩 변경
map <F5> :!./build.sh<cr>
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

"==========================
"= Source Explorer config
"==========================
let g:SrcExpl_winHeight = 8 
let g:SrcExpl_refreshTime = 100 
let g:SrcExpl_jumpKey = "<ENTER>" 
let g:SrcExpl_gobackKey = "<SPACE>" 
" 충돌을 피하기 위해서 Source Explorer는 buffer는 사용하는 플러그인을 알아야 합니다.
" 이 목록은 taglist, NERD Tree, Source Exploerer를 모두 띄어놓은 상태에서
" ":buffers!"명령을 내려서 나오는 이름들을 적어주세요.
let g:SrcExpl_pluginList = [ 
				\ "__Tag_List__", 
				\ "NERD_tree_1", 
				\ "Source_Explorer" 
				\ ] 

let g:SrcExpl_searchLocalDef = 1 
let g:SrcExpl_isUpdateTags = 0 "Do not let the Source Explorer update the tags file when opening 
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" //  create/update a tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
let g:SrcExpl_updateTagsKey = "<F12>" 

"==========================
"= Tag List
"==========================
filetype on"vim filetpye on
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
let Tlist_Exit_OnlyWindow=0
"window close=off
let Tlist_Auto_Open=0
let Tlist_Use_Right_Window=1

"==========================
"= Project config
"==========================
if filereadable(".project.vimrc")
	source .project.vimrc
endif

"==========================
"= NERD Tree
"==========================
let NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
