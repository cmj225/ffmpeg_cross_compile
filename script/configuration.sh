#!/bin/sh

current_dir=`pwd -P`
ffmpeg_dir=$current_dir/../
ffmpeg_src_dir=$ffmpeg_dir/ffmpeg_src
echo "ffmpeg_dir : $ffmpeg_dir"
echo "ffmpeg_src_dir : $ffmpeg_src_dir"

echo "ffmpeg source distclean"
cd $ffmpeg_src_dir && [ -e config.h ] && make distclean

# default flag setting
ffmpeg_license_flag="--disable-gpl --disable-version3"
ffmpeg_config_flag="--disable-x86asm --enable-shared --enable-static" 
ffmpeg_debug_flag="--enable-debug=3 --disable-optimizations --disable-stripping"
ffmpeg_default_flags="$ffmpeg_license_flag $ffmpeg_config_flag $ffmpeg_debug_flag"

# for window linking
ffmpeg_extra_cflag="--extra-cflags=-I/usr/local/include"
ffmpeg_extra_cxxflag="--extra-cxxflags=-I/usr/local/include"
ffmpeg_extra_ldflag="--extra-ldflags=-L/usr/local/lib"
ffmpeg_window_flag="$ffmpeg_extra_cflag $ffmpeg_extra_cxx_flag $ffmpeg_extra_ldflag"

# external lib handling
ffmpeg_external_lib="" #--enable-sdl2" #--enable-openssl"
ffmpeg_external_video_codec="" #--enable-libopenh264" #--enable-libvpx"
ffmpeg_external_audio_codec="" #--enable-libspeex" #--enable-libopus"
ffmpeg_external="$ffmpeg_external_lib $ffmpeg_external_video_codec $ffmpeg_external_audio_codec"

ffmpeg_build_window_config="--prefix=/usr/local/ $ffmpeg_window_flag $ffmpeg_default_flag $ffmpeg_external"

ffmpeg_build_tos_config="--prefix=$ffmpeg_dir/output/ffmpeg_linux $ffmpeg_default_flags $ffmpeg_external"

ffmpeg_build_default_config="--prefix=/usr --libdir=lib/i386-linux-gnu $ffmpeg_default_flags $ffmpeg_external"

# go to cofigure
ffmpeg_build_config="$ffmpeg_build_window_config"
echo "ffmpeg configuration : $ffmpeg_build_config"

echo "configuring ffmpeg makefile"
$ffmpeg_src_dir/configure $ffmpeg_build_config 
