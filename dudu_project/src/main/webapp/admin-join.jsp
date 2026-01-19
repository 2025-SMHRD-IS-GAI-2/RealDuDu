<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>관리자 회원가입 - 두두 DuDu</title>
  <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin-lite/" />
  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
  <link href="css/style.min.css" rel="stylesheet" />
  <style>
    .join-container {
      min-height: calc(100vh - 200px);
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .join-card {
      max-width: 500px;
      width: 100%;
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
              <b class="logo-icon">
                <img src="assets/images/DuDu_LOGO.jpg" alt="homepage" class="light-logo" />
              </b>
              <span class="logo-text">
                <img src="assets/images/DuDu_LOGOtext.png" class="light-logo" alt="homepage" />
              </span>
            </a>
          </div>
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
                <img src="assets/images/Ellipse 2.png" class="rounded-circle" style="width:30px;height:30px;">
              </a>
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

    <aside class="left-sidebar" data-sidebarbg="skin5">
      <div class="scroll-sidebar">
        <nav class="sidebar-nav">
          <ul id="sidebarnav">
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="main.jsp" aria-expanded="false">
                <i class="mdi mdi-view-dashboard"></i>
                <span class="hide-menu">대시보드</span>
              </a>
            </li>
            
            <li class="sidebar-item selected">
              <a class="sidebar-link has-arrow waves-effect waves-dark active" href="javascript:void(0)" aria-expanded="true">
                <i class="mdi mdi-account-settings"></i>
                <span class="hide-menu">관리자 관리</span>
              </a>
              <ul aria-expanded="true" class="collapse first-level in">
                <li class="sidebar-item">
                  <a href="admin-login.jsp" class="sidebar-link">
                    <i class="mdi mdi-login"></i>
                    <span class="hide-menu">관리자 로그인</span>
                  </a>
                </li>
                <li class="sidebar-item active">
                  <a href="admin-join.jsp" class="sidebar-link active">
                    <i class="mdi mdi-account-plus"></i>
                    <span class="hide-menu">관리자 등록</span>
                  </a>
                </li>
                <li class="sidebar-item">
                  <a href="change-password.jsp" class="sidebar-link">
                    <i class="mdi mdi-key-change"></i>
                    <span class="hide-menu">비밀번호 변경</span>
                  </a>
                </li>
              </ul>
            </li>
            
            <li class="sidebar-item">
              <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                <i class="mdi mdi-scooter"></i>
                <span class="hide-menu">킥보드 관리</span>
              </a>
              <ul aria-expanded="false" class="collapse first-level">
                <li class="sidebar-item">
                  <a href="kickboard-list.jsp" class="sidebar-link">
                    <i class="mdi mdi-format-list-bulleted"></i>
                    <span class="hide-menu">킥보드 목록</span>
                  </a>
                </li>
                <li class="sidebar-item">
                  <a href="kickboard-register.jsp" class="sidebar-link">
                    <i class="mdi mdi-plus-circle"></i>
                    <span class="hide-menu">킥보드 등록</span>
                  </a>
                </li>
                <li class="sidebar-item">
                  <a href="kickboard-status.jsp" class="sidebar-link">
                    <i class="mdi mdi-information"></i>
                    <span class="hide-menu">킥보드 상태</span>
                  </a>
                </li>
              </ul>
            </li>
            
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="user-status.jsp" aria-expanded="false">
                <i class="mdi mdi-account-group"></i>
                <span class="hide-menu">사용자 관리</span>
              </a>
            </li>
            
            <li class="sidebar-item">
              <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                <i class="mdi mdi-headset"></i>
                <span class="hide-menu">고객센터</span>
              </a>
              <ul aria-expanded="false" class="collapse first-level">
                <li class="sidebar-item">
                  <a href="service-center.jsp" class="sidebar-link">
                    <i class="mdi mdi-email"></i>
                    <span class="hide-menu">문의 목록</span>
                  </a>
                </li>
                <li class="sidebar-item">
                  <a href="inquiry-history.jsp" class="sidebar-link">
                    <i class="mdi mdi-history"></i>
                    <span class="hide-menu">처리 이력</span>
                  </a>
                </li>
              </ul>
            </li>
            
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="device-status.jsp" aria-expanded="false">
                <i class="mdi mdi-account-network"></i>
                <span class="hide-menu">기기현황</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="data-management.jsp" aria-expanded="false">
                <i class="mdi mdi-border-none"></i>
                <span class="hide-menu">데이터 관리</span>
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
            <h4 class="page-title">관리자 등록</h4>
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                  <li class="breadcrumb-item active" aria-current="page">관리자 등록</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>

      <div class="container-fluid">
        <div class="join-container">
          <div class="join-card">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title mb-4 text-center">관리자 계정 생성</h4>
                <form action="adminJoinAction.jsp" method="post">
                  <div class="mb-3">
                    <label for="adminId" class="form-label">관리자 ID</label>
                    <input type="text" class="form-control" id="adminId" name="adminId" placeholder="관리자 ID를 입력하세요" required>
                  </div>
                  <div class="mb-3">
                    <label for="adminPassword" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="adminPassword" name="adminPassword" placeholder="비밀번호를 입력하세요" required>
                  </div>
                  <div class="mb-3">
                    <label for="adminPasswordConfirm" class="form-label">비밀번호 확인</label>
                    <input type="password" class="form-control" id="adminPasswordConfirm" name="adminPasswordConfirm" placeholder="비밀번호를 다시 입력하세요" required>
                  </div>
                  <div class="mb-3">
                    <label for="adminName" class="form-label">관리자 이름</label>
                    <input type="text" class="form-control" id="adminName" name="adminName" placeholder="관리자 이름을 입력하세요" required>
                  </div>
                  <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg">회원가입</button>
                  </div>
                </form>
                <div class="text-center mt-3">
                  <a href="admin-login.jsp" class="text-muted">이미 계정이 있으신가요? 로그인</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <footer class="footer text-center">
        All Rights Reserved by Nice admin. Designed and Developed by
        <a href="https://www.wrappixel.com">WrapPixel</a>.
      </footer>
    </div>
  </div>

  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">로그아웃 하시겠습니까?</h5>
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
  <script src="assets/extra-libs/sparkline/sparkline.js"></script>
  <script src="js/waves.js"></script>
  <script src="js/sidebarmenu.js"></script>
  <script src="js/custom.min.js"></script>
</body>
</html>