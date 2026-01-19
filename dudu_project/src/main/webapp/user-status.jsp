<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< Updated upstream
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="keywords"
    content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Nice lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Nice admin lite design, Nice admin lite dashboard bootstrap 5 dashboard template" />
  <meta name="description"
    content="Nice Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework" />
  <meta name="robots" content="noindex,nofollow" />

  <title>두두 DuDu</title>

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
  .card-body {
  display: flex;
  align-items: center;
  gap: 16px;
}

.filter-box {
  display: flex;
  gap: 10px;
  margin-left: auto;
}

/* 셀렉트를 맨 뒤로 밀기 */
.sort-select {
  margin-left: auto;
  margin-bottom: 10px;
}
.row-link {
  cursor: pointer;
}
  </style>
</head>

<body>
  <!-- ============================================================== -->
  <!-- Preloader - style you can find in spinners.css -->
  <!-- ============================================================== -->
  <div class="preloader">
    <div class="lds-ripple">
      <div class="lds-pos"></div>
      <div class="lds-pos"></div>
    </div>
  </div>
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
          <ul class="navbar-nav float-start me-auto"></ul>
          <ul class="navbar-nav float-end">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
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
                  <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#alert">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    알람1
                  </a>
                  <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#alert2">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    알람2
                  </a>
                </div>
            </li>
            <!-- ============================================================== -->
            <!-- User profile and search -->
            <!-- ============================================================== -->
          </ul>
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
            <h4 class="page-title">유저 관리</h4>
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="#">홈</a>
                  </li>
                  <li class="breadcrumb-item active" aria-current="page">
                    유저 관리
                  </li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
      <!-- ============================================================== -->
      <!-- End Bread crumb and right sidebar toggle -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Container fluid  -->
      <!-- ============================================================== -->
      <div class="container-fluid">
        <!-- ============================================================== -->
        <!-- Email campaign chart -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- Email campaign chart -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Ravenue - page-view-bounce rate -->
        <!-- ============================================================== -->
        <div class="row">
          <!-- column -->
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title"></h4>
              </div>
              <div class="comment-widgets" style="height: 600px">
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th class="border-top-0">이름</th>
                        <th class="border-top-0">아이디</th>
                        <th class="border-top-0">주행 기록</th>
                        <th class="border-top-0">안전 등급</th>
                        <th class="border-top-0">마지막 접속일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr onclick="location.href='user-detail.jsp'">
                        <td><span class="font-medium">이름</span></td>
                        <td class="txt-oflo">아이디</td>
                        <td class="txt-oflo">2km</td>
                        <td class="txt-oflo">2</td>
                        <td class="txt-oflo">2026.01.15</td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">이름</span></td>
                        <td class="txt-oflo">아이디</td>
                        <td class="txt-oflo">2.1km</td>
                        <td class="txt-oflo">3</td>
                        <td class="txt-oflo">2026.01.10</td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">이름</span></td>
                        <td class="txt-oflo">아이디</td>
                        <td class="txt-oflo">1.2km</td>
                        <td class="txt-oflo">1</td>
                        <td class="txt-oflo">2026.01.03</td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">이름</span></td>
                        <td class="txt-oflo">아이디</td>
                        <td class="txt-oflo">5.1km</td>
                        <td class="txt-oflo">2</td>
                        <td class="txt-oflo">2025.12.31</td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">이름</span></td>
                        <td class="txt-oflo">아이디</td>
                        <td class="txt-oflo">2.32km</td>
                        <td class="txt-oflo">3</td>
                        <td class="txt-oflo">2025.12.24</td>
                      </tr>                      
                    </tbody>
                  </table>
                </div>
              </div>
              <div class="d-flex justify-content-center mt-3">
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
        <!-- ============================================================== -->
        <!-- Ravenue - page-view-bounce rate -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer text-center">
          All Rights Reserved by Nice admin. Designed and Developed by
          <a href="https://www.wrappixel.com">WrapPixel</a>.
        </footer>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
      </div>
      <!-- ============================================================== -->
      <!-- End Page wrapper  -->
      <!-- ============================================================== -->
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
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
// ==========================================================================
// [1] 데이터 준비 및 정렬 로직
// ==========================================================================

// 1. 요청 파라미터 처리 (페이지 번호 & 정렬 기준)
request.setCharacterEncoding("UTF-8");

String pageParam = request.getParameter("page");
int currentPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam);

// 정렬 파라미터 받기 (기본값: latest)
String sortParam = request.getParameter("sort");
if (sortParam == null || sortParam.equals("")) {
	sortParam = "latest";
}

int pageSize = 5;

// 2. [가상 데이터 생성]
List<Map<String, String>> allUsers = new ArrayList<>();
for (int i = 1; i <= 23; i++) {
	Map<String, String> user = new HashMap<>();
	user.put("name", "사용자" + i);
	user.put("id", "user" + String.format("%03d", i));
	user.put("ride", (i * 12) + "km");
	user.put("grade", String.valueOf((i % 3) + 1));
	user.put("date", "2026-01-" + String.format("%02d", (i % 30) + 1));
	allUsers.add(user);
}

// 3. [핵심] 정렬 로직 적용 (페이지 자르기 전에 정렬해야 함)
// -------------------------------------------------------------------
if ("name".equals(sortParam)) {
	// 이름순 (오름차순)
	Collections.sort(allUsers, new Comparator<Map<String, String>>() {
		public int compare(Map<String, String> m1, Map<String, String> m2) {
	return m1.get("name").compareTo(m2.get("name"));
		}
	});
} else if ("ride_desc".equals(sortParam)) {
	// 주행거리 많은순 (내림차순) - "km" 제거 후 숫자 비교
	Collections.sort(allUsers, new Comparator<Map<String, String>>() {
		public int compare(Map<String, String> m1, Map<String, String> m2) {
	int r1 = Integer.parseInt(m1.get("ride").replace("km", ""));
	int r2 = Integer.parseInt(m2.get("ride").replace("km", ""));
	return r2 - r1; // 내림차순
		}
	});
} else if ("grade_asc".equals(sortParam)) {
	// 등급 높은순 (1등급이 높은 것 -> 오름차순 정렬)
	Collections.sort(allUsers, new Comparator<Map<String, String>>() {
		public int compare(Map<String, String> m1, Map<String, String> m2) {
	return m1.get("grade").compareTo(m2.get("grade"));
		}
	});
} else {
	// 최신순 (날짜 내림차순) - 기본값
	Collections.sort(allUsers, new Comparator<Map<String, String>>() {
		public int compare(Map<String, String> m1, Map<String, String> m2) {
	return m2.get("date").compareTo(m1.get("date"));
		}
	});
}
// -------------------------------------------------------------------

// 4. 페이징 계산 (정렬된 리스트를 기반으로)
int totalCount = allUsers.size();
int totalPages = (int) Math.ceil((double) totalCount / pageSize);
int startIdx = (currentPage - 1) * pageSize;
int endIdx = Math.min(startIdx + pageSize, totalCount);

List<Map<String, String>> currentList = new ArrayList<>();
if (startIdx < totalCount) {
	currentList = allUsers.subList(startIdx, endIdx);
}
%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>유저 관리 - 두두 DuDu</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png" />
<link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
<link href="css/style.min.css" rel="stylesheet" />
<style>
.card-body {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

tbody tr:hover {
	background-color: #f8f9fa;
	cursor: pointer;
}

.page-item.active .page-link {
	background-color: #2962FF;
	border-color: #2962FF;
}
/* 정렬 선택 박스 스타일 */
.sort-select {
	width: 150px;
	display: inline-block;
	margin-left: auto;
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

	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">

		<header class="topbar" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md navbar-light">
				<div class="navbar-header" data-logobg="skin5">
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"> <i class="ti-menu ti-close"></i>
					</a>
					<div class="navbar-brand">
						<a href="main.jsp" class="logo"> <b class="logo-icon"><img
								src="assets/images/DuDu_LOGO.jpg" alt="homepage"
								class="light-logo" /></b> <span class="logo-text"><img
								src="assets/images/DuDu_LOGOtext.png" class="light-logo"
								alt="homepage" /></span>
						</a>
					</div>
				</div>
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin6">
					<ul class="navbar-nav float-start me-auto">
						<li class="nav-item search-box"><a
							class="nav-link waves-effect waves-dark"
							href="javascript:void(0)">
								<div class="d-flex align-items-center">
									<i class="mdi mdi-magnify font-20 me-1"></i>
									<div class="ms-1 d-none d-sm-block">
										<span>Search</span>
									</div>
								</div>
						</a>
							<form class="app-search position-absolute">
								<input type="text" class="form-control"
									placeholder="Search &amp; enter" /> <a class="srh-btn"><i
									class="mdi mdi mdi-close"></i></a>
							</form></li>
					</ul>
					<ul class="navbar-nav float-end">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <img src="assets/images/Ellipse 2.png"
								class="rounded-circle" style="width: 30px; height: 30px;">
						</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="profile.jsp"><i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보</a> <a
									class="dropdown-item" href="change-password.jsp"><i
									class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i> 비밀번호 변경</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-bs-toggle="modal"
									data-bs-target="#logoutModal"><i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃</a>
							</div></li>
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
						<h4 class="page-title">사용자 관리</h4>
					</div>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title mb-0">
									사용자 목록 (총
									<%=totalCount%>명)
								</h4>

								<select class="form-select sort-select"
									onchange="location.href='user-status.jsp?page=1&sort=' + this.value">
									<option value="latest"
										<%="latest".equals(sortParam) ? "selected" : ""%>>최신순</option>
									<option value="name"
										<%="name".equals(sortParam) ? "selected" : ""%>>이름순</option>
									<option value="ride_desc"
										<%="ride_desc".equals(sortParam) ? "selected" : ""%>>주행기록순</option>
									<option value="grade_asc"
										<%="grade_asc".equals(sortParam) ? "selected" : ""%>>등급높은순</option>
								</select>
							</div>

							<div class="table-responsive">
								<table class="table table-hover align-middle">
									<thead>
										<tr>
											<th class="border-top-0">이름</th>
											<th class="border-top-0">아이디</th>
											<th class="border-top-0">주행 기록</th>
											<th class="border-top-0">안전 등급</th>
											<th class="border-top-0">마지막 접속일</th>
										</tr>
									</thead>
									<tbody>
										<%
										for (Map<String, String> user : currentList) {
										%>
										<tr
											onclick="location.href='user-detail.jsp?id=<%=user.get("id")%>'">
											<td><span class="font-medium"><%=user.get("name")%></span></td>
											<td class="txt-oflo"><%=user.get("id")%></td>
											<td class="txt-oflo"><%=user.get("ride")%></td>
											<td class="txt-oflo">
												<%
												String grade = user.get("grade");
												String badgeClass = "bg-secondary";
												if ("1".equals(grade))
													badgeClass = "bg-success";
												else if ("2".equals(grade))
													badgeClass = "bg-warning text-dark";
												else if ("3".equals(grade))
													badgeClass = "bg-danger";
												%> <span
												class="badge <%=badgeClass%> rounded-pill"><%=grade%>등급</span>
											</td>
											<td class="txt-oflo"><%=user.get("date")%></td>
										</tr>
										<%
										}
										%>

										<%
										if (currentList.isEmpty()) {
										%>
										<tr>
											<td colspan="5" class="text-center">등록된 사용자가 없습니다.</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>

							<div class="d-flex justify-content-center mt-3 mb-3">
								<nav aria-label="Page navigation">
									<ul class="pagination">

										<li
											class="page-item <%=(currentPage == 1) ? "disabled" : ""%>">
											<a class="page-link"
											href="user-status.jsp?page=<%=currentPage - 1%>&sort=<%=sortParam%>"
											tabindex="-1">이전</a>
										</li>

										<%
										for (int i = 1; i <= totalPages; i++) {
										%>
										<li
											class="page-item <%=(currentPage == i) ? "active" : ""%>">
											<a class="page-link"
											href="user-status.jsp?page=<%=i%>&sort=<%=sortParam%>"><%=i%></a>
										</li>
										<%
										}
										%>

										<li
											class="page-item <%=(currentPage == totalPages) ? "disabled" : ""%>">
											<a class="page-link"
											href="user-status.jsp?page=<%=currentPage + 1%>&sort=<%=sortParam%>">다음</a>
										</li>

									</ul>
								</nav>
							</div>

						</div>
					</div>
				</div>
			</div>

			<footer class="footer text-center">
				All Rights Reserved by Nice admin. Designed and Developed by <a
					href="https://www.wrappixel.com">WrapPixel</a>.
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
</body>
>>>>>>> Stashed changes
</html>