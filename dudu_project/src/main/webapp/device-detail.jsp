<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< Updated upstream
=======
<%
    // URL 파라미터로 넘어온 ID 받기 (없으면 기본값)
    String devId = request.getParameter("id");
    if(devId == null) devId = "SC-1001";
%>
>>>>>>> Stashed changes
<!DOCTYPE html>
<html dir="ltr" lang="en">

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
=======
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>기기 상세 정보 - 두두 DuDu</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin-lite/" />
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
    <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
    <link href="css/style.min.css" rel="stylesheet" />
    
    <style>
        .container { max-width: 1400px; margin: 0 auto; padding: 20px; }
        .card { box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .card-title { font-weight: 600; color: #3e5569; margin-bottom: 15px; }
        .top-section { display: flex; gap: 20px; flex-wrap: wrap; }
        .profile-card, .damage-card { flex: 1; min-width: 300px; }
        .activity-card { flex: 0.8; min-width: 250px; }
        .map-box, .device-box { width: 100%; height: 400px; border-radius: 8px; overflow: hidden; border: 1px solid #e0e0e0; background-color: #f8f9fa; display: flex; align-items: center; justify-content: center; }
        .map-box img, .device-box img { width: 100%; height: 100%; object-fit: cover; }
        .activity-card p { margin: 10px 0; padding-bottom: 10px; border-bottom: 1px solid #eee; }
>>>>>>> Stashed changes
    </style>
</head>

<body>
<<<<<<< Updated upstream
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
=======
    <div class="preloader">
        <div class="lds-ripple"><div class="lds-pos"></div><div class="lds-pos"></div></div>
    </div>

    <div id="main-wrapper" data-navbarbg="skin6" data-theme="light" data-layout="vertical" data-sidebartype="full" data-boxed-layout="full">
        
        <header class="topbar" data-navbarbg="skin6">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <div class="navbar-header" data-logobg="skin5">
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    <div class="navbar-brand">
                        <a href="main.jsp" class="logo">
                            <b class="logo-icon"><img src="assets/images/DuDu_LOGO.jpg" alt="homepage" class="light-logo" /></b>
                            <span class="logo-text"><img src="assets/images/DuDu_LOGOtext.png" class="light-logo" alt="homepage" /></span>
                        </a>
                    </div>
>>>>>>> Stashed changes
                </div>
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
                    <ul class="navbar-nav float-start me-auto"></ul>
                    <ul class="navbar-nav float-end">
                        <li class="nav-item dropdown">
<<<<<<< Updated upstream
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
=======
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="assets/images/Ellipse 2.png" class="rounded-circle" style="width:30px;height:30px;">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="profile.jsp">내 정보</a>
                                <a class="dropdown-item" href="change-password.jsp">비밀번호 변경</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal">로그아웃</a>
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
=======

        <aside class="left-sidebar" data-sidebarbg="skin5">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="main.jsp" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">대시보드</span></a></li>
                        <li class="sidebar-item">
                            <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-account-settings"></i><span class="hide-menu">관리자 관리</span></a>
                            <ul aria-expanded="false" class="collapse first-level">
                                <li class="sidebar-item"><a href="admin-login.jsp" class="sidebar-link"><i class="mdi mdi-login"></i><span class="hide-menu">관리자 로그인</span></a></li>
                                <li class="sidebar-item"><a href="admin-join.jsp" class="sidebar-link"><i class="mdi mdi-account-plus"></i><span class="hide-menu">관리자 등록</span></a></li>
                                <li class="sidebar-item"><a href="change-password.jsp" class="sidebar-link"><i class="mdi mdi-key-change"></i><span class="hide-menu">비밀번호 변경</span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-scooter"></i><span class="hide-menu">킥보드 관리</span></a>
                            <ul aria-expanded="false" class="collapse first-level">
                                <li class="sidebar-item"><a href="kickboard-list.jsp" class="sidebar-link"><i class="mdi mdi-format-list-bulleted"></i><span class="hide-menu">킥보드 목록</span></a></li>
                                <li class="sidebar-item"><a href="kickboard-register.jsp" class="sidebar-link"><i class="mdi mdi-plus-circle"></i><span class="hide-menu">킥보드 등록</span></a></li>
                                <li class="sidebar-item"><a href="kickboard-status.jsp" class="sidebar-link"><i class="mdi mdi-information"></i><span class="hide-menu">킥보드 상태</span></a></li>
                            </ul>
                        </li>
                        <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="user-status.jsp" aria-expanded="false"><i class="mdi mdi-account-group"></i><span class="hide-menu">사용자 관리</span></a></li>
                        <li class="sidebar-item">
                            <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-headset"></i><span class="hide-menu">고객센터</span></a>
                            <ul aria-expanded="false" class="collapse first-level">
                                <li class="sidebar-item"><a href="service-center.jsp" class="sidebar-link"><i class="mdi mdi-email"></i><span class="hide-menu">문의 목록</span></a></li>
                                <li class="sidebar-item"><a href="inquiry-history.jsp" class="sidebar-link"><i class="mdi mdi-history"></i><span class="hide-menu">처리 이력</span></a></li>
                            </ul>
                        </li>
                        
                        <li class="sidebar-item selected">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link active" href="device-status.jsp" aria-expanded="false"><i class="mdi mdi-account-network"></i><span class="hide-menu">기기현황</span></a>
                        </li>
                        
                        <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="data-management.jsp" aria-expanded="false"><i class="mdi mdi-border-none"></i><span class="hide-menu">데이터 관리</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>

        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center"><h4 class="page-title">기기 상세 정보</h4></div>
>>>>>>> Stashed changes
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
                                    <li class="breadcrumb-item"><a href="device-status.jsp">기기현황</a></li>
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

=======

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="top-section">
                            <div class="card profile-card">
                                <div class="profile-info" style="width:100%;">
                                    <div class="card-title">기기 위치</div>
                                    <div class="map-box">
                                        <img src="assets/images/map.png" alt="지도" onerror="this.src='https://via.placeholder.com/600x400?text=No+Map+Image'"/>
                                    </div>
                                </div>
                            </div>

                            <div class="card damage-card">
                                <div class="profile-info" style="width:100%;">
                                    <div class="card-title">기기 손상도</div>
                                    <div class="device-box">
                                        <img src="assets/images/kick.png" alt="기기 사진" onerror="this.src='https://via.placeholder.com/600x400?text=No+Device+Image'"/>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="card activity-card">
                                <div class="card-title">기기 상세 정보</div>
                                <div class="p-2">
                                    <p><strong>기기 번호:</strong> <%= devId %></p>
                                    <p><strong>운용 여부:</strong> <span class="badge bg-danger">사용 불가</span></p>
                                    <p><strong>기기 상태:</strong> <span class="text-warning fw-bold">배터리 부족</span></p>
                                    <p><strong>배터리 잔량:</strong> 15%</p>
                                    <p><strong>마지막 점검:</strong> 2026.01.10</p>
                                    
                                    <div class="mt-4 text-end">
                                        <a href="device-status.jsp" class="btn btn-sm btn-outline-secondary">목록으로</a>
                                        <button class="btn btn-sm btn-primary">점검 완료 처리</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <footer class="footer text-center">All Rights Reserved by Nice admin.</footer>
        </div>
    </div>

    <div class="modal fade" id="logoutModal" tabindex="-1"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><h5 class="modal-title">로그아웃 하시겠습니까?</h5><button class="btn-close" data-bs-dismiss="modal"></button></div><div class="modal-footer"><button class="btn btn-secondary" data-bs-dismiss="modal">취소</button><a class="btn btn-primary" href="login.jsp">로그아웃</a></div></div></div></div>

    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/extra-libs/sparkline/sparkline.js"></script>
    <script src="js/waves.js"></script>
    <script src="js/sidebarmenu.js"></script>
    <script src="js/custom.min.js"></script>
</body>
>>>>>>> Stashed changes
</html>