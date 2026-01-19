<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // ==========================================================================
    // [1] 파라미터 받기 및 가상 데이터 설정
    // ==========================================================================
    request.setCharacterEncoding("UTF-8");
    
    // URL에서 문의 ID 받기 (없으면 "1"로 기본값)
    String inquiryId = request.getParameter("inquiryId");
    if(inquiryId == null) inquiryId = "1";
    
    // 가상 데이터 변수 선언
    String title = "";
    String writer = "";
    String date = "";
    String type = "";
    String content = "";
    String status = "";
    String statusClass = "";
    String answerContent = ""; // 기존 답변 내용 (있을 경우)
    
    // ID가 짝수면 '답변완료', 홀수면 '미답변'으로 가정 (테스트용 로직)
    int idNum = Integer.parseInt(inquiryId);
    
    title = "킥보드 관련 문의드립니다 " + inquiryId;
    writer = "사용자" + inquiryId;
    date = "2026-01-15";
    type = "이용 문의";
    content = "킥보드 이용 중에 궁금한 점이 있어서 문의드립니다.\n" 
            + "ID: KB-" + String.format("%03d", idNum) + " 이용 시 요금 정책이 어떻게 되나요?\n"
            + "빠른 답변 부탁드립니다.";
            
    if (idNum % 2 == 0) {
        status = "답변완료";
        statusClass = "label-success";
        answerContent = "안녕하세요. 두두(DuDu) 고객센터입니다.\n\n"
                      + "문의주신 요금 정책은 기본료 1000원에 분당 150원이 부과됩니다.\n"
                      + "추가적인 문의사항이 있으시면 언제든 연락주세요.\n\n"
                      + "감사합니다.";
    } else {
        status = "미답변";
        statusClass = "label-danger";
        answerContent = ""; // 답변 없음
    }
%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>문의 상세 - 두두 DuDu</title>
  <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin-lite/" />
  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
  <link href="css/style.min.css" rel="stylesheet" />
  
  <style>
    /* 읽기 전용 텍스트영역 스타일 (회색 배경) */
    textarea[readonly] {
        background-color: #f8f9fa !important;
        cursor: default;
    }
    
    /* 카드 헤더 간격 조정 */
    .card-title {
        margin-bottom: 20px;
        font-weight: bold;
        color: #3e5569;
    }
    
    /* 상세 정보 라벨 강조 */
    .info-label {
        font-weight: 600;
        color: #555;
        width: 100px;
        display: inline-block;
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
              <b class="logo-icon"><img src="assets/images/DuDu_LOGO.jpg" alt="homepage" class="light-logo" /></b>
              <span class="logo-text"><img src="assets/images/DuDu_LOGOtext.png" class="light-logo" alt="homepage" /></span>
            </a>
          </div>
        </div>
        <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin6">
          <ul class="navbar-nav float-start me-auto">
            <li class="nav-item search-box">
              <a class="nav-link waves-effect waves-dark" href="javascript:void(0)">
                <div class="d-flex align-items-center"><i class="mdi mdi-magnify font-20 me-1"></i><div class="ms-1 d-none d-sm-block"><span>Search</span></div></div>
              </a>
              <form class="app-search position-absolute">
                <input type="text" class="form-control" placeholder="Search &amp; enter" />
                <a class="srh-btn"><i class="mdi mdi mdi-close"></i></a>
              </form>
            </li>
          </ul>
          <ul class="navbar-nav float-end">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
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
            <li class="sidebar-item">
              <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false"><i class="mdi mdi-scooter"></i><span class="hide-menu">킥보드 관리</span></a>
              <ul aria-expanded="false" class="collapse first-level">
                <li class="sidebar-item"><a href="kickboard-list.jsp" class="sidebar-link"><i class="mdi mdi-format-list-bulleted"></i><span class="hide-menu">킥보드 목록</span></a></li>
                <li class="sidebar-item"><a href="kickboard-register.jsp" class="sidebar-link"><i class="mdi mdi-plus-circle"></i><span class="hide-menu">킥보드 등록</span></a></li>
                <li class="sidebar-item"><a href="kickboard-status.jsp" class="sidebar-link"><i class="mdi mdi-information"></i><span class="hide-menu">킥보드 상태</span></a></li>
              </ul>
            </li>
            <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="user-status.jsp" aria-expanded="false"><i class="mdi mdi-account-group"></i><span class="hide-menu">사용자 관리</span></a></li>
            
            <li class="sidebar-item selected">
              <a class="sidebar-link has-arrow waves-effect waves-dark active" href="javascript:void(0)" aria-expanded="true"><i class="mdi mdi-headset"></i><span class="hide-menu">고객센터</span></a>
              <ul aria-expanded="true" class="collapse first-level in">
                <li class="sidebar-item active"><a href="service-center.jsp" class="sidebar-link active"><i class="mdi mdi-email"></i><span class="hide-menu">문의 목록</span></a></li>
                <li class="sidebar-item"><a href="inquiry-history.jsp" class="sidebar-link"><i class="mdi mdi-history"></i><span class="hide-menu">처리 이력</span></a></li>
              </ul>
            </li>
            <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="device-status.jsp" aria-expanded="false"><i class="mdi mdi-account-network"></i><span class="hide-menu">기기현황</span></a></li>
            <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="data-management.jsp" aria-expanded="false"><i class="mdi mdi-border-none"></i><span class="hide-menu">데이터 관리</span></a></li>
          </ul>
        </nav>
      </div>
    </aside>

    <div class="page-wrapper">
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-5 align-self-center">
            <h4 class="page-title">문의 상세</h4>
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                  <li class="breadcrumb-item">고객센터</li>
                  <li class="breadcrumb-item active" aria-current="page">문의 상세</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
      
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card shadow-sm">
              <div class="card-body">
                <h4 class="card-title">문의 정보</h4>
                
                <div class="row mb-3">
                  <div class="col-md-6">
                    <p><span class="info-label">제목:</span> <span><%= title %></span></p>
                  </div>
                  <div class="col-md-6">
                    <p><span class="info-label">작성자:</span> <span><%= writer %></span></p>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <div class="col-md-6">
                    <p><span class="info-label">작성일:</span> <span><%= date %></span></p>
                  </div>
                  <div class="col-md-6">
                    <p><span class="info-label">문의 유형:</span> <span><%= type %></span></p>
                  </div>
                </div>
                
                <div class="row mb-3">
                  <div class="col-12">
                    <p class="info-label">문의 내용:</p>
                    <textarea class="form-control" rows="6" readonly><%= content %></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
            <div class="card shadow-sm">
              <div class="card-body">
                <h4 class="card-title">관리자 답변</h4>
                
                <form action="inquiryAnswerAction.jsp" method="post" id="answerForm">
                  <input type="hidden" name="inquiryId" value="<%= inquiryId %>">
                  
                  <div class="row mb-3">
                    <div class="col-12">
                      <label for="answerContent" class="form-label info-label">답변 내용</label>
                      <textarea class="form-control" name="answerContent" id="answerContent" rows="8" placeholder="답변 내용을 입력하세요."><%= answerContent %></textarea>
                    </div>
                  </div>
                  
                  <div class="row mb-3">
                    <div class="col-12">
                      <span class="info-label">상태:</span> 
                      <span class="label <%= statusClass %> label-rounded"><%= status %></span>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-12 d-flex justify-content-end gap-2">
                      <a href="service-center.jsp" class="btn btn-secondary">
                        <i class="mdi mdi-arrow-left"></i> 목록으로
                      </a>
                      
                      <% if("미답변".equals(status)) { %>
                          <button type="submit" class="btn btn-primary">
                            <i class="mdi mdi-send"></i> 답변 등록
                          </button>
                      <% } else { %>
                          <button type="submit" class="btn btn-success">
                            <i class="mdi mdi-pencil"></i> 답변 수정
                          </button>
                      <% } %>
                    </div>
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
</html>