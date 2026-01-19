<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="keywords" content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Nice lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Nice admin lite design, Nice admin lite dashboard bootstrap 5 dashboard template" />
  <meta name="description" content="Nice Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework" />
  <meta name="robots" content="noindex,nofollow" />
  <title>비밀번호 변경 - 두두 DuDu</title>
  <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin-lite/" />
  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
  <link href="css/style.min.css" rel="stylesheet" />
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
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
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
                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#alert">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 알람1
                </a>
                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#alert2">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 알람2
                </a>
              </div>
            </li>
          </ul>
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
                <li class="sidebar-item">
                  <a href="admin-join.jsp" class="sidebar-link">
                    <i class="mdi mdi-account-plus"></i>
                    <span class="hide-menu">관리자 등록</span>
                  </a>
                </li>
                <li class="sidebar-item active">
                  <a href="change-password.jsp" class="sidebar-link active">
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
      </div>
    </aside>

    <div class="page-wrapper">
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-5 align-self-center">
            <h4 class="page-title">비밀번호 변경</h4>
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                  <li class="breadcrumb-item">관리자 관리</li>
                  <li class="breadcrumb-item active" aria-current="page">비밀번호 변경</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
      
      <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 bg-white border-bottom-0">
                        <h6 class="m-0 font-weight-bold text-primary">보안 설정</h6>
                    </div>
                    <div class="card-body">
                        <form action="adminChangePasswordAction.jsp" method="post">
                            <div class="mb-3">
                                <label class="small mb-1" for="currentPassword">현재 비밀번호</label>
                                <input class="form-control" id="currentPassword" name="currentPassword" type="password" placeholder="현재 비밀번호를 입력하세요">
                            </div>
                            
                            <hr class="my-4">
                            
                            <div class="mb-3">
                                <label class="small mb-1" for="newPassword">새 비밀번호</label>
                                <input class="form-control" id="newPassword" name="newPassword" type="password" placeholder="새 비밀번호">
                            </div>
                            <div class="mb-3">
                                <label class="small mb-1" for="confirmPassword">새 비밀번호 확인</label>
                                <input class="form-control" id="confirmPassword" name="confirmPassword" type="password" placeholder="새 비밀번호를 다시 입력하세요">
                            </div>

                            <div class="d-grid gap-2 mt-4">
                                <button class="btn btn-success" type="submit">비밀번호 변경 완료</button>
                            </div>
                        </form>
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
                <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">현재 세션을 종료하시려면 '로그아웃' 버튼을 눌러주세요.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
                <a class="btn btn-primary" href="login.jsp">로그아웃</a>
            </div>
        </div>
    </div>
  </div>
  
  <div class="modal fade" id="alert" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">헬멧을 착용해주세요</h5>
          <button class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="alert2" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">핸드폰 소리를 키워주세요</h5>
          <button class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
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
</body>
</html>