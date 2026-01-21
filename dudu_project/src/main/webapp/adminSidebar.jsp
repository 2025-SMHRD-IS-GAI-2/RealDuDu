<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
  /* [Dark Theme] 사이드바 스타일 정의 */
  .sidebar-dark {
    background-color: #1f262d; /* 원래 템플릿과 비슷한 진한 남색 */
    color: white;
  }
  
  .btn-toggle {
    display: inline-flex; align-items: center; padding: .5rem .5rem;
    font-weight: 600; color: #adb5bd; /* 연한 회색 */
    background-color: transparent; border: 0; width: 100%; text-align: left;
  }
  .btn-toggle:hover, .btn-toggle:focus {
    color: #fff; background-color: #343a40; /* 마우스 올렸을 때 조금 더 밝게 */
  }
  
  /* 화살표 아이콘 (흰색으로 변경) */
  .btn-toggle::before {
    width: 1.25em; line-height: 0; margin-right: 5px;
    /* 흰색 화살표 SVG */
    content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='white' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
    transition: transform .35s ease; transform-origin: .5em 50%;
  }
  .btn-toggle[aria-expanded="true"]::before { transform: rotate(90deg); }
  
  .btn-toggle-nav a {
    display: block; padding: .1875rem .5rem; margin-left: 1.5rem; 
    text-decoration: none; color: #adb5bd; /* 기본: 회색 */
  }
  .btn-toggle-nav a:hover { 
    background-color: #343a40; color: #fff; border-radius: 4px; /* 호버: 흰색 */
  }
</style>

<div class="d-flex flex-column flex-shrink-0 p-3 sidebar-dark" style="width: 260px; min-height: 100vh;">
    
   <a href="main.jsp" class="d-flex align-items-center pb-3 mb-3 text-white text-decoration-none border-bottom border-secondary" style="padding-left: 10px;">
        <div class="logo-icon me-2">
            <img src="assets/images/DuDu_LOGO.jpg" alt="logo" style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover;" />
        </div>
        
        <div class="logo-text d-flex align-items-center">
            <span class="fs-3 fw-bold text-white" style="letter-spacing: 1px; font-family: 'Malgun Gothic', sans-serif;">
                DUDU
            </span>
            <span class="fs-6 text-muted ms-2 pt-2">Admin</span>
        </div>
    </a>

    <ul class="list-unstyled ps-0">
      
      <li class="mb-1">
        <a href="main.jsp" class="btn btn-toggle align-items-center rounded text-decoration-none">
          메인
        </a>
      </li>

      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#admin-collapse" aria-expanded="false">
          관리자
        </button>
        <div class="collapse" id="admin-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="admin-login.jsp">로그인</a></li>
            <li><a href="admin-join.jsp">관리자 등록</a></li>
            <li><a href="change-password.jsp">비밀번호 변경</a></li>
          </ul>
        </div>
      </li>

      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#kick-collapse" aria-expanded="false">
          킥보드 관리
        </button>
        <div class="collapse" id="kick-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="kickboard-list.jsp">킥보드 목록</a></li>
            <li><a href="kickboard-register.jsp">킥보드 등록</a></li>
            <li><a href="kickboard-status.jsp">킥보드 상태</a></li>
            <li><a href="device-status.jsp">기기 현황</a></li>
            <li><a href="ride-log-list.jsp">주행 기록</a></li>
          </ul>
        </div>
      </li>
      
      <li class="border-top border-secondary my-3"></li>
      
      <li class="mb-1">
         <a href="user-status.jsp" class="btn btn-toggle align-items-center rounded text-decoration-none">
          사용자 관리
        </a>
      </li>
      
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#cs-collapse" aria-expanded="false">
          고객 센터
        </button>
        <div class="collapse" id="cs-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="service-center.jsp">문의 관리</a></li>
            <li><a href="inquiry-history.jsp">처리 이력</a></li>
          </ul>
        </div>
      </li>
      
      <li class="mb-1">
         <a href="data-management.jsp" class="btn btn-toggle align-items-center rounded text-decoration-none">
          데이터 관리
        </a>
       </li>
    </ul>
</div>