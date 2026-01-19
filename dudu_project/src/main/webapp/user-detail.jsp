<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< Updated upstream
<!DOCTYPE html>
<html dir="ltr" lang="en">
=======
<%@ page import="java.util.*" %>
<%
    // ==========================================================================
    // [1] 데이터 준비 (DB 연동 시 쿼리로 대체)
    // ==========================================================================
    request.setCharacterEncoding("UTF-8");
    
    // 1. 파라미터 받기
    String userId = request.getParameter("id");
    if(userId == null) userId = "user001"; // 테스트용 기본값

    // 2. [가상 데이터] 유저 정보 찾기 (user-status.jsp와 로직 매칭)
    Map<String, String> targetUser = new HashMap<>();
    
    // 임시로 user001 ~ user023 생성 후 매칭되는 ID 찾기
    boolean found = false;
    for(int i = 1; i <= 23; i++) {
        String currentId = "user" + String.format("%03d", i);
        if(currentId.equals(userId)) {
            targetUser.put("name", "사용자" + i);
            targetUser.put("id", currentId);
            targetUser.put("email", "user" + i + "@example.com"); 
            targetUser.put("grade", String.valueOf((i % 3) + 1));
            targetUser.put("score", String.valueOf(80 + (i % 20))); 
            targetUser.put("joinDate", "2026-01-" + String.format("%02d", (i % 30) + 1));
            targetUser.put("lastLogin", "2026-01-" + String.format("%02d", (i % 30) + 1));
            // 10번째 유저마다 블랙리스트인 것으로 가정
            targetUser.put("blacklist", (i % 10 == 0) ? "Y" : "N"); 
            found = true;
            break;
        }
    }
    
    if(!found) {
        // 찾는 유저가 없을 경우 기본 세팅
        targetUser.put("name", "알 수 없음");
        targetUser.put("id", userId);
        targetUser.put("email", "-");
        targetUser.put("grade", "1");
        targetUser.put("score", "0");
        targetUser.put("joinDate", "-");
        targetUser.put("lastLogin", "-");
        targetUser.put("blacklist", "N");
    }

    // 3. [가상 데이터] 해당 유저의 주행 기록 생성
    List<Map<String, String>> userRideLogs = new ArrayList<>();
    for(int j=0; j<5; j++) {
        Map<String, String> log = new HashMap<>();
        log.put("date", "2026-01-" + (15 - j));
        log.put("distance", (j * 2 + 1.5) + "km");
        
        // 점수 변화
        boolean isPositive = (j % 2 == 0);
        log.put("score", isPositive ? "+13" : "-5");
        log.put("scoreClass", isPositive ? "text-plus" : "text-minus");
        
        userRideLogs.add(log);
    }
%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">
>>>>>>> Stashed changes

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
<<<<<<< Updated upstream
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="keywords"
    content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Nice lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Nice admin lite design, Nice admin lite dashboard bootstrap 5 dashboard template" />
  <meta name="description"
    content="Nice Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework" />
  <meta name="robots" content="noindex,nofollow" />
  <title>Nice Admin Lite Template by WrapPixel</title>
  <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin-lite/" />
  <!-- Favicon icon -->
  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
  <!-- Custom CSS -->
  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
  <!-- Custom CSS -->
  <link href="css/style.min.css" rel="stylesheet" />
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
=======
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>유저 상세 정보 - 두두 DuDu</title>
  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
  <link href="css/style.min.css" rel="stylesheet" />
  
  <style>
>>>>>>> Stashed changes
       * {
      box-sizing: border-box;
      font-family: "Pretendard", Arial, sans-serif;
    }

<<<<<<< Updated upstream
    body {
      margin: 0;
      background: #f4f6f8;
    }

    /* ===== 전체 ===== */
    .container {
      max-width: 1200px;
      margin: 30px auto;
      padding: 0 20px;
=======
    /* 컨테이너 스타일 보정 */
    .detail-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
>>>>>>> Stashed changes
    }

    .page-title {
      font-size: 22px;
      font-weight: 600;
      margin-bottom: 20px;
<<<<<<< Updated upstream
    }

    /* ===== 카드 ===== */
    .card {
      background: #fff;
      border-radius: 6px;
      padding: 20px;
      margin-bottom: 20px;
    }

    .card-title {
      font-size: 16px;
      font-weight: 600;
      margin-bottom: 15px;
=======
      color: #3e5569;
    }

    /* ===== 카드 ===== */
    .custom-card {
      background: #fff;
      border-radius: 6px;
      padding: 25px;
      margin-bottom: 20px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
    }

    .custom-card-title {
      font-size: 16px;
      font-weight: 700;
      margin-bottom: 20px;
      border-bottom: 1px solid #eee;
      padding-bottom: 10px;
>>>>>>> Stashed changes
    }

    /* ===== 상단 영역 ===== */
    .top-section {
      display: flex;
      gap: 20px;
    }

    .profile-card {
<<<<<<< Updated upstream
      flex: 2;
=======
      flex: 1;
>>>>>>> Stashed changes
      display: flex;
      gap: 20px;
      align-items: center;
    }

    .avatar {
      width: 80px;
      height: 80px;
      background: #e0e0e0;
      border-radius: 50%;
<<<<<<< Updated upstream
    }

    .profile-info p {
      margin: 6px 0;
=======
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 30px;
      color: #fff;
      background-color: #2962FF;
    }

    .profile-info p {
      margin: 8px 0;
>>>>>>> Stashed changes
      font-size: 14px;
      color: #333;
    }

<<<<<<< Updated upstream
    .checkbox-group {
      margin-top: 10px;
    }

    .checkbox-group label {
      margin-right: 15px;
      font-size: 13px;
    }

    /* ===== 활동 정보 ===== */
    .activity-card {
      flex: 1;
      font-size: 13px;
    }

    .activity-card p {
      margin: 6px 0;
      color: #555;
    }

    /* ===== 포인트 ===== */
    .point-form {
      display: flex;
      gap: 10px;
      margin-bottom: 15px;
      flex-wrap: wrap;
    }

    .point-form select,
    .point-form input {
      padding: 6px;
      font-size: 13px;
    }

    .point-form button {
      background: #1e88e5;
      color: #fff;
      border: none;
      padding: 6px 14px;
      border-radius: 4px;
      cursor: pointer;
    }

    /* ===== 테이블 ===== */
    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 13px;
    }

    th, td {
      padding: 10px;
=======
    /* ===== 활동 정보 ===== */
    .activity-card {
      flex: 1;
      font-size: 14px;
    }

    .activity-card p {
      margin: 8px 0;
      color: #555;
    }

    /* ===== 테이블 ===== */
    .custom-table {
      width: 100%;
      border-collapse: collapse;
      font-size: 14px;
    }

    .custom-table th, .custom-table td {
      padding: 12px;
>>>>>>> Stashed changes
      border-bottom: 1px solid #e0e0e0;
      text-align: left;
    }

<<<<<<< Updated upstream
    th {
=======
    .custom-table th {
>>>>>>> Stashed changes
      background: #f9fafb;
      font-weight: 600;
    }

    .text-plus {
<<<<<<< Updated upstream
      color: #1e88e5;
      font-weight: 500;
=======
      color: #2962FF;
      font-weight: 600;
>>>>>>> Stashed changes
    }

    .text-minus {
      color: #e53935;
<<<<<<< Updated upstream
      font-weight: 500;
=======
      font-weight: 600;
>>>>>>> Stashed changes
    }

    /* ===== 반응형 ===== */
    @media (max-width: 900px) {
      .top-section {
        flex-direction: column;
      }
    }
<<<<<<< Updated upstream
    </style>
</head>

<body>
  <!-- ============================================================== -->
  <!-- Preloader - style you can find in spinners.css -->
  <!-- ============================================================== -->
=======
  </style>
</head>

<body>
>>>>>>> Stashed changes
  <div class="preloader">
    <div class="lds-ripple">
      <div class="lds-pos"></div>
      <div class="lds-pos"></div>
    </div>
  </div>
<<<<<<< Updated upstream
  <!-- ============================================================== -->
  <!-- Main wrapper - style you can find in pages.scss -->
  <!-- ============================================================== -->
  <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full"
    data-boxed-layout="full">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <header class="topbar" data-navbarbg="skin6">
      <nav class="navbar top-navbar navbar-expand-md navbar-light">
        <div class="navbar-header" data-logobg="skin5">
          <!-- This is for the sidebar toggle which is visible on mobile only -->
          <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
            <i class="ti-menu ti-close"></i>
          </a>
          <!-- ============================================================== -->
          <!-- Logo -->
          <!-- ============================================================== -->
          <div class="navbar-brand">
            <a href="index.jsp" class="logo">
              <!-- Logo icon -->
              <b class="logo-icon">
                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                <!-- Light Logo icon -->
                <img src="assets/images/logo2.jpg" alt="homepage" class="light-logo" />
              </b>
              <!--End Logo icon -->
              <!-- Logo text -->
              <span class="logo-text">
                <!-- Light Logo text -->
                <img src="assets/images/logo.png" class="light-logo" alt="homepage" />
              </span>
            </a>
          </div>
          <!-- ============================================================== -->
          <!-- End Logo -->
          <!-- ============================================================== -->
          <!-- ============================================================== -->
          <!-- Toggle which is visible on mobile only -->
          <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Logo -->
        <!-- ============================================================== -->
        <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
          <!-- ============================================================== -->
          <!-- toggle and nav items -->
          <!-- ============================================================== -->
          <ul class="navbar-nav float-start me-auto">
            <!-- ============================================================== -->
            <!-- Search -->
            <!-- ============================================================== -->
=======

  <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full"
    data-boxed-layout="full">
    
    <header class="topbar" data-navbarbg="skin6">
      <nav class="navbar top-navbar navbar-expand-md navbar-light">
        <div class="navbar-header" data-logobg="skin5">
          <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
            <i class="ti-menu ti-close"></i>
          </a>
          <div class="navbar-brand">
            <a href="main.jsp" class="logo">
              <b class="logo-icon"><img src="assets/images/DuDu_LOGO.jpg" alt="homepage" class="light-logo" /></b>
              <span class="logo-text"><img src="assets/images/DuDu_LOGOtext.png" class="light-logo" alt="homepage" /></span>
            </a>
          </div>
        </div>
        <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
          <ul class="navbar-nav float-start me-auto">
>>>>>>> Stashed changes
            <li class="nav-item search-box">
              <a class="nav-link waves-effect waves-dark" href="javascript:void(0)">
                <div class="d-flex align-items-center">
                  <i class="mdi mdi-magnify font-20 me-1"></i>
<<<<<<< Updated upstream
                  <div class="ms-1 d-none d-sm-block">
                    <span>Search</span>
                  </div>
=======
                  <div class="ms-1 d-none d-sm-block"><span>Search</span></div>
>>>>>>> Stashed changes
                </div>
              </a>
              <form class="app-search position-absolute">
                <input type="text" class="form-control" placeholder="Search &amp; enter" />
<<<<<<< Updated upstream
                <a class="srh-btn">
                  <i class="mdi mdi mdi-close"></i>
                </a>
              </form>
            </li>
          </ul>
          <!-- ============================================================== -->
          <!-- Right side toggle and nav items -->
          <!-- ============================================================== -->
        </div>
        <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
          <ul class="navbar-nav float-start me-auto"></ul>
=======
                <a class="srh-btn"><i class="mdi mdi mdi-close"></i></a>
              </form>
            </li>
          </ul>
>>>>>>> Stashed changes
          <ul class="navbar-nav float-end">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
<<<<<<< Updated upstream
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                <img src="assets/images/Ellipse 2.png" class="rounded-circle" style="width:30px;height:30px;">

                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">

                  <a class="dropdown-item" href="profile.jsp">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    내 정보
                  </a>

                  <a class="dropdown-item" href="change-password.jsp">
                    <i class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i>
                    비밀번호 변경
                  </a>

                  <div class="dropdown-divider"></div>

                  <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    로그아웃
                  </a>
                </div>
            </li>
            <!-- ============================================================== -->
            <!-- User profile and search -->
            <!-- ============================================================== -->
          </ul>
=======
                <img src="assets/images/Ellipse 2.png" class="rounded-circle" style="width:30px;height:30px;">
              </a>
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="profile.jsp"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보</a>
                <a class="dropdown-item" href="change-password.jsp"><i class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i> 비밀번호 변경</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃</a>
              </div>
            </li>
>>>>>>> Stashed changes
          </ul>
        </div>
      </nav>
    </header>
<<<<<<< Updated upstream
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <aside class="left-sidebar" data-sidebarbg="skin5">
      <!-- Sidebar scroll-->
      <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
          <ul id="sidebarnav">
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="main.jsp" aria-expanded="false">
                <i class="mdi mdi-av-timer"></i>
                <span class="hide-menu">메인</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="device-status.jsp"
                aria-expanded="false">
                <i class="mdi mdi-account-network"></i>
                <span class="hide-menu">기기현황</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="service-center.jsp"
                aria-expanded="false">
                <i class="mdi mdi-arrange-bring-forward"></i>
                <span class="hide-menu">고객센터</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="data-management.jsp"
                aria-expanded="false">
                <i class="mdi mdi-border-none"></i>
                <span class="hide-menu">데이터 관리</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="user-status.jsp"
                aria-expanded="false">
                <i class="mdi mdi-face"></i>
                <span class="hide-menu">유저 관리</span>
              </a>
            </li>
          </ul>
        </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!-- ============================================================== -->
    <!-- End Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
      <!-- ============================================================== -->
      <!-- Bread crumb and right sidebar toggle -->
      <!-- ============================================================== -->
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-5 align-self-center">
            <h4 class="page-title"></h4>
=======

    <aside class="left-sidebar" data-sidebarbg="skin5">
      <div class="scroll-sidebar">
        <nav class="sidebar-nav">
          <ul id="sidebarnav">
            
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="main.jsp" aria-expanded="false">
                <i class="mdi mdi-av-timer"></i><span class="hide-menu">메인</span>
              </a>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                <i class="mdi mdi-account-settings"></i><span class="hide-menu">관리자 관리</span>
              </a>
              <ul aria-expanded="false" class="collapse first-level">
                <li class="sidebar-item"><a href="admin-login.jsp" class="sidebar-link"><i class="mdi mdi-login"></i><span class="hide-menu">관리자 로그인</span></a></li>
                <li class="sidebar-item"><a href="admin-join.jsp" class="sidebar-link"><i class="mdi mdi-account-plus"></i><span class="hide-menu">관리자 등록</span></a></li>
                <li class="sidebar-item"><a href="change-password.jsp" class="sidebar-link"><i class="mdi mdi-key-change"></i><span class="hide-menu">비밀번호 변경</span></a></li>
              </ul>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                <i class="mdi mdi-scooter"></i><span class="hide-menu">킥보드 관리</span>
              </a>
              <ul aria-expanded="false" class="collapse first-level">
                <li class="sidebar-item"><a href="kickboard-list.jsp" class="sidebar-link"><i class="mdi mdi-format-list-bulleted"></i><span class="hide-menu">킥보드 목록</span></a></li>
                <li class="sidebar-item"><a href="kickboard-register.jsp" class="sidebar-link"><i class="mdi mdi-plus-circle"></i><span class="hide-menu">킥보드 등록</span></a></li>
                <li class="sidebar-item"><a href="kickboard-status.jsp" class="sidebar-link"><i class="mdi mdi-information"></i><span class="hide-menu">킥보드 상태</span></a></li>
                <li class="sidebar-item"><a href="device-status.jsp" class="sidebar-link"><i class="mdi mdi-account-network"></i><span class="hide-menu">기기 현황</span></a></li>
                <li class="sidebar-item"><a href="ride-log-list.jsp" class="sidebar-link"><i class="mdi mdi-history"></i><span class="hide-menu">주행 기록</span></a></li>
              </ul>
            </li>

            <li class="sidebar-item selected">
              <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="user-status.jsp" aria-expanded="false">
                <i class="mdi mdi-face"></i><span class="hide-menu">유저 관리</span>
              </a>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                <i class="mdi mdi-headset"></i><span class="hide-menu">고객센터</span>
              </a>
              <ul aria-expanded="false" class="collapse first-level">
                <li class="sidebar-item"><a href="service-center.jsp" class="sidebar-link"><i class="mdi mdi-email"></i><span class="hide-menu">문의 목록</span></a></li>
                <li class="sidebar-item"><a href="inquiry-history.jsp" class="sidebar-link"><i class="mdi mdi-history"></i><span class="hide-menu">처리 이력</span></a></li>
              </ul>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="data-management.jsp" aria-expanded="false">
                <i class="mdi mdi-border-none"></i><span class="hide-menu">데이터 관리</span>
              </a>
            </li>

          </ul>
        </nav>
      </div>
    </aside>

    <div class="page-wrapper">
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-5 align-self-center">
            <h4 class="page-title">유저 정보</h4>
>>>>>>> Stashed changes
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
<<<<<<< Updated upstream
                  <li class="breadcrumb-item">
                    <a href="#">홈</a>
                  </li>
                  <li class="breadcrumb-item active" aria-current="page">
                   유저 정보
                  </li>
=======
                  <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                  <li class="breadcrumb-item"><a href="user-status.jsp">유저 관리</a></li>
                  <li class="breadcrumb-item active" aria-current="page">상세 정보</li>
>>>>>>> Stashed changes
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
<<<<<<< Updated upstream
      <!-- ============================================================== -->
      <!-- End Bread crumb and right sidebar toggle -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Container fluid  -->
      <!-- ============================================================== -->
      <div class="container">

  <div class="page-title">유저 상세 정보</div>

  <!-- 상단 -->
  <div class="top-section">

    <!-- 회원 정보 -->
    <div class="card profile-card">
      <div class="avatar"></div>
      <div class="profile-info">
        <div class="card-title">유저 정보</div>
        <p><strong>이름:</strong> 이름</p>
        <p><strong>이메일:</strong> t*******@naver.com</p>
      </div>
    </div>

    <!-- 활동 정보 -->
    <div class="card activity-card">
      <div class="card-title">유저 상세 정보</div>
      <p>아이디: 아이디</p>
      <p>안전 등급: 2</p>
      <p>안전 점수: 80</p>
      <p>가입일: 2026-01-13</p>
      <p>최근 로그인: 2026-01-15</p>
    </div>

  </div>

  <!-- 포인트 -->
  <div class="card">
    <div class="card-title">주행 기록</div>

    <div class="point-form">
      <select>
        <option>오름차순</option>
        <option>내림차순</option>
      </select>
    </div>

    <table>
      <thead>
        <tr>
          <th>일자</th>
          <th>거리</th>
          <th>안전 점수</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>2026-01-15</td>
          <td>1km</td>
          <td class="text-plus">+13</td>
        </tr>
        <tr>
          <td>2026-01-07</td>
          <td>1km</td>
          <td class="text-minus">+5</td>
        </tr>
      </tbody>
    </table>
  </div>

</div>
  <!-- ============================================================== -->
  <!-- All Jquery -->
  <!-- ============================================================== -->
  <script src="assets/libs/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap tether Core JavaScript -->
  <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!-- slimscrollbar scrollbar JavaScript -->
  <script src="assets/extra-libs/sparkline/sparkline.js"></script>
  <!--Wave Effects -->
  <script src="js/waves.js"></script>
  <!--Menu sidebar -->
  <script src="js/sidebarmenu.js"></script>
  <!--Custom JavaScript -->
  <script src="js/custom.min.js"></script>
  <!--This page JavaScript -->
  <!--chartis chart-->
  <script src="assets/libs/chartist/dist/chartist.min.js"></script>
  <script src="assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
  <script src="js/pages/dashboards/dashboard1.js"></script>




</body>

=======

      <div class="container-fluid detail-container">
        
        <div class="page-title">유저 상세 정보 : <span style="color:#2962FF"><%= targetUser.get("id") %></span></div>

        <div class="top-section">
          
          <div class="custom-card profile-card">
            <div class="avatar">
                <i class="mdi mdi-account"></i>
            </div>
            <div class="profile-info">
              <div class="custom-card-title">기본 정보</div>
              <p><strong>이름:</strong> <%= targetUser.get("name") %></p>
              <p><strong>이메일:</strong> <%= targetUser.get("email") %></p>
              <p><strong>연락처:</strong> 010-****-****</p>
            </div>
          </div>

          <div class="custom-card activity-card">
            <div class="custom-card-title">활동 상세</div>
            <p><strong>아이디:</strong> <%= targetUser.get("id") %></p>
            <p><strong>안전 등급:</strong> <%= targetUser.get("grade") %>등급</p>
            <p><strong>안전 점수:</strong> <%= targetUser.get("score") %>점</p>
            <p><strong>가입일:</strong> <%= targetUser.get("joinDate") %></p>
            <p><strong>최근 로그인:</strong> <%= targetUser.get("lastLogin") %></p>
          </div>
        </div>

        <div class="custom-card">
          <div class="d-flex justify-content-between align-items-center mb-3">
             <div class="custom-card-title mb-0">최근 주행 기록</div>
             <select class="form-select" style="width: auto;">
                <option>최신순</option>
                <option>과거순</option>
             </select>
          </div>

          <table class="custom-table">
            <thead>
              <tr>
                <th>일자</th>
                <th>주행 거리</th>
                <th>안전 점수 변화</th>
              </tr>
            </thead>
            <tbody>
              <% for(Map<String, String> log : userRideLogs) { %>
              <tr>
                <td><%= log.get("date") %></td>
                <td><%= log.get("distance") %></td>
                <td class="<%= log.get("scoreClass") %>"><%= log.get("score") %></td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>

        <div class="custom-card">
          <div class="custom-card-title">관리자 작업</div>
          
          <div class="mb-3">
            <p><strong>현재 상태:</strong> 
              <span id="currentBlacklistStatus" class="label label-rounded"></span>
            </p>
            <p><strong>안전 등급:</strong> 
              <span id="safetyGradeDisplay" class="label label-primary label-rounded"><%= targetUser.get("grade") %>등급</span>
              <small class="text-muted ms-2">(서버 자동 계산)</small>
            </p>
          </div>

          <form action="#" method="post" id="blacklistForm">
            <div class="mb-3">
              <label class="form-label"><strong>사용자 제한 상태 변경</strong></label>
              <div class="mt-2">
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="blacklistStatus" id="statusNormal" value="N">
                  <label class="form-check-label" for="statusNormal">정상</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="blacklistStatus" id="statusBlacklisted" value="Y">
                  <label class="form-check-label" for="statusBlacklisted">블랙리스트</label>
                </div>
              </div>
            </div>

            <div class="alert alert-warning" role="alert">
              <i class="mdi mdi-alert-circle me-1"></i> 블랙리스트로 지정된 사용자는 킥보드 대여 서비스 이용이 제한됩니다.
            </div>

            <div class="mt-3 text-end">
                <button type="button" class="btn btn-secondary me-1" onclick="history.back()">목록으로</button>
                <button type="submit" class="btn btn-primary">
                    <i class="mdi mdi-content-save"></i> 상태 변경 저장
                </button>
            </div>
          </form>
        </div>

      </div>
      
      <footer class="footer text-center">
        All Rights Reserved by Nice admin. Designed and Developed by
        <a href="https://www.wrappixel.com">WrapPixel</a>.
      </footer>
    </div>
  </div>

  <div class="modal fade" id="logoutModal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">로그아웃 하시겠습니까?</h5>
          <button class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <a href="login.jsp" class="btn btn-primary">로그아웃</a>
        </div>
      </div>
    </div>
  </div>

  <script src="assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="assets/extra-libs/sparkline/sparkline.js"></script>
  <script src="js/waves.js"></script>
  <script src="js/sidebarmenu.js"></script>
  <script src="js/custom.min.js"></script>
  <script src="assets/libs/chartist/dist/chartist.min.js"></script>
  <script src="assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
  <script src="js/pages/dashboards/dashboard1.js"></script>
    
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // 서버(Java)에서 넘어온 값
      const serverBlacklistStatus = "<%= targetUser.get("blacklist") %>"; 
      
      const statusBadge = document.getElementById('currentBlacklistStatus');
      const radioNormal = document.getElementById('statusNormal');
      const radioBlacklist = document.getElementById('statusBlacklisted');
      
      // 1. 초기 상태 세팅
      if (serverBlacklistStatus === 'Y') {
        radioBlacklist.checked = true;
        updateBadge('Y');
      } else {
        radioNormal.checked = true;
        updateBadge('N');
      }
      
      // 2. 배지 업데이트 함수
      function updateBadge(status) {
        if (status === 'Y') {
          statusBadge.textContent = '블랙리스트';
          statusBadge.className = 'label label-danger label-rounded';
        } else {
          statusBadge.textContent = '정상';
          statusBadge.className = 'label label-success label-rounded';
        }
      }
      
      // 3. 라디오 버튼 변경 이벤트
      const radios = document.querySelectorAll('input[name="blacklistStatus"]');
      radios.forEach(radio => {
        radio.addEventListener('change', function() {
          updateBadge(this.value);
        });
      });
      
      // 4. 저장 버튼 이벤트 (데모용)
      document.getElementById('blacklistForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const selected = document.querySelector('input[name="blacklistStatus"]:checked').value;
        const msg = selected === 'Y' ? '블랙리스트' : '정상';
        alert('상태가 [' + msg + ']로 변경되었습니다.\n(DB 연동 시 실제 반영됩니다)');
      });
    });
  </script>

</body>
>>>>>>> Stashed changes
</html>