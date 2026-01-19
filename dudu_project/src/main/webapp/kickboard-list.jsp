<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="keywords" content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Nice lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Nice admin lite design, Nice admin lite dashboard bootstrap 5 dashboard template" />
  <meta name="description" content="Nice Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework" />
  <meta name="robots" content="noindex,nofollow" />
  <title>킥보드 목록 - 두두 DuDu</title>
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
        </div>
      </nav>
    </header>

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

        <li class="sidebar-item selected">
          <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
            <i class="mdi mdi-scooter"></i><span class="hide-menu">킥보드 관리</span>
          </a>
          <ul aria-expanded="false" class="collapse first-level in">
            <li class="sidebar-item active">
                <a href="kickboard-list.jsp" class="sidebar-link active">
                    <i class="mdi mdi-format-list-bulleted"></i><span class="hide-menu">킥보드 목록</span>
                </a>
            </li>
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
            <h4 class="page-title">킥보드 목록</h4>
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                  <li class="breadcrumb-item">킥보드 관리</li>
                  <li class="breadcrumb-item active" aria-current="page">킥보드 목록</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
      
      <div class="container-fluid">
        <div class="row mb-3">
          <div class="col-12">
            <div class="d-flex justify-content-end">
              <a href="kickboard-register.jsp" class="btn btn-primary text-white">
                <i class="mdi mdi-plus"></i> 새 킥보드 등록
              </a>
            </div>
          </div>
        </div>
        
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">킥보드 목록 조회</h4>
              </div>
              <div class="table-responsive">
                <table class="table table-hover align-middle">
                  <thead>
                    <tr>
                      <th class="border-top-0">킥보드 ID</th>
                      <th class="border-top-0">모델명</th>
                      <th class="border-top-0">상태</th>
                      <th class="border-top-0">등록일</th>
                      <th class="border-top-0">작업</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><span class="font-medium">KB-001</span></td>
                      <td class="txt-oflo">모델 A</td>
                      <td><span class="label label-success label-rounded">운영중</span></td>
                      <td class="txt-oflo">2026.01.15</td>
                      <td>
                        <a href="kickboard-status.jsp?kickboardId=KB-001" class="btn btn-sm btn-outline-primary">상태 변경</a>
                      </td>
                    </tr>
                    <tr>
                      <td><span class="font-medium">KB-002</span></td>
                      <td class="txt-oflo">모델 B</td>
                      <td><span class="label label-warning label-rounded">점검중</span></td>
                      <td class="txt-oflo">2026.01.10</td>
                      <td>
                        <a href="kickboard-status.jsp?kickboardId=KB-002" class="btn btn-sm btn-outline-primary">상태 변경</a>
                      </td>
                    </tr>
                    <tr>
                      <td><span class="font-medium">KB-003</span></td>
                      <td class="txt-oflo">모델 A</td>
                      <td><span class="label label-danger label-rounded">서비스 중단</span></td>
                      <td class="txt-oflo">2026.01.03</td>
                      <td>
                        <a href="kickboard-status.jsp?kickboardId=KB-003" class="btn btn-sm btn-outline-primary">상태 변경</a>
                      </td>
                    </tr>
                    <tr>
                      <td><span class="font-medium">KB-004</span></td>
                      <td class="txt-oflo">모델 C</td>
                      <td><span class="label label-success label-rounded">운영중</span></td>
                      <td class="txt-oflo">2025.12.31</td>
                      <td>
                        <a href="kickboard-status.jsp?kickboardId=KB-004" class="btn btn-sm btn-outline-primary">상태 변경</a>
                      </td>
                    </tr>
                    <tr>
                      <td><span class="font-medium">KB-005</span></td>
                      <td class="txt-oflo">모델 B</td>
                      <td><span class="label label-success label-rounded">운영중</span></td>
                      <td class="txt-oflo">2025.12.24</td>
                      <td>
                        <a href="kickboard-status.jsp?kickboardId=KB-005" class="btn btn-sm btn-outline-primary">상태 변경</a>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              
              <div class="d-flex justify-content-center mt-4 mb-3">
                <nav aria-label="Page navigation">
                  <ul class="pagination">
                    <li class="page-item disabled">
                      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#">다음</a>
                    </li>
                  </ul>
                </nav>
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