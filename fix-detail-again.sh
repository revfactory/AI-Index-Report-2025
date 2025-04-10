#!/bin/bash

# Detail 하위 페이지들의 반응형 웹 문제 수정 스크립트 (개선 버전)
echo "Detail 하위 페이지 반응형 수정 시작..."

# 모든 detail 페이지 경로
DETAIL_PAGES="detail-1-1.html detail-1-2.html detail-2-1.html detail-2-2.html detail-3-1.html detail-3-2.html detail-4-1.html detail-4-2.html detail-5-1.html detail-5-2.html detail-6-1.html detail-6-2.html"

for file in $DETAIL_PAGES; do
  echo "처리 중: $file"
  
  # 1. slide-container 수정
  sed -i '' 's/min-height: 720px;//g' "$file"
  sed -i '' 's/overflow-x: hidden;/overflow: hidden;/g' "$file"
  sed -i '' '/min-height: 100vh;/d' "$file"
  
  # 2. 메인 콘텐츠 영역을 반응형으로 수정
  sed -i '' 's/flex-1 bg-gray-50 dot-pattern flex flex-col/flex-1 bg-gray-50 dot-pattern flex flex-col w-full/g' "$file"
  
  # 3. 그리드 컬럼 수정
  sed -i '' 's/grid-cols-2 gap-6/grid-cols-1 md:grid-cols-2 gap-4 md:gap-6/g' "$file"
  sed -i '' 's/grid-cols-3 gap-3/grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-2 md:gap-3/g' "$file"
  
  # 4. padding 조정
  sed -i '' 's/bg-gradient-header text-white p-6/bg-gradient-header text-white p-4 md:p-6/g' "$file"
  sed -i '' 's/card p-5/card p-3 md:p-5/g' "$file"
  sed -i '' 's/p-4 flex justify-between/p-4 flex flex-wrap justify-between/g' "$file"
  
  # 5. flex 레이아웃 조정
  sed -i '' 's/flex items-center justify-around/flex flex-col md:flex-row items-center justify-around/g' "$file"
  sed -i '' 's/flex items-center justify-between/flex flex-col md:flex-row items-center md:justify-between gap-3/g' "$file"
  sed -i '' 's/w-1\/2/w-full md:w-1\/2/g' "$file"
  
  # 6. 차트 관련 수정
  sed -i '' 's/width: 150px;/width: 120px;/g' "$file"
  sed -i '' 's/height: 150px;/height: 120px;/g' "$file"
  
  # 문법 오류 방지
  sed -i '' 's/md:p-6 md:p-6/md:p-6/g' "$file"
done

echo "Detail 하위 페이지 반응형 수정 완료!"