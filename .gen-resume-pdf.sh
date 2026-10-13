#!/usr/bin/env bash
# 用 Chrome 无头模式把简历 HTML 生成为 PDF（Windows / Git Bash）
# 用法: bash .gen-resume-pdf.sh resume-hardware.html out.pdf
# 注意: --print-to-pdf 必须用绝对路径 + 正斜杠，且每次用独立 profile，
#       否则 Chrome 会复用单例进程或写到错误位置。
set -u
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"
BASE="C:/Users/zhengshumian/Desktop/Personal_website"
src="$1"
out="$2"
prof="C:/Users/zhengshumian/AppData/Local/Temp/chrome-resume-$$"
rm -rf "$prof"; mkdir -p "$prof"
"$CHROME" --headless=new --disable-gpu --no-sandbox --no-pdf-header-footer \
  --user-data-dir="$prof" --virtual-time-budget=20000 \
  --print-to-pdf="$BASE/$out" "file:///$BASE/$src"
rc=$?
rm -rf "$prof"
exit $rc
