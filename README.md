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
| /snippets  | SnipMate 플러그용 snippets (자동 설치 미지원)                   |
| /plugins   | 커스텀 플러그인 <br/> vimrc에서 'source' 명령으로 이 디렉토리의 파일들을 incldue한다.  |
| README.md  | 지금 읽고 있는 파일                                             |
| install.sh | 설치파일 <br/>  ~/.vimrc 파일과 ~/.vim/ 를 생성한다.            |
| vimrc      | ~/.vimrc -> ~/vimconfig/vimrc                                   |



# 유용한 vim 명령어
	[ + I				같은 파일에서 심볼 위치 검색
	:set fileencoding=utf-8		파일 인코딩 변경
	v]}zf				코드의 { 부분에서 영역 접기
	zo				영역 펼치기
