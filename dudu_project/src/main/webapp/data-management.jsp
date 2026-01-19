<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
<<<<<<< Updated upstream

  <meta name="keywords"
    content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Nice lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Nice admin lite design, Nice admin lite dashboard bootstrap 5 dashboard template" />
  <meta name="description"
    content="Nice Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework" />
  <meta name="robots" content="noindex,nofollow" />

  <title>두두 DuDu</title>

  <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin-lite/" />

  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />

  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />

   <link href="css/style.min.css" rel="stylesheet" />

=======
  <meta name="keywords" content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Nice lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Nice admin lite design, Nice admin lite dashboard bootstrap 5 dashboard template" />
  <meta name="description" content="Nice Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework" />
  <meta name="robots" content="noindex,nofollow" />
  <title>데이터 관리 - 두두 DuDu</title>
  <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin-lite/" />
  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
  <link href="css/style.min.css" rel="stylesheet" />
>>>>>>> Stashed changes
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->



  <style>
    /* 데이터 카드 스타일 */
    .stat-card { transition: transform 0.2s; }
    .stat-card:hover { transform: translateY(-5px); }
    .grade-circle {
      width: 60px; height: 60px;
      background-color: #28b779;
      color: white;
      border-radius: 50%;
      display: flex; align-items: center; justify-content: center;
      font-size: 24px; font-weight: bold;
      margin: 0 auto;
    }
    .filter-box {
      background: #f8f9fa;
      border-radius: 5px;
      padding: 15px;
      margin-bottom: 20px;
    }
<<<<<<< Updated upstream

    .stat-card .card-body h6 {
      margin-top: 6px;
      margin-bottom: 10px;
    }

    .stat-card .card-body i,
    .stat-card .card-body .grade-circle {
      display: block;
      margin: 0 auto;
      height: 60px;
      /* 아이콘 영역 통일 */
      line-height: 60px;
      /* 아이콘 세로 정렬 */

=======
    .stat-card .card-body h6 { margin-top: 6px; margin-bottom: 10px; }
    .stat-card .card-body i, .stat-card .card-body .grade-circle {
      display: block; margin: 0 auto;
      height: 60px; line-height: 60px;
>>>>>>> Stashed changes
    }    
  </style>
</head>

<body>
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
=======

  <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full"
    data-boxed-layout="full">
    
    <header class="topbar" data-navbarbg="skin6">
      <nav class="navbar top-navbar navbar-expand-md navbar-light">
        <div class="navbar-header" data-logobg="skin5">
          <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)">
            <i class="ti-menu ti-close"></i>
          </a>
>>>>>>> Stashed changes
          <div class="navbar-brand">
            <a href="index.jsp" class="logo">
              <!-- Logo icon -->
              <b class="logo-icon">
<<<<<<< Updated upstream
                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                <!-- Light Logo icon -->
                <img src="assets/images/logo2.jpg" alt="homepage" class="light-logo" />
=======
                <img src="assets/images/DuDu_LOGO.jpg" alt="homepage" class="light-logo" />
>>>>>>> Stashed changes
              </b>
              <!--End Logo icon -->
              <!-- Logo text -->
              <span class="logo-text">
<<<<<<< Updated upstream
                <!-- Light Logo text -->
                <img src="assets/images/logo.png" class="light-logo" alt="homepage" />
=======
                <img src="assets/images/DuDu_LOGOtext.png" class="light-logo" alt="homepage" />
>>>>>>> Stashed changes
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
            <li class="nav-item search-box">
              <a class="nav-link waves-effect waves-dark" href="javascript:void(0)">
                <div class="d-flex align-items-center">
                  <i class="mdi mdi-magnify font-20 me-1"></i>
                  <div class="ms-1 d-none d-sm-block">
                    <span>Search</span>
                  </div>
                </div>
              </a>
              <form class="app-search position-absolute">
                <input type="text" class="form-control" placeholder="Search &amp; enter" />
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
          <ul class="navbar-nav float-start me-auto">
            <li class="nav-item search-box">
              <a class="nav-link waves-effect waves-dark" href="javascript:void(0)">
                <div class="d-flex align-items-center">
                  <i class="mdi mdi-magnify font-20 me-1"></i>
                  <div class="ms-1 d-none d-sm-block"><span>Search</span></div>
                </div>
              </a>
              <form class="app-search position-absolute">
                <input type="text" class="form-control" placeholder="Search &amp; enter" />
                <a class="srh-btn"><i class="mdi mdi mdi-close"></i></a>
              </form>
            </li>
          </ul>
          <ul class="navbar-nav float-end">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                <img src="assets/images/Ellipse 2.png" class="rounded-circle" style="width:30px;height:30px;">
<<<<<<< Updated upstream

=======
              </a>
>>>>>>> Stashed changes
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="profile.jsp">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보
                </a>
                <a class="dropdown-item" href="change-password.jsp">
                  <i class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i> 비밀번호 변경
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
                </a>
              </div>
            </li>
          </ul>
        </div>
      </nav>
    </header>
    <!-- ============================================================== -->
    <!-- End Topbar header -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <aside class="left-sidebar" data-sidebarbg="skin5">
<<<<<<< Updated upstream
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
                <a
                  class="sidebar-link waves-effect waves-dark sidebar-link"
                  href="user-status.jsp"
                  aria-expanded="false"
                >
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
=======
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

        <li class="sidebar-item">
          <a class="sidebar-link waves-effect waves-dark sidebar-link" href="user-status.jsp" aria-expanded="false">
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

        <li class="sidebar-item selected">
          <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="data-management.jsp" aria-expanded="false">
            <i class="mdi mdi-border-none"></i><span class="hide-menu">데이터 관리</span>
          </a>
        </li>

      </ul>
    </nav>
  </div>
</aside>

>>>>>>> Stashed changes
    <div class="page-wrapper">
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-5 align-self-center">
            <h4 class="page-title">데이터 통합 관리</h4>
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                  <li class="breadcrumb-item active" aria-current="page">데이터 관리</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card filter-box">
              <div class="d-flex align-items-center flex-wrap gap-2">
                <h5 class="mb-0 me-3 fw-bold"><i class="mdi mdi-calendar-clock"></i> 기간 설정:</h5>
                <input type="date" class="form-control w-auto" value="2026-01-01">
                <span class="mx-1">~</span>
                <input type="date" class="form-control w-auto" value="2026-01-13">
                <button class="btn btn-primary text-white ms-2">조회하기</button>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-md-3">
            <div class="card stat-card">
              <div class="card-body text-center">
                <h6 class="text-muted">통합 안전 등급</h6>
                <div class="grade-circle mb-2">A</div>
                <h3 class="fw-bold text-success">92점</h3>
                <small class="text-muted">전주 대비 +2점 상승</small>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card stat-card">
              <div class="card-body text-center">
                <h6 class="text-muted">누적 경고 횟수</h6>
                <i class="mdi mdi-alert text-danger display-5"></i>
                <h3 class="fw-bold mt-2">124회</h3>
                <small class="text-danger">최근 3일간 급증 ⚠️</small>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card stat-card">
              <div class="card-body text-center">
                <h6 class="text-muted">평균 헬멧 착용률</h6>
                <i class="mdi mdi-motorbike text-info display-5"></i>
                <h3 class="fw-bold mt-2">78.5%</h3>
                <small class="text-success">목표치(80%) 근접</small>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card stat-card">
              <div class="card-body text-center">
                <h6 class="text-muted">재착용 소요 시간</h6>
                <i class="mdi mdi-timer-sand text-warning display-5"></i>
                <h3 class="fw-bold mt-2">18초</h3>
                <small class="text-muted">경고 후 착용까지 평균</small>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-8">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">📉 일별 경고 및 헬멧 미착용 추이</h4>
                <canvas id="trendChart" height="100"></canvas>
              </div>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">📊 사용자 안전 등급 분포</h4>
                <canvas id="gradeChart" height="100"></canvas>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">📋 상세 로그 데이터</h4>
                <div class="table-responsive" style="max-height: 300px; overflow-y: auto;">
                  <table class="table table-hover table-bordered text-center">
                    <thead class="table-light">
                      <tr>
                        <th>발생 일시</th>
                        <th>기기 ID</th>
                        <th>이벤트 유형</th>
                        <th>재착용 시간</th>
                        <th>안전 점수 변동</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>2026-01-13 14:30</td>
                        <td>SC-1004</td>
                        <td><span class="badge bg-danger">헬멧 미착용</span></td>
                        <td>25초</td>
                        <td class="text-danger">-5점</td>
                      </tr>
                      <tr>
                        <td>2026-01-13 13:15</td>
                        <td>SC-1001</td>
                        <td><span class="badge bg-warning text-dark">급정거 경고</span></td>
                        <td>-</td>
                        <td class="text-danger">-2점</td>
                      </tr>
                      <tr>
                        <td>2026-01-13 12:00</td>
                        <td>SC-1023</td>
                        <td><span class="badge bg-success">정상 반납</span></td>
                        <td>-</td>
                        <td class="text-success">+1점</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

      <footer class="footer text-center">
        All Rights Reserved by Nice admin. Designed and Developed by <a href="https://www.wrappixel.com">WrapPixel</a>.
      </footer>
    </div>
  </div>

  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
          <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="login.jsp">로그아웃</a>
        </div>
      </div>
    </div>
  </div>

  <script src="assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/custom.min.js"></script>

  <script>
    // 1. 선 그래프 (추이 분석)
    const ctx1 = document.getElementById('trendChart').getContext('2d');
    new Chart(ctx1, {
      type: 'line',
      data: {
        labels: ['1/07', '1/08', '1/09', '1/10', '1/11', '1/12', '1/13'],
        datasets: [
          {
            label: '경고 횟수',
            data: [12, 19, 3, 5, 2, 3, 10],
            borderColor: '#ff6b6b',
            tension: 0.4
          },
          {
            label: '헬멧 착용률(%)',
            data: [85, 82, 90, 88, 92, 89, 78],
            borderColor: '#28b779',
            tension: 0.4
          }
        ]
      },
      options: { responsive: true }
    });

    // 2. 도넛 그래프 (등급 분포)
    const ctx2 = document.getElementById('gradeChart').getContext('2d');
    new Chart(ctx2, {
      type: 'doughnut',
      data: {
        labels: ['A등급 (안전)', 'B등급 (보통)', 'C등급 (위험)'],
        datasets: [{
          data: [30, 15, 5],
          backgroundColor: ['#28b779', '#ffca2c', '#dc3545'],
          hoverOffset: 4
        }]
      }
    });
  </script>
</body>
</html>