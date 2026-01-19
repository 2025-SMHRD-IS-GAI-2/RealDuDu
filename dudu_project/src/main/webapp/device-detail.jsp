<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // URL 파라미터로 넘어온 ID 받기 (없으면 기본값)
    String devId = request.getParameter("id");
    if(devId == null) devId = "SC-1001";
%>
<!DOCTYPE html>
<html dir="ltr" lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
    </style>
</head>

<body>
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
                </div>
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
                    <ul class="navbar-nav float-start me-auto"></ul>
                    <ul class="navbar-nav float-end">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="assets/images/Ellipse 2.png" class="rounded-circle" style="width:30px;height:30px;">
                            </a>
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="profile.jsp"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보</a>
                                <a class="dropdown-item" href="change-password.jsp"><i class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i> 비밀번호 변경</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃</a>
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
                        <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="main.jsp" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">대시보드</span></a></li>
                        
                        <li class="sidebar-item">
                            <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-account-settings"></i><span class="hide-menu">관리자 관리</span></a>
                            <ul aria-expanded="false" class="collapse first-level">
                                <li class="sidebar-item"><a href="admin-login.jsp" class="sidebar-link"><i class="mdi mdi-login"></i><span class="hide-menu">관리자 로그인</span></a></li>
                                <li class="sidebar-item"><a href="admin-join.jsp" class="sidebar-link"><i class="mdi mdi-account-plus"></i><span class="hide-menu">관리자 등록</span></a></li>
                                <li class="sidebar-item"><a href="change-password.jsp" class="sidebar-link"><i class="mdi mdi-key-change"></i><span class="hide-menu">비밀번호 변경</span></a></li>
                            </ul>
                        </li>
                        
                        <li class="sidebar-item selected">
                            <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-scooter"></i><span class="hide-menu">킥보드 관리</span></a>
                            <ul aria-expanded="false" class="collapse first-level in">
                                <li class="sidebar-item"><a href="kickboard-list.jsp" class="sidebar-link"><i class="mdi mdi-format-list-bulleted"></i><span class="hide-menu">킥보드 목록</span></a></li>
                                <li class="sidebar-item"><a href="kickboard-register.jsp" class="sidebar-link"><i class="mdi mdi-plus-circle"></i><span class="hide-menu">킥보드 등록</span></a></li>
                                <li class="sidebar-item"><a href="kickboard-status.jsp" class="sidebar-link"><i class="mdi mdi-information"></i><span class="hide-menu">킥보드 상태</span></a></li>
                                <li class="sidebar-item active"><a href="device-status.jsp" class="sidebar-link active"><i class="mdi mdi-account-network"></i><span class="hide-menu">기기 현황</span></a></li>
                                <li class="sidebar-item"><a href="ride-log-list.jsp" class="sidebar-link"><i class="mdi mdi-history"></i><span class="hide-menu">주행 기록</span></a></li>
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
                        
                        <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="data-management.jsp" aria-expanded="false"><i class="mdi mdi-border-none"></i><span class="hide-menu">데이터 관리</span></a></li>
                    </ul>
                </nav>
            </div>
        </aside>

        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center"><h4 class="page-title">기기 상세 정보</h4></div>
                    <div class="col-7 align-self-center">
                        <div class="d-flex align-items-center justify-content-end">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                                    <li class="breadcrumb-item"><a href="device-status.jsp">기기현황</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">상세 정보</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>

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
            
            <footer class="footer text-center">All Rights Reserved by Nice admin. Designed and Developed by WrapPixel.</footer>
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