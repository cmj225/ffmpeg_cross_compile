# FFmpeg build on Windows envirionment
1. git for windows 설치 (path: C://Git)
2. cmake, make, mingw, diff, pkg-config 설치
4. cmake.exe 등을 git의 bin으로 이동
5. git bash 관리자 권한으로 실행
6. go to ./script
7. run get_ffmpeg_src.sh
8. run configuration.sh
9. make && make install

# FFmpeg build on Linux environment
1. cmake, make, ... package 설치
2. go to ./script
3. run get_ffmpeg_src.sh
4. run configuration.sh
5. make && make install

# install git bash
1. install location /c/Git

# install cmake, make, mingw64
1. cmake : https://cmake.org/download/
2. make : http://gnuwin32.sourceforge.net/packages/make.htm
3. mingw64 : http://mingw-w64.org/doku.php/download

# install pkg-config, glib, gettext-runtime
1. home : https://ftp.gnome.org/pub/gnome/binaries/win32/
2. pkg-config : https://ftp.gnome.org/pub/gnome/binaries/win32/dependencies/pkg-config_0.26-1_win32.zip
3. glib : https : https://ftp.gnome.org/pub/gnome/binaries/win32/glib/2.28/glib_2.28.8-1_win32.zip
4. gettext-runtime : https://ftp.gnome.org/pub/gnome/binaries/win32/dependencies/gettext-runtime_0.18.1.1-2_win32.zip
