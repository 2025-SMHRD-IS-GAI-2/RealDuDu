<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<%
    // ==========================================================================
    // [1] 데이터 준비 및 정렬 로직 (DB 연동 시 쿼리로 대체)
    // ==========================================================================
    request.setCharacterEncoding("UTF-8");
    
    // 1. 파라미터 처리
    String pageParam = request.getParameter("page");
    int currentPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam);
    
    String sortParam = request.getParameter("sort");
    if (sortParam == null || sortParam.equals("")) {
        sortParam = "latest"; // 기본값: 최신순
    }

    int pageSize = 10; // 한 페이지에 10개씩 표시
    
    // 2. [가상 데이터 생성]
    List<Map<String, String>> allLogs = new ArrayList<>();
    String[] statuses = {"종료", "진행중", "취소"};
    
    for(int i = 1; i <= 35; i++) { // 데이터 35개 생성
        Map<String, String> log = new HashMap<>();
        log.put("rideId", "RIDE-" + String.format("%03d", i));
        log.put("userId", "user" + String.format("%03d", (i % 10) + 1));
        log.put("kickboardId", "KB-" + String.format("%03d", (i % 5) + 1));
        
        // 날짜 생성 (최신 날짜부터)
        log.put("startTime", "2026.01." + String.format("%02d", (31 - (i % 30))) + " 09:" + String.format("%02d", i));
        
        // 상태 랜덤 배정
        String status = statuses[i % 3];
        log.put("status", status);
        
        if("종료".equals(status)) {
            log.put("endTime", "2026.01." + String.format("%02d", (31 - (i % 30))) + " 10:" + String.format("%02d", i));
            log.put("helmet", (i % 2 == 0) ? "착용" : "미착용");
            log.put("score", (i % 2 == 0) ? "+15" : "-5");
        } else if("진행중".equals(status)) {
            log.put("endTime", "-");
            log.put("helmet", "미착용"); // 가정
            log.put("score", "-");
        } else {
            log.put("endTime", "-");
            log.put("helmet", "미착용");
            log.put("score", "-");
        }
        
        allLogs.add(log);
    }

    // 3. [핵심] 정렬 로직
    if ("score_desc".equals(sortParam)) {
        // 점수 높은순 (문자열 파싱 필요, 단순 예시로 문자열 비교)
        Collections.sort(allLogs, (m1, m2) -> m2.get("score").compareTo(m1.get("score")));
    } else if ("userid".equals(sortParam)) {
        // 유저 ID순
        Collections.sort(allLogs, (m1, m2) -> m1.get("userId").compareTo(m2.get("userId")));
    } else {
        // 최신순 (Ride ID 역순 또는 시간 역순) - 기본값
        Collections.sort(allLogs, (m1, m2) -> m2.get("startTime").compareTo(m1.get("startTime")));
    }

    // 4. 페이징 계산
    int totalCount = allLogs.size();
    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
    int startIdx = (currentPage - 1) * pageSize;
    int endIdx = Math.min(startIdx + pageSize, totalCount);
    
    List<Map<String, String>> currentList = new ArrayList<>();
    if (startIdx < totalCount) {
        currentList = allLogs.subList(startIdx, endIdx);
    }
%>

<!DOCTYPE html>
<html dir="ltr" lang="ko">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>주행 기록 관리 - 두두 DuDu</title>
  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
  <link href="css/style.min.css" rel="stylesheet" />
  <style>
      .page-item.active .page-link {
        background-color: #2962FF;
        border-color: #2962FF;
        color: white;
    }
    .sort-select {
        width: 150px;
        display: inline-block;
        margin-left: auto;
    }
    .card-header-flex {
        display: flex;
        justify-content: space-between;
        align-items: center;
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
                <i class="mdi mdi-av-timer"></i><span class="hide-menu">메인</span>
              </a>
            </li>

            <li class="sidebar-item selected"> <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
			    <i class="mdi mdi-scooter"></i><span class="hide-menu">킥보드 관리</span>
			  </a>
			  <ul aria-expanded="false" class="collapse first-level in">
			    <li class="sidebar-item">
			        <a href="device-status.jsp" class="sidebar-link">
			            <i class="mdi mdi-account-network"></i><span class="hide-menu">기기 현황</span>
			        </a>
			    </li>
			    <li class="sidebar-item active"> <a href="ride-log-list.jsp" class="sidebar-link">
			            <i class="mdi mdi-history"></i><span class="hide-menu">주행 기록</span>
			        </a>
			    </li>
			  </ul>
			</li>

            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="service-center.jsp" aria-expanded="false">
                <i class="mdi mdi-arrange-bring-forward"></i><span class="hide-menu">고객센터</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="data-management.jsp" aria-expanded="false">
                <i class="mdi mdi-border-none"></i><span class="hide-menu">데이터 관리</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link waves-effect waves-dark sidebar-link" href="user-status.jsp" aria-expanded="false">
                <i class="mdi mdi-face"></i><span class="hide-menu">유저 관리</span>
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
            <h4 class="page-title">주행 기록 관리</h4>
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                  <li class="breadcrumb-item">킥보드 관리</li>
                  <li class="breadcrumb-item active" aria-current="page">주행 기록 관리</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
      
      <div class="container-fluid">
        <div class="row mb-3">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <h4 class="card-title mb-3">검색 필터</h4>
                <form action="ride-log-list.jsp" method="GET">
                  <input type="hidden" name="sort" value="<%= sortParam %>">
                  
                  <div class="row">
                    <div class="col-md-3 mb-3">
                      <label for="startDate" class="form-label">시작일</label>
                      <input type="date" class="form-control" id="startDate" name="startDate" value="2026-01-01">
                    </div>
                    <div class="col-md-3 mb-3">
                      <label for="endDate" class="form-label">종료일</label>
                      <input type="date" class="form-control" id="endDate" name="endDate" value="2026-01-31">
                    </div>
                    <div class="col-md-2 mb-3">
                      <label for="userId" class="form-label">사용자 ID</label>
                      <input type="text" class="form-control" id="userId" name="userId" placeholder="사용자 ID">
                    </div>
                    <div class="col-md-2 mb-3">
                      <label for="kickboardId" class="form-label">킥보드 ID</label>
                      <input type="text" class="form-control" id="kickboardId" name="kickboardId" placeholder="킥보드 ID">
                    </div>
                    <div class="col-md-2 mb-3">
                      <label for="rideStatus" class="form-label">주행 상태</label>
                      <select class="form-control" id="rideStatus" name="rideStatus">
                        <option value="all">전체</option>
                        <option value="P">진행중</option>
                        <option value="E">종료</option>
                        <option value="C">취소</option>
                      </select>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-12">
                      <button type="submit" class="btn btn-primary">
                        <i class="mdi mdi-magnify"></i> 검색
                      </button>
                      <button type="button" class="btn btn-secondary" onclick="location.href='ride-log-list.jsp'">
                        <i class="mdi mdi-refresh"></i> 초기화
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body card-header-flex">
                <h4 class="card-title mb-0">주행 기록 목록 (총 <%= totalCount %>건)</h4>
                
                <select class="form-select sort-select" onchange="location.href='ride-log-list.jsp?page=1&sort=' + this.value">
                    <option value="latest" <%= "latest".equals(sortParam) ? "selected" : "" %>>최신순</option>
                    <option value="userid" <%= "userid".equals(sortParam) ? "selected" : "" %>>아이디순</option>
                    <option value="score_desc" <%= "score_desc".equals(sortParam) ? "selected" : "" %>>점수높은순</option>
                </select>
              </div>
              
              <div class="comment-widgets" style="min-height: 400px; height: auto;">
                <div class="table-responsive">
                  <table class="table table-hover align-middle">
                    <thead>
                      <tr>
                        <th class="border-top-0">주행 ID</th>
                        <th class="border-top-0">사용자 ID</th>
                        <th class="border-top-0">킥보드 ID</th>
                        <th class="border-top-0">시작 시간</th>
                        <th class="border-top-0">종료 시간</th>
                        <th class="border-top-0">헬멧 착용</th>
                        <th class="border-top-0">점수 변화</th>
                        <th class="border-top-0">주행 상태</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% for(Map<String, String> log : currentList) { 
                           String status = log.get("status");
                           String statusBadge = "label-secondary";
                           if("종료".equals(status)) statusBadge = "label-success";
                           else if("진행중".equals(status)) statusBadge = "label-warning";
                           else if("취소".equals(status)) statusBadge = "label-danger";
                           
                           String helmetBadge = "label-secondary";
                           if("착용".equals(log.get("helmet"))) helmetBadge = "label-success";
                           else if("미착용".equals(log.get("helmet"))) helmetBadge = "label-danger";
                           
                           String scoreColor = "text-dark";
                           if(log.get("score").startsWith("+")) scoreColor = "text-success";
                           else if(log.get("score").startsWith("-")) scoreColor = "text-danger";
                      %>
                      <tr style="cursor: pointer;" onclick="location.href='ride-log-detail.jsp?rideId=<%= log.get("rideId") %>'">
                        <td><span class="font-medium"><%= log.get("rideId") %></span></td>
                        <td class="txt-oflo"><%= log.get("userId") %></td>
                        <td class="txt-oflo"><%= log.get("kickboardId") %></td>
                        <td class="txt-oflo"><%= log.get("startTime") %></td>
                        <td class="txt-oflo"><%= log.get("endTime") %></td>
                        <td>
                          <span class="label <%= helmetBadge %> label-rounded"><%= log.get("helmet") %></span>
                        </td>
                        <td class="txt-oflo">
                          <span class="<%= scoreColor %>"><%= log.get("score") %></span>
                        </td>
                        <td>
                          <span class="label <%= statusBadge %> label-rounded"><%= status %></span>
                        </td>
                      </tr>
                      <% } %>
                      
                      <% if(currentList.isEmpty()) { %>
                        <tr><td colspan="8" class="text-center p-4">데이터가 없습니다.</td></tr>
                      <% } %>
                    </tbody>
                  </table>
                </div>
              </div>
              
              <div class="d-flex justify-content-center mt-3 mb-3">
                <nav aria-label="Page navigation">
                  <ul class="pagination">
                    <li class="page-item <%= (currentPage == 1) ? "disabled" : "" %>">
                      <a class="page-link" href="ride-log-list.jsp?page=<%= currentPage - 1 %>&sort=<%= sortParam %>">이전</a>
                    </li>

                    <% for(int i = 1; i <= totalPages; i++) { %>
                        <li class="page-item <%= (currentPage == i) ? "active" : "" %>">
                            <a class="page-link" href="ride-log-list.jsp?page=<%= i %>&sort=<%= sortParam %>"><%= i %></a>
                        </li>
                    <% } %>

                    <li class="page-item <%= (currentPage == totalPages) ? "disabled" : "" %>">
                      <a class="page-link" href="ride-log-list.jsp?page=<%= currentPage + 1 %>&sort=<%= sortParam %>">다음</a>
                    </li>
                  </ul>
                </nav>
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