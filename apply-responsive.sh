#!/bin/bash

# 모든 HTML 파일에 반응형 웹 디자인 적용
echo "반응형 웹 디자인 적용 시작..."

# Body 및 slide-container CSS 수정
for file in *.html; do
  echo "처리 중: $file"
  
  # 1. Body CSS 변경
  sed -i '' 's/overflow: hidden;/overflow-x: hidden;\n            min-height: 100vh;/g' "$file"
  
  # 2. Slide-container CSS 변경
  sed -i '' 's/width: 1280px;/width: 100%;\n            max-width: 1280px;\n            min-height: 100vh;/g' "$file"
  
  # 3. 미디어 쿼리 추가
  sed -i '' '/\.slide-container {/,/}/ s/}/}\n        @media (max-width: 1280px) {\n            .slide-container {\n                width: 100%;\n            }\n        }/g' "$file"
  
  # 4. 사이드바 모바일 CSS 추가
  sed -i '' '/\.gradient-sidebar {/,/}/ s/}/}\n        @media (max-width: 768px) {\n            .sidebar-toggle {\n                display: block;\n                position: fixed;\n                top: 10px;\n                left: 10px;\n                z-index: 30;\n                background: rgba(255,255,255,0.8);\n                border-radius: 50%;\n                width: 40px;\n                height: 40px;\n                display: flex;\n                align-items: center;\n                justify-content: center;\n                box-shadow: 0 2px 5px rgba(0,0,0,0.2);\n            }\n            .sidebar-mobile-hidden {\n                transform: translateX(-100%);\n            }\n            .sidebar-visible {\n                transform: translateX(0);\n            }\n        }/g' "$file"
  
  # 5. 기본 컨테이너 클래스 변경
  sed -i '' 's/<div class="slide-container flex">/<div class="slide-container flex flex-col md:flex-row">\n        <!-- Mobile menu toggle -->\n        <button id="sidebarToggle" class="sidebar-toggle md:hidden">\n            <i class="fas fa-bars"><\/i>\n        <\/button>/g' "$file"
  
  # 6. 사이드바 클래스 추가
  sed -i '' 's/<div class="gradient-sidebar w-16 flex flex-col items-center py-8">/<div id="sidebar" class="gradient-sidebar w-full md:w-16 flex flex-col items-center py-8 transition-transform duration-300 fixed md:relative md:translate-x-0 sidebar-mobile-hidden z-20 h-full md:h-auto">/g' "$file"
  
  # 7. 메인 콘텐트 패딩 조정
  sed -i '' 's/content-bg flex-1 p-10/content-bg flex-1 p-4 md:p-10 w-full/g' "$file"
  sed -i '' 's/content-bg flex-1 p-8/content-bg flex-1 p-4 md:p-8 w-full/g' "$file"
  
  # 8. 그리드 레이아웃 반응형 변경
  sed -i '' 's/grid grid-cols-2 gap-8/grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-8/g' "$file"
  sed -i '' 's/grid grid-cols-3 gap-8/grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 md:gap-8/g' "$file"
  sed -i '' 's/grid grid-cols-4 gap-4/grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-2 md:gap-4/g' "$file"
  
  # 9. JavaScript 추가
  if ! grep -q "모바일 사이드바 토글" "$file"; then
    sed -i '' 's/<\/body>/    <script>\n        \/\/ 모바일 사이드바 토글\n        document.addEventListener('"'"'DOMContentLoaded'"'"', function() {\n            const sidebarToggle = document.getElementById('"'"'sidebarToggle'"'"');\n            const sidebar = document.getElementById('"'"'sidebar'"'"');\n            \n            if (sidebarToggle \&\& sidebar) {\n                sidebarToggle.addEventListener('"'"'click'"'"', function() {\n                    sidebar.classList.toggle('"'"'sidebar-mobile-hidden'"'"');\n                    sidebar.classList.toggle('"'"'sidebar-visible'"'"');\n                });\n                \n                \/\/ 사이드바 외부 클릭 시 닫기\n                document.addEventListener('"'"'click'"'"', function(e) {\n                    if (!sidebar.contains(e.target) \&\& !sidebarToggle.contains(e.target) \&\& window.innerWidth < 768) {\n                        sidebar.classList.add('"'"'sidebar-mobile-hidden'"'"');\n                        sidebar.classList.remove('"'"'sidebar-visible'"'"');\n                    }\n                });\n            }\n        });\n    <\/script>\n<\/body>/g' "$file"
  fi
done

echo "반응형 웹 디자인 적용 완료!"