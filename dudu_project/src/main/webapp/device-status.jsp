<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    // ==========================================================================
    // [1] 가상 데이터 생성 (기존 로직 유지)
    // ==========================================================================
    List<Map<String, String>> deviceList = new ArrayList<>();
    String[] locations = {"광주 동구 중앙초등학교", "광주 동구 금남로4가", "광주 동구 예술의 거리", 
                          "조선대학교 정문", "전남대학교 후문", "광주 송정역", "유스퀘어 터미널", 
                          "광주 시청", "김대중 컨벤션센터", "챔피언스 필드"};
    
    int totalCount = 50; 
    int brokenCount = 0;
    int lowBattCount = 0;
    
    for(int i=0; i<10; i++) {
        Map<String, String> dev = new HashMap<>();
        dev.put("id", "SC-10" + String.format("%02d", i));
        dev.put("location", locations[i]);
        
        double rand = Math.random();
        if(rand < 0.3) {
            dev.put("status", "사용 불가");
            dev.put("class", "status-danger");
            dev.put("batt", "0%");
            brokenCount++;
        } else if(rand < 0.6) {
            dev.put("status", "배터리 부족");
            dev.put("class", "status-warning");
            dev.put("batt", (int)(Math.random() * 15) + "%");
            lowBattCount++;
        } else {
            dev.put("status", "센서 오류");
            dev.put("class", "status-danger");
            dev.put("batt", (int)(Math.random() * 80) + "%");
            brokenCount++;
        }
        deviceList.add(dev);
    }
    int normalCount = totalCount - brokenCount - lowBattCount;
%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>기기 현황 - 두두 DuDu</title>
  <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin-lite/" />
  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
  <link href="css/style.min.css" rel="stylesheet" />
  <style>
    .status-danger { color: #dc3545; font-weight: bold; }
    .status-warning { color: #ffc107; font-weight: bold; text-shadow: 0px 0px 1px #999; }
    .table th, .table td { text-align: center; vertical-align: middle; }
    
    /* 행 클릭 시 마우스 커서 변경 및 호버 효과 */
    tbody tr { cursor: pointer; transition: background 0.2s; }
    tbody tr:hover { background-color: #e9ecef !important; }
  </style>
</head>

<body>
  <div class="preloader">
    <div class="lds-ripple">
      <div class="lds-pos"></div>
      <div class="lds-pos"></div>
    </div>
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
            
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="main.jsp" aria-expanded="false">
                <i class="mdi mdi-av-timer"></i>
                <span class="hide-menu">메인</span>
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
                <li class="sidebar-item"><a href="kickboard-list.jsp" class="sidebar-link"><i class="mdi mdi-format-list-bulleted"></i><span class="hide-menu">킥보드 목록</span></a></li>
                <li class="sidebar-item"><a href="kickboard-register.jsp" class="sidebar-link"><i class="mdi mdi-plus-circle"></i><span class="hide-menu">킥보드 등록</span></a></li>
                <li class="sidebar-item"><a href="kickboard-status.jsp" class="sidebar-link"><i class="mdi mdi-information"></i><span class="hide-menu">킥보드 상태</span></a></li>
                
                <li class="sidebar-item active">
                    <a href="device-status.jsp" class="sidebar-link active">
                        <i class="mdi mdi-account-network"></i><span class="hide-menu">기기 현황</span>
                    </a>
                </li>
                
                <li class="sidebar-item">
                    <a href="ride-log-list.jsp" class="sidebar-link">
                        <i class="mdi mdi-history"></i><span class="hide-menu">주행 기록</span>
                    </a>
                </li>
              </ul>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="user-status.jsp" aria-expanded="false">
                <i class="mdi mdi-face"></i>
                <span class="hide-menu">유저 관리</span>
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
                <i class="mdi mdi-border-none"></i>
                <span class="hide-menu">데이터 관리</span>
              </a>
            </li>

          </ul>
        </nav>
      </div>
    </aside>

    <div class="page-wrapper">
      <div class="page-breadcrumb">
        <div class="row">
          <div class="col-5 align-self-center"><h4 class="page-title">기기 현황 대시보드</h4></div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                  <li class="breadcrumb-item">킥보드 관리</li> 
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
                <div class="d-flex align-items-center"><i class="mdi mdi-scooter display-5"></i><div class="ms-auto display-5 fw-bold"><%= totalCount %></div></div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card bg-danger text-white">
              <div class="card-body">
                <h5 class="card-title text-white">사용 불가 (고장)</h5>
                <div class="d-flex align-items-center"><i class="mdi mdi-alert-circle-outline display-5"></i><div class="ms-auto display-5 fw-bold"><%= brokenCount %></div></div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card bg-warning text-white">
              <div class="card-body">
                <h5 class="card-title text-white">배터리 부족</h5>
                <div class="d-flex align-items-center"><i class="mdi mdi-battery-20 display-5"></i><div class="ms-auto display-5 fw-bold"><%= lowBattCount %></div></div>
              </div>
            </div>
          </div>
          <div class="col-md-3">
            <div class="card bg-success text-white">
              <div class="card-body">
                <h5 class="card-title text-white">정상 가동</h5>
                <div class="d-flex align-items-center"><i class="mdi mdi-check-circle-outline display-5"></i><div class="ms-auto display-5 fw-bold"><%= normalCount %></div></div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title">⚠️ 상태 이상 기기 목록</h4>
                <h6 class="card-subtitle">목록을 클릭하면 상세 페이지로 이동합니다.</h6>
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr class="table-active">
                        <th>기기 ID</th>
                        <th>상태</th>
                        <th>배터리</th>
                        <th>현재 위치</th>
                        <th>상세보기</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% for(Map<String, String> dev : deviceList) { %>
                      <tr onclick="location.href='device-detail.jsp?id=<%= dev.get("id") %>'">
                        <td><span class="font-medium"><%= dev.get("id") %></span></td>
                        <td class="<%= dev.get("class") %>"><%= dev.get("status") %></td>
                        <td><%= dev.get("batt") %></td>
                        <td><%= dev.get("location") %></td>
                        <td>
                            <a href="device-detail.jsp?id=<%= dev.get("id") %>" class="btn btn-sm btn-outline-primary">
                                <i class="mdi mdi-arrow-right"></i> 이동
                            </a>
                        </td>
                      </tr>
                      <% } %>
                    </tbody>
                  </table>
                  
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
          </div>
        </div>
      </div>
      
      <footer class="footer text-center">All Rights Reserved by Nice admin. Designed and Developed by WrapPixel.</footer>
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
</html>