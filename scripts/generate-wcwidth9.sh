#!/usr/bin/env bash

set -e

scripts_dir=${0%/*}
download_unicode_files=${scripts_dir}/download-unicode-files.sh
eaw_patch=${scripts_dir}/EastAsianWidth.patch
gen_unicode_tables=./src/nvim/generators/gen_unicode_tables.lua

(
  $download_unicode_files
  patch -p1 < $eaw_patch
  mkdir -p dist
  lua $gen_unicode_tables ./unicode dist/wcwidth9.h
)
