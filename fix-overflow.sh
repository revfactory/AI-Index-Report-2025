#!/bin/bash

# Detail 페이지 overflow 문제 수정 스크립트
echo "Detail 페이지 overflow 수정 시작..."

# 모든 detail 페이지 경로
DETAIL_PAGES="detail-1-2.html detail-2-1.html detail-2-2.html detail-3-1.html detail-3-2.html detail-4-1.html detail-4-2.html detail-5-1.html detail-5-2.html detail-6-1.html detail-6-2.html"

for file in $DETAIL_PAGES; do
  echo "처리 중: $file"
  
  # 정확한 패턴으로 수정
  sed -i '' 's/overflow-x: hidden; overflow-y: auto;/overflow-x: hidden;/g' "$file"
  sed -i '' 's/overflow-x: hidden; overflow-y: auto/overflow-x: hidden;/g' "$file"
  sed -i '' 's/overflow: hidden; overflow-y: auto;/overflow-x: hidden;/g' "$file"
  sed -i '' 's/overflow-y: auto;/overflow-y: visible;/g' "$file"
  
  # dot-pattern 컨테이너 수정
  sed -i '' 's/dot-pattern flex flex-col w-full overflow-y: auto;/dot-pattern flex flex-col w-full/g' "$file"
  sed -i '' 's/dot-pattern flex flex-col w-full overflow-y: auto/dot-pattern flex flex-col w-full/g' "$file"
done

echo "Detail 페이지 overflow 수정 완료!"