#!/bin/sh

current_dir=`pwd -P`
ffmpeg_dir=$current_dir/../
ffmpeg_src_dir=$ffmpeg_dir/ffmpeg_src
echo "ffmpeg_dir : $ffmpeg_dir"
echo "ffmpeg_src_dir : $ffmpeg_src_dir"

echo "ffmpeg source distclean"
cd $ffmpeg_src_dir && [ -e config.h ] && make distclean

echo "ffmpeg ffbuild patch"
#patch $ffmpeg_src_dir/ffbuild/library.mak < $current_dir/ffbuild.patch

ffmpeg_extra_cflag="--extra-cflags=-I/usr/local/include"
ffmpeg_extra_cxxflag="--extra-cxxflags=-I/usr/local/include"
ffmpeg_extra_ldflag="--extra-ldflags=-L/usr/local/lib"
ffmpeg_license_flag="--disable-gpl --disable-version3"
ffmpeg_config_flag="--disable-x86asm --enable-shared --enable-static --enable-sdl2" #--enable-openssl"
ffmpeg_external_video_codec="--enable-libopenh264 --enable-libvpx"
ffmpeg_external_audio_codec="--enable-libopus --enable-libspeex"

ffmpeg_build_config="--prefix=$ffmpeg_dir/output/ffmpeg $ffmpeg_extra_cflag $ffmpeg_extra_cxxflag $ffmpeg_extra_ldflag $ffmpeg_license_flag $ffmpeg_config_flag $ffmpeg_external_video_codec $ffmpeg_external_audio_codec"
echo "ffmpeg configuration : $ffmpeg_build_config"

echo "configuring ffmpeg makefile"
$ffmpeg_src_dir/configure $ffmpeg_build_config 
