#!/bin/sh

current_dir=`pwd -P`
ffmpeg_dir=$current_dir/../
ffmpeg_src_dir=$ffmpeg_dir/ffmpeg_src
echo "ffmpeg_dir : $ffmpeg_dir"
echo "ffmpeg_src_dir : $ffmpeg_src_dir"

echo "ffmpeg source distclean"
cd $ffmpeg_src_dir && [ -e config.h ] && make distclean

echo "ffmpeg ffbuild patch"
patch $ffmpeg_src_dir/ffbuild/library.mak < $current_dir/ffbuild.patch

ffmpeg_extra_cflag="--extra-cflags="
ffmpeg_extra_cxxflag="--extra-cxxflags="
ffmpeg_extra_ldflag="--extra-ldflags="

ffmpeg_build_config="--prefix=$ffmpeg_dir/output/ffmpeg $ffmpeg_extra_cflag $ffmpeg_extra_cxxflag $ffmpeg_extra_ldflag --disable-gpl --disable-version3 --enable-w32threads --disable-x86asm --enable-shared --enable-static --pkg-config-flags=-static"
echo "ffmpeg configuration : $ffmpeg_build_config"

echo "configuring ffmpeg makefile"
$ffmpeg_src_dir/configure $ffmpeg_build_config 
