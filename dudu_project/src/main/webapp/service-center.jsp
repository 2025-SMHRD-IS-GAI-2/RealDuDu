<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
// ==========================================================================
// [1] 파라미터 받기 (검색 조건 및 정렬)
// ==========================================================================
request.setCharacterEncoding("UTF-8");

// 1. 페이지 번호
String pageParam = request.getParameter("page");
int currentPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam);
int pageSize = 10;

// 2. 필터 상태 (전체/미답변/답변완료)
String reqStatus = request.getParameter("status");
if (reqStatus == null)
	reqStatus = "all";
final String statusFilter = reqStatus; // [수정] final로 선언하여 내부 클래스에서 접근 가능하게 함

// 3. 정렬 순서 (최신순/오래된순)
String reqSort = request.getParameter("sort");
if (reqSort == null)
	reqSort = "dateDesc";
final String sortOrder = reqSort; // [수정] final로 선언하여 에러 해결 (Effective Final)

// ==========================================================================
// [2] 가상 데이터 생성 (DB 대용)
// ==========================================================================
List<Map<String, String>> allInquiries = new ArrayList<>();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

// 35개의 가상 데이터 만들기
for (int i = 1; i <= 35; i++) {
	Map<String, String> map = new HashMap<>();
	map.put("id", String.valueOf(i));
	map.put("title", "킥보드 관련 문의드립니다 " + i);
	map.put("name", "사용자" + i);

	// 날짜 생성 (i값을 이용해 서로 다른 날짜로)
	Calendar cal = Calendar.getInstance();
	cal.set(2026, Calendar.JANUARY, 1);
	cal.add(Calendar.DAY_OF_MONTH, -i); // 하루씩 과거로
	map.put("date", sdf.format(cal.getTime()));

	// 상태 랜덤 (3의 배수면 미답변)
	if (i % 3 == 0) {
		map.put("status", "미답변");
		map.put("statusClass", "label-danger");
	} else {
		map.put("status", "답변 완료");
		map.put("statusClass", "label-success");
	}
	allInquiries.add(map);
}

// ==========================================================================
// [3] 필터링 및 정렬 로직 적용
// ==========================================================================
List<Map<String, String>> filteredList = new ArrayList<>();

// 1. 필터링 (상태값에 따라 걸러내기)
for (Map<String, String> item : allInquiries) {
	if ("all".equals(statusFilter)) {
		filteredList.add(item);
	} else if ("pending".equals(statusFilter) && "미답변".equals(item.get("status"))) {
		filteredList.add(item);
	} else if ("answered".equals(statusFilter) && "답변 완료".equals(item.get("status"))) {
		filteredList.add(item);
	}
}

// 2. 정렬 (날짜 기준)
Collections.sort(filteredList, new Comparator<Map<String, String>>() {
	@Override
	public int compare(Map<String, String> o1, Map<String, String> o2) {
		String date1 = o1.get("date");
		String date2 = o2.get("date");

		// 여기서 sortOrder를 사용할 때 에러가 났던 것임 (이제 final이라 괜찮음)
		if ("dateAsc".equals(sortOrder)) {
	return date1.compareTo(date2); // 오름차순 (옛날 -> 최신)
		} else {
	return date2.compareTo(date1); // 내림차순 (최신 -> 옛날)
		}
	}
});

// ==========================================================================
// [4] 페이징 처리
// ==========================================================================
int totalCount = filteredList.size();
int totalPages = (int) Math.ceil((double) totalCount / pageSize);

// 페이지 범위가 벗어나지 않도록 보정
if (currentPage > totalPages && totalPages > 0)
	currentPage = totalPages;

int startIdx = (currentPage - 1) * pageSize;
int endIdx = Math.min(startIdx + pageSize, totalCount);

List<Map<String, String>> currentList = new ArrayList<>();
if (startIdx < totalCount) {
	currentList = filteredList.subList(startIdx, endIdx);
}
%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">

<head>
<<<<<<< Updated upstream
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

  </style>
=======
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>고객센터 - 두두 DuDu</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin-lite/" />
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png" />
<link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
<link href="css/style.min.css" rel="stylesheet" />

<style>
.card-body {
	display: flex;
	align-items: center;
	justify-content: space-between; /* 양쪽 정렬 */
	flex-wrap: wrap;
}

.filter-form {
	display: flex;
	align-items: center;
	gap: 15px;
}

.radio-wrap {
	display: flex;
	align-items: center;
	gap: 5px;
	cursor: pointer;
	margin-bottom: 0;
}

.radio-wrap input {
	cursor: pointer;
}

.sort-select {
	padding: 5px 10px;
	border: 1px solid #e9ecef;
	border-radius: 4px;
	cursor: pointer;
}

tbody tr:hover {
	background-color: #f8f9fa;
	cursor: pointer;
}

.page-item.active .page-link {
	background-color: #2962FF;
	border-color: #2962FF;
	color: white;
}
</style>
>>>>>>> Stashed changes
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
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small"></span> <img
								src="assets/images/Ellipse 2.png" class="rounded-circle"
								style="width: 30px; height: 30px;">
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
<<<<<<< Updated upstream
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
=======
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

        <li class="sidebar-item selected">
          <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
            <i class="mdi mdi-headset"></i><span class="hide-menu">고객센터</span>
          </a>
          <ul aria-expanded="false" class="collapse first-level in">
            <li class="sidebar-item active">
                <a href="service-center.jsp" class="sidebar-link active">
                    <i class="mdi mdi-email"></i><span class="hide-menu">문의 목록</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="inquiry-history.jsp" class="sidebar-link">
                    <i class="mdi mdi-history"></i><span class="hide-menu">처리 이력</span>
>>>>>>> Stashed changes
                </a>
            </li>
          </ul>
<<<<<<< Updated upstream
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
            <h4 class="page-title">고객센터</h4>
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a href="#">홈</a>
                  </li>
                  <li class="breadcrumb-item active" aria-current="page">
                    고객센터
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
                
                <div class="filter-box">
                  <label class="radio-wrap">
                    <input type="radio" name="status" value="all" checked>
                    <span>전체</span>
                  </label>

                  <label class="radio-wrap">
                    <input type="radio" name="status" value="pending">
                    <span>미답변</span>
                  </label>

                  <label class="radio-wrap">
                    <input type="radio" name="status" value="done">
                    <span>답변완료</span>
                  </label>
                  <select class="sort-select">
                  <option>날짜 오름차순</option>
                  <option>날짜 내림차순</option>
                </select>
                </div>
              </div>
              <div class="comment-widgets" style="height: 600px">
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th class="border-top-0">제목</th>
                        <th class="border-top-0">이름</th>
                        <th class="border-top-0">날짜</th>
                        <th class="border-top-0">상태</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><span class="font-medium">문의 1</span></td>
                        <td class="txt-oflo">이름 1</td>
                        <td class="txt-oflo">2026.01.12</td>
                        <td>
                          <span class="label label-success label-rounded">답변 완료</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 2</span></td>
                        <td class="txt-oflo">이름 2</td>
                        <td class="txt-oflo">2026.01.06</td>
                        <td>
                          <span class="label label-success label-rounded">답변 완료</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 3</span></td>
                        <td class="txt-oflo">이름 3</td>
                        <td class="txt-oflo">2026.01.03</td>
                        <td>
                          <span class="label label-danger label-rounded">미답변</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 4</span></td>
                        <td class="txt-oflo">이름 4</td>
                        <td class="txt-oflo">2025.12.31</td>
                        <td>
                          <span class="label label-success label-rounded">답변 완료</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 5</span></td>
                        <td class="txt-oflo">이름 5</td>
                        <td class="txt-oflo">2025.12.22</td>
                        <td>
                          <span class="label label-danger label-rounded">미답변</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 6</span></td>
                        <td class="txt-oflo">이름 6</td>
                        <td class="txt-oflo">2025.12.11</td>
                        <td>
                          <span class="label label-danger label-rounded">미답변</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 7</span></td>
                        <td class="txt-oflo">이름 7</td>
                        <td class="txt-oflo">2025.11.29</td>
                        <td>
                          <span class="label label-success label-rounded">답변 완료</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 8</span></td>
                        <td class="txt-oflo">이름 8</td>
                        <td class="txt-oflo">2025.11.26</td>
                        <td>
                          <span class="label label-danger label-rounded">미답변</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 9</span></td>
                        <td class="txt-oflo">이름 9</td>
                        <td class="txt-oflo">2025.11.17</td>
                        <td>
                          <span class="label label-danger label-rounded">미답변</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 10</span></td>
                        <td class="txt-oflo">이름 10</td>
                        <td class="txt-oflo">2025.11.11</td>
                        <td>
                          <span class="label label-success label-rounded">답변 완료</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 11</span></td>
                        <td class="txt-oflo">이름 11</td>
                        <td class="txt-oflo">2025.11.08</td>
                        <td>
                          <span class="label label-success label-rounded">답변 완료</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 12</span></td>
                        <td class="txt-oflo">이름 12</td>
                        <td class="txt-oflo">2025.11.02</td>
                        <td>
                          <span class="label label-success label-rounded">답변 완료</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 13</span></td>
                        <td class="txt-oflo">이름 13</td>
                        <td class="txt-oflo">2025.10.30</td>
                        <td>
                          <span class="label label-danger label-rounded">미답변</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 14</span></td>
                        <td class="txt-oflo">이름 14</td>
                        <td class="txt-oflo">2025.10.27</td>
                        <td>
                          <span class="label label-success label-rounded">답변 완료</span>
                        </td>
                      </tr>
                      <tr>
                        <td><span class="font-medium">문의 15</span></td>
                        <td class="txt-oflo">이름 15</td>
                        <td class="txt-oflo">2025.10.21</td>
                        <td>
                          <span class="label label-danger label-rounded">미답변</span>
                        </td>
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
=======
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
						<h4 class="page-title">문의 목록</h4>
					</div>
					<div class="col-7 align-self-center">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
									<li class="breadcrumb-item">고객센터</li>
									<li class="breadcrumb-item active" aria-current="page">문의
										목록</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title mb-0">
									문의 목록 (총
									<%=totalCount%>건)
								</h4>

								<form action="service-center.jsp" method="get"
									class="filter-form">
									<label class="radio-wrap"> <input type="radio"
										name="status" value="all" onchange="this.form.submit()"
										<%="all".equals(statusFilter) ? "checked" : ""%>> <span>전체</span>
									</label> <label class="radio-wrap"> <input type="radio"
										name="status" value="pending" onchange="this.form.submit()"
										<%="pending".equals(statusFilter) ? "checked" : ""%>>
										<span>미답변</span>
									</label> <label class="radio-wrap"> <input type="radio"
										name="status" value="answered" onchange="this.form.submit()"
										<%="answered".equals(statusFilter) ? "checked" : ""%>>
										<span>답변완료</span>
									</label> <select class="sort-select" name="sort"
										onchange="this.form.submit()">
										<option value="dateDesc"
											<%="dateDesc".equals(sortOrder) ? "selected" : ""%>>최신순</option>
										<option value="dateAsc"
											<%="dateAsc".equals(sortOrder) ? "selected" : ""%>>오래된순</option>
									</select>
								</form>
							</div>

							<div class="table-responsive">
								<table class="table table-hover align-middle">
									<thead>
										<tr>
											<th class="border-top-0">번호</th>
											<th class="border-top-0">제목</th>
											<th class="border-top-0">작성자</th>
											<th class="border-top-0">작성일</th>
											<th class="border-top-0">상태</th>
										</tr>
									</thead>
									<tbody>
										<%
										for (Map<String, String> item : currentList) {
										%>
										<tr
											onclick="location.href='inquiry-detail.jsp?inquiryId=<%=item.get("id")%>'">
											<td><%=item.get("id")%></td>
											<td><span class="font-medium"><%=item.get("title")%></span></td>
											<td class="txt-oflo"><%=item.get("name")%></td>
											<td class="txt-oflo"><%=item.get("date")%></td>
											<td><span
												class="label <%=item.get("statusClass")%> label-rounded"><%=item.get("status")%></span>
											</td>
										</tr>
										<%
										}
										%>

										<%
										if (currentList.isEmpty()) {
										%>
										<tr>
											<td colspan="5" class="text-center">조회된 문의 내역이 없습니다.</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
							</div>
>>>>>>> Stashed changes

							<div class="d-flex justify-content-center mt-4 mb-3">
								<nav aria-label="Page navigation">
									<ul class="pagination">
										<li
											class="page-item <%=(currentPage == 1) ? "disabled" : ""%>">
											<a class="page-link"
											href="service-center.jsp?page=<%=currentPage - 1%>&status=<%=statusFilter%>&sort=<%=sortOrder%>">이전</a>
										</li>

<<<<<<< Updated upstream
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
=======
										<%
										for (int i = 1; i <= totalPages; i++) {
										%>
										<li
											class="page-item <%=(currentPage == i) ? "active" : ""%>">
											<a class="page-link"
											href="service-center.jsp?page=<%=i%>&status=<%=statusFilter%>&sort=<%=sortOrder%>"><%=i%></a>
										</li>
										<%
										}
										%>

										<li
											class="page-item <%=(currentPage == totalPages) ? "disabled" : ""%>">
											<a class="page-link"
											href="service-center.jsp?page=<%=currentPage + 1%>&status=<%=statusFilter%>&sort=<%=sortOrder%>">다음</a>
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
>>>>>>> Stashed changes
</body>
</html>