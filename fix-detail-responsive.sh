#!/bin/bash

# Detail 하위 페이지들의 반응형 웹 문제 수정 스크립트
echo "Detail 하위 페이지 반응형 수정 시작..."

# 모든 detail 페이지 경로
DETAIL_PAGES="detail-1-1.html detail-1-2.html detail-2-1.html detail-2-2.html detail-3-1.html detail-3-2.html detail-4-1.html detail-4-2.html detail-5-1.html detail-5-2.html detail-6-1.html detail-6-2.html"

for file in $DETAIL_PAGES; do
  echo "처리 중: $file"
  
  # 1. slide-container 중복 min-height 수정
  sed -i '' 's/\.slide-container {[^}]*}/\.slide-container {\n            width: 100%;\n            max-width: 1280px;\n            min-height: 100vh;\n            margin: 0 auto;\n            position: relative;\n            overflow: hidden;\n        }/g' "$file"
  
  # 2. grid-cols-2를 반응형으로 변경
  sed -i '' 's/grid grid-cols-2 gap-6/grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-6/g' "$file"
  sed -i '' 's/grid grid-cols-2 gap-4/grid grid-cols-1 md:grid-cols-2 gap-3 md:gap-4/g' "$file"
  sed -i '' 's/grid grid-cols-2 gap-3/grid grid-cols-1 md:grid-cols-2 gap-2 md:gap-3/g' "$file"
  
  # 3. grid-cols-3을 반응형으로 변경
  sed -i '' 's/grid grid-cols-3 gap-3/grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-2 md:gap-3/g' "$file"
  
  # 4. Header의 padding 조정
  sed -i '' 's/p-6/p-4 md:p-6/g' "$file"
  
  # 5. Main Content 패딩 조정
  sed -i '' 's/p-5/p-3 md:p-5/g' "$file"
  
  # 6. flex items-center justify-between을 모바일에서 조정
  sed -i '' 's/flex items-center justify-between/flex flex-col md:flex-row items-center md:justify-between/g' "$file"
  
  # 7. Main Content 영역에 width 추가
  sed -i '' 's/flex-1 bg-gray-50 dot-pattern flex flex-col/flex-1 bg-gray-50 dot-pattern flex flex-col w-full/g' "$file"
  
  # 8. 차트 크기 제한 추가
  if grep -q "circular-chart" "$file"; then
    sed -i '' 's/\.circular-chart {[^}]*}/\.circular-chart {\n            width: 120px;\n            height: 120px;\n            position: relative;\n            margin: 0 auto;\n            max-width: 100%;\n        }/g' "$file"
  fi
  
  # 9. flex 콘텐츠 조정
  sed -i '' 's/flex items-center justify-around/flex flex-col md:flex-row items-center justify-around/g' "$file"
  sed -i '' 's/w-1\/2/w-full md:w-1\/2/g' "$file"
  
  # 10. 푸터 네비게이션 수정
  sed -i '' 's/<div class="p-4 flex justify-between items-center bg-gray-100 border-t border-gray-200">/<div class="p-4 flex flex-wrap justify-between items-center bg-gray-100 border-t border-gray-200">/g' "$file"

done

echo "Detail 하위 페이지 반응형 수정 완료!"