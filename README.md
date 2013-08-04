#vimconfig

vim 플러그인을 쉽게 설치하기 위한 프로젝트.

사용된 자원

- Bundle
- Bash script


#설치하기

    git clone https://github.com/ygpark/vimconfig.git ~/vimconfig
    ~/vimconfig/install.sh


#디렉토리 구조


|    이름    |            내용                                                 |
| ---------- | --------------------------------------------------------------- |
| /snippets  | SnipMate 플러그용 snippet. (자동 설치 미지원)                   |
| /plugins   | 커스텀 플러그인 <br/> vimrc에서 'source' 명령으로 incldue한다.  |
| README.md  | 이 파일                                                         |
| install.sh | VIM 플러그인 설치파일                                           |
| vimrc      | ~/.vimrc -> ~/vimconfig/vimrc                                   |




