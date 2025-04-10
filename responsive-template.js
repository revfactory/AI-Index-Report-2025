// 반응형 웹 변환을 위한 스크립트
// HTML 파일들에 다음의 변경 사항을 적용해야 합니다:

/*
1. CSS 변경:
   - body: overflow: hidden -> overflow-x: hidden, min-height: 100vh 추가
   - .slide-container: width: 1280px -> width: 100%, max-width: 1280px, min-height: 100vh
   - 미디어 쿼리 추가:
     @media (max-width: 1280px) {
       .slide-container { width: 100%; }
     }
   
   - 사이드바 모바일 토글을 위한 CSS 추가:
     @media (max-width: 768px) {
       .sidebar-toggle {
         display: block;
         position: fixed;
         top: 10px;
         left: 10px;
         z-index: 30;
         background: rgba(255,255,255,0.8);
         border-radius: 50%;
         width: 40px;
         height: 40px;
         display: flex;
         align-items: center;
         justify-content: center;
         box-shadow: 0 2px 5px rgba(0,0,0,0.2);
       }
       .sidebar-mobile-hidden { transform: translateX(-100%); }
       .sidebar-visible { transform: translateX(0); }
     }

2. HTML 구조 변경:
   - 기본 컨테이너 클래스: flex -> flex flex-col md:flex-row
   - 모바일 사이드바 토글 버튼 추가:
     <button id="sidebarToggle" class="sidebar-toggle md:hidden">
       <i class="fas fa-bars"></i>
     </button>
   
   - 사이드바 클래스 업데이트:
     w-16 -> w-full md:w-16
     추가 클래스: transition-transform duration-300 fixed md:relative md:translate-x-0 sidebar-mobile-hidden z-20 h-full md:h-auto
   
   - 메인 콘텐츠 영역:
     p-10 -> p-4 md:p-10
     추가 클래스: w-full

3. 그리드 레이아웃 반응형으로 변경:
   - grid-cols-2 -> grid-cols-1 md:grid-cols-2
   - gap-8 -> gap-4 md:gap-8

4. JavaScript 추가 (</body> 태그 바로 앞에):
   <script>
     // 모바일 사이드바 토글
     document.addEventListener('DOMContentLoaded', function() {
       const sidebarToggle = document.getElementById('sidebarToggle');
       const sidebar = document.getElementById('sidebar');
       
       if (sidebarToggle && sidebar) {
         sidebarToggle.addEventListener('click', function() {
           sidebar.classList.toggle('sidebar-mobile-hidden');
           sidebar.classList.toggle('sidebar-visible');
         });
         
         // 사이드바 외부 클릭 시 닫기
         document.addEventListener('click', function(e) {
           if (!sidebar.contains(e.target) && !sidebarToggle.contains(e.target) && window.innerWidth < 768) {
             sidebar.classList.add('sidebar-mobile-hidden');
             sidebar.classList.remove('sidebar-visible');
           }
         });
       }
     });
   </script>
*/