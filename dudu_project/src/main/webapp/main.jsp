<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>Nice Admin Lite Template by WrapPixel</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png" />
<!-- Custom CSS -->
<link href="assets/libs/chartist/dist/chartist.min.css"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="css/style.min.css" rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
	<div id="main-wrapper" data-navbarbg="skin6" data-theme="light"
		data-layout="vertical" data-sidebartype="full"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md navbar-light">
				<div class="navbar-header" data-logobg="skin5">
					<!-- This is for the sidebar toggle which is visible on mobile only -->
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"> <i class="ti-menu ti-close"></i>
					</a>
					<!-- ============================================================== -->
					<!-- Logo 로고 -->
					<!-- ============================================================== -->
					<div class="navbar-brand">
						<a href="main.jsp" class="logo"> <!-- Logo icon --> <b
							class="logo-icon"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
								<!-- Dark Logo icon --> <img
								src="assets/images/DuDu_LOGO.jpg" alt="homepage"
								class="dark-logo" /> <!-- Light Logo icon --> <img
								src="assets/images/DuDu_LOGO.jpg" alt="homepage"
								class="light-logo" />
						</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
								<!-- dark Logo text --> <img
								src="assets/images/DuDu_LOGOtext.png" alt="homepage"
								class="dark-logo" /> <!-- Light Logo text --> <img
								src="assets/images/DuDu_LOGOtext.png" class="light-logo"
								alt="homepage" />
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
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin6">
					<!-- ============================================================== -->
					<!-- toggle and nav items -->
					<!-- ============================================================== -->
					<ul class="navbar-nav float-start me-auto">
						<!-- ============================================================== -->
						<!-- Search -->
						<!-- ============================================================== -->
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
									placeholder="Search &amp; enter" /> <a class="srh-btn"> <i
									class="mdi mdi mdi-close"></i>
								</a>
							</form></li>
					</ul>
					<!-- ============================================================== -->
					<!-- Right side toggle and nav items -->
					<!-- ============================================================== -->
					<ul class="navbar-nav float-end">
						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-bs-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span> <img
								class="img-profile rounded-circle" src="img/undraw_profile.svg"
								style="width: 30px; height: 30px;">
						</a>

							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">

								<a class="dropdown-item" href="profile.jsp"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보
								</a> <a class="dropdown-item" href="change-password.jsp"> <i
									class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i> 비밀번호 변경
								</a>

								<div class="dropdown-divider"></div>

								<a class="dropdown-item" href="#" data-bs-toggle="modal"
									data-bs-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									로그아웃
								</a>
							</div></li>
						<!-- ============================================================== -->
						<!-- User profile and search -->
						<!-- ============================================================== -->
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
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="main.jsp" aria-expanded="false"> <i
								class="mdi mdi-av-timer"></i> <span class="hide-menu">메인</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="device-status.jsp" aria-expanded="false"> <i
								class="mdi mdi-account-network"></i> <span class="hide-menu">기기현황</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="service-center.jsp" aria-expanded="false"> <i
								class="mdi mdi-arrange-bring-forward"></i> <span
								class="hide-menu">고객센터</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="data-management.jsp" aria-expanded="false"> <i
								class="mdi mdi-border-none"></i> <span class="hide-menu">데이터
									관리</span>
						</a></li>
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
						<h4 class="page-title">Dashboard</h4>
					</div>
					<div class="col-7 align-self-center">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Dashboard</li>
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
				<div class="row">
					<div class="col-lg-8">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">월별 안전자수 / 헬멧 미착용 발생 건수</h4>
								<div class="sales ct-charts mt-3"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title mb-1">경고 횟수</h5>
								<h3 class="font-light">Top 5</h3>
								<div class="mt-3 text-center">
									<div id="earnings"></div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title mb-0">사용자</h4>
								<h2 class="font-light">
									35,658 <span class="font-16 text-success font-medium">+23%</span>
								</h2>
								<div class="mt-4">
									<div class="row text-center">
										<div class="col-6 border-right">
											<h4 class="mb-0">58%</h4>
											<span class="font-14 text-muted">실시간</span>
										</div>
										<div class="col-6">
											<h4 class="mb-0">42%</h4>
											<span class="font-14 text-muted">일일</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
								<h4 class="card-title">개별 사용자 데이터</h4>
							</div>
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th class="border-top-0">이름</th>
											<th class="border-top-0">상태</th>
											<th class="border-top-0">마지막 탑승 날짜</th>
											<th class="border-top-0">안전 점수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="txt-oflo">사용자 이름</td>
											<td><span class="label label-success label-rounded">정상</span>
											</td>
											<td class="txt-oflo">May 5, 2026</td>
											<td><span class="font-medium">20</span></td>
										</tr>
										<tr>
											<td class="txt-oflo">사용자 이름</td>
											<td><span class="label label-warning label-rounded">주의</span>
											</td>
											<td class="txt-oflo">March 3, 2026</td>
											<td><span class="font-medium">50</span></td>
										</tr>
										<tr>
											<td class="txt-oflo">사용자 이름</td>
											<td><span class="label label-danger label-rounded">미착용</span>
											</td>
											<td class="txt-oflo">January 19, 2026</td>
											<td><span class="font-medium">70</span></td>
										</tr>
										<tr>
											<td class="txt-oflo">사용자 이름</td>
											<td><span class="label label-success label-rounded">정상</span>
											</td>
											<td class="txt-oflo">April 10, 2026</td>
											<td><span class="font-medium">0</span></td>
										</tr>
										<tr>
											<td class="txt-oflo">사용자 이름</td>
											<td><span class="label label-danger label-rounded">미착용</span>
											</td>
											<td class="txt-oflo">June 5, 2026</td>
											<td><span class="font-medium">15</span></td>
										</tr>
										<tr>
											<td class="txt-oflo">사용자 이름</td>
											<td><span class="label label-warning label-rounded">주의</span>
											</td>
											<td class="txt-oflo">April 23, 2021</td>
											<td><span class="font-medium">65</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- Ravenue - page-view-bounce rate -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Recent comment and chats -->
				<!-- ============================================================== -->

				<!-- column -->

				<!-- ============================================================== -->
				<!-- Recent comment and chats -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center">
				All Rights Reserved by Nice admin. Designed and Developed by <a
					href="https://www.wrappixel.com">WrapPixel</a>.
			</footer>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">현재 세션을 종료하시려면 '로그아웃' 버튼을 눌러주세요.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-bs-dismiss="modal">취소</button>
					<a class="btn btn-primary" href="login.jsp">로그아웃</a>
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
	<script
		src="assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script src="js/pages/dashboards/dashboard1.js"></script>



</body>

</html>