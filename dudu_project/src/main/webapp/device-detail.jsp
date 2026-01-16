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
        * {
            box-sizing: border-box;
            font-family: "Pretendard", Arial, sans-serif;
        }

        body {
            margin: 0;
            background: #f4f6f8;
        }

        /* ===== 전체 ===== */
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }

        .page-title {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 20px;
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
        }

        /* ===== 상단 영역 ===== */
        .top-section {
            display: flex;
            gap: 20px;
        }

        .profile-card {
            flex: 2;
            display: flex;
            gap: 20px;
            align-items: center;
            height: auto;
        }

        .avatar {
            width: 80px;
            height: 80px;
            background: #e0e0e0;
            border-radius: 50%;
        }

        .profile-info p {
            margin: 6px 0;
            font-size: 14px;
            color: #333;
        }

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
            height: 250px;
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

        th,
        td {
            padding: 10px;
            border-bottom: 1px solid #e0e0e0;
            text-align: left;
        }

        th {
            background: #f9fafb;
            font-weight: 600;
        }

        .text-plus {
            color: #1e88e5;
            font-weight: 500;
        }

        .text-minus {
            color: #e53935;
            font-weight: 500;
        }

        /* ===== 반응형 ===== */
        @media (max-width: 900px) {
            .top-section {
                flex-direction: column;
            }
        }

        .map-box {
            width: 100%;
            height: 600px;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #e0e0e0;
        }

        .map-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            /* 이미지 꽉 채우기 */
        }
        .damage-card {
            flex: 1;
            font-size: 13px;
            height:auto;
        }
        .device-box {
            width: 100%;
            height: 600px;
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #e0e0e0;
        }

        .device-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            /* 이미지 꽉 채우기 */
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
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                                <img src="assets/images/Ellipse 2.png" class="rounded-circle"
                                    style="width:30px;height:30px;">

                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                    aria-labelledby="userDropdown">

                                    <a class="dropdown-item" href="profile.jsp">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        내 정보
                                    </a>

                                    <a class="dropdown-item" href="change-password.jsp">
                                        <i class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i>
                                        비밀번호 변경
                                    </a>

                                    <div class="dropdown-divider"></div>

                                    <a class="dropdown-item" href="#" data-bs-toggle="modal"
                                        data-bs-target="#logoutModal">
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
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="main.jsp"
                                aria-expanded="false">
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
                    </div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item">
                                        <a href="#">홈</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">
                                        유저 정보
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
            <div class="container">

                <div class="page-title">기기 상세 정보</div>

                <!-- 상단 -->
                <div class="top-section">

                    <!-- 회원 정보 -->
                    <div class="card profile-card">
                        <div class="profile-info" style="width:100%;">
                            <div class="card-title">기기 위치</div>

                            <div class="map-box">
                                <img src="assets/images/map.png" alt="지도" />
                            </div>
                        </div>
                    </div>

                    <!-- 활동 정보 -->
                    

                    <div class="card damage-card">
                        <div class="profile-info" style="width:100%;">
                            <div class="card-title">기기 손상도</div>
                            <div class="device-box">
                                <img src="assets/images/kick.png" alt="지도" />
                            </div>
                        </div>
                    </div>
                    <div class="card activity-card">
                        <div class="card-title">기기 상세 정보</div>
                        <p>기기 번호: SC-1001</p>
                        <p>운용 여부: 사용 불가</p>
                        <p>기기 상태: 배터리 부족</p>
                    </div>
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

</html>