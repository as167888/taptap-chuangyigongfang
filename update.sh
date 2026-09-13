#!/bin/bash
# 由本机的 publish_report.py 通过 ssh 调用：把收到的报告提交并推送
set -e
cd "$(dirname "$0")"
if [ -z "$(git status --porcelain)" ]; then
    echo "内容无变化，跳过提交"
    exit 0
fi
git add -A
git commit -q -m "update report $(date +%Y-%m-%d\ %H:%M)"
git push -q origin master
echo "已推送：$(git log --oneline -1)"
