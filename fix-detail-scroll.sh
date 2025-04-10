#!/bin/bash

# Detail 하위 페이지들의 스크롤 문제 수정 스크립트
echo "Detail 하위 페이지 스크롤 수정 시작..."

# 모든 detail 페이지 경로
DETAIL_PAGES="detail-1-1.html detail-1-2.html detail-2-1.html detail-2-2.html detail-3-1.html detail-3-2.html detail-4-1.html detail-4-2.html detail-5-1.html detail-5-2.html detail-6-1.html detail-6-2.html"

for file in $DETAIL_PAGES; do
  echo "처리 중: $file"
  
  # 1. body의 overflow 수정
  sed -i '' 's/overflow: hidden;/overflow-x: hidden;/g' "$file"
  sed -i '' 's/overflow-x: hidden;/overflow-x: hidden; overflow-y: auto;/g' "$file"
  
  # 2. slide-container의 overflow 수정
  sed -i '' 's/overflow: hidden;/overflow-x: hidden; overflow-y: auto;/g' "$file"
  
  # 3. 다른 컨테이너 수정
  sed -i '' 's/dot-pattern flex flex-col w-full/dot-pattern flex flex-col w-full overflow-y: auto;/g' "$file"
  
  # 4. 높이 제한 제거
  # sed -i '' 's/min-height: 100vh;//g' "$file"
  
  # 오류 방지
  sed -i '' 's/overflow-y: auto; overflow-y: auto;/overflow-y: auto;/g' "$file"
  
done

echo "Detail 하위 페이지 스크롤 수정 완료!"