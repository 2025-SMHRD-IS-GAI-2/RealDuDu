<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="robots" content="noindex,nofollow" />
  <title>기기 관리 대시보드 - DuDu Kickboard</title>
  <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin-lite/" />
  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
  <link href="css/style.min.css" rel="stylesheet" />

  <style>
    /* 상태 텍스트 색상 */
    .status-danger {
      color: #dc3545;
      font-weight: bold;
    }

    /* 고장 */
    .status-warning {
      color: #ffc107;
      font-weight: bold;
    }

    /* 배터리 */

    /* 지도 이미지 컨테이너 */
    .map-container {
      border: 1px solid #e9ecef;
      border-radius: 5px;
      overflow: hidden;
      text-align: center;
      background: #fff;
      padding: 10px;
      min-height: 400px;
      /* 높이 확보 */
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
    }

    .map-img {
      width: 100%;
      /* 가로를 꽉 채움 */
      height: 500px;
      /* ★ 세로 높이를 500px로 고정 (원하는 숫자로 변경 가능) */
      object-fit: cover;
      /* ★ 비율이 안 맞으면 빈 공간 없이 꽉 차게 (넘치는 부분은 잘림) */
      object-position: center;
      /* 이미지의 중앙을 보여줌 */
      border-radius: 4px;
    }

    /* 테이블 텍스트 정렬 */
    .table th,
    .table td {
      text-align: center;
      vertical-align: middle;
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
                <img src="assets/images/DuDu_LOGO.jpg" alt="homepage" class="dark-logo" />
                <img src="assets/images/DuDu_LOGO.jpg" alt="homepage" class="light-logo" />
              </b>
              <span class="logo-text">
                <img src="assets/images/DuDu_LOGOtext.png" alt="homepage" class="dark-logo" />
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
                <a class="srh-btn"><i class="mdi mdi-close"></i></a>
              </form>
            </li>
          </ul>
          <ul class="navbar-nav float-end">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span>
                <img class="img-profile rounded-circle" src="img/undraw_profile.svg" style="width: 30px; height: 30px;">
              </a>

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
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="device-status.jsp"
                aria-expanded="false">
                <i class="mdi mdi-account-network"></i><span class="hide-menu">기기현황</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="service-center.jsp"
                aria-expanded="false">
                <i class="mdi mdi-arrange-bring-forward"></i><span class="hide-menu">고객 센터</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="data-management.jsp"
                aria-expanded="false">
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
            <h4 class="page-title">기기 현황 대시보드</h4>
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">기기 현황</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>

      <div class="container-fluid">

        <div class="row">
          <div class="col-md-3">
            <div class="card bg-info text-white">
              <div class="card-body">
                <h5 class="card-title text-white">전체 기기</h5>
                <div class="d-flex align-items-center">
                  <i class="mdi mdi-scooter display-5"></i>
                  <div class="ms-auto display-5 fw-bold">50</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card bg-danger text-white">
              <div class="card-body">
                <h5 class="card-title text-white">사용 불가 (고장)</h5>
                <div class="d-flex align-items-center">
                  <i class="mdi mdi-alert-circle-outline display-5"></i>
                  <div class="ms-auto display-5 fw-bold">3</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card bg-warning text-white">
              <div class="card-body">
                <h5 class="card-title text-white">배터리 부족</h5>
                <div class="d-flex align-items-center">
                  <i class="mdi mdi-battery-20 display-5"></i>
                  <div class="ms-auto display-5 fw-bold">5</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card bg-success text-white">
              <div class="card-body">
                <h5 class="card-title text-white">정상 가동</h5>
                <div class="d-flex align-items-center">
                  <i class="mdi mdi-check-circle-outline display-5"></i>
                  <div class="ms-auto display-5 fw-bold">42</div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-7">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">⚠️ 상태 이상 기기 목록</h4>
                <h6 class="card-subtitle">현재 점검이 필요한 기기 리스트입니다.</h6>
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr class="table-active">
                        <th scope="col">기기 ID</th>
                        <th scope="col">상태</th>
                        <th scope="col">배터리</th>
                        <th scope="col">현재 위치</th>
                        <th scope="col">조회</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>SC-1001</td>
                        <td class="status-danger">사용 불가</td>
                        <td>0%</td>
                        <td>광주 동구 중앙초등학교</td>
                        <td><button class="btn btn-sm btn-outline-dark">위치 확인</button></td>
                      </tr>
                      <tr>
                        <td>SC-1004</td>
                        <td class="status-warning">배터리 부족</td>
                        <td>15%</td>
                        <td>광주 동구 금남로4가</td>
                        <td><button class="btn btn-sm btn-outline-dark">위치 확인</button></td>
                      </tr>
                      <tr>
                        <td>SC-1023</td>
                        <td class="status-danger">센서 오류</td>
                        <td>82%</td>
                        <td>광주 동구 예술의 거리</td>
                        <td><button class="btn btn-sm btn-outline-dark">위치 확인</button></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-5">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">🗺️ 위치 상세 정보</h4>
                <h6 class="card-subtitle">기기 선택 시 위치가 표시됩니다.</h6>

                <div class="map-container">
                  <img src="assets/images/map_sample.png" alt="지도 이미지 없음" class="map-img">
                  <p class="mt-3 text-muted">지도 이미지 예시 화면</p>
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

  <script src="assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="assets/extra-libs/sparkline/sparkline.js"></script>
  <script src="js/waves.js"></script>
  <script src="js/sidebarmenu.js"></script>
  <script src="js/custom.min.js"></script>

  


</body>

</html>