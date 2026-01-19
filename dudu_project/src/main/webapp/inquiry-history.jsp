<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    // ==========================================================================
    // [1] 파라미터 및 설정
    // ==========================================================================
    request.setCharacterEncoding("UTF-8");
    
    // 1. 페이지
    String pageParam = request.getParameter("page");
    int currentPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam);
    int pageSize = 10; 
    
    // 2. 필터 (final 선언으로 에러 방지)
    String reqStatus = request.getParameter("status");
    if(reqStatus == null) reqStatus = "all"; 
    final String statusFilter = reqStatus; 
    
    // 3. 정렬 (final 선언으로 에러 방지)
    String reqSort = request.getParameter("sort");
    if(reqSort == null) reqSort = "dateDesc"; 
    final String sortOrder = reqSort;

    // ==========================================================================
    // [2] 가상 데이터 생성 (문의 이력용)
    // ==========================================================================
    List<Map<String, String>> historyList = new ArrayList<>();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    // 35개의 데이터 생성
    for(int i = 1; i <= 35; i++) {
        Map<String, String> map = new HashMap<>();
        map.put("title", "문의 내용입니다 " + i);
        map.put("userId", "user" + String.format("%03d", i));
        
        // 날짜 생성
        Calendar cal = Calendar.getInstance();
        cal.set(2026, Calendar.JANUARY, 1);
        cal.add(Calendar.DAY_OF_MONTH, -i);
        map.put("date", sdf.format(cal.getTime()));
        
        // 상태 및 담당자 로직
        if(i % 3 == 0) {
            map.put("status", "미답변");
            map.put("statusClass", "label-danger");
            map.put("manager", "-"); // 미답변은 담당자 없음
        } else {
            map.put("status", "답변완료");
            map.put("statusClass", "label-success");
            map.put("manager", (i % 2 == 0) ? "김관리" : "이매니저"); // 담당자 랜덤 배정
        }
        historyList.add(map);
    }
    
    // ==========================================================================
    // [3] 필터링 및 정렬
    // ==========================================================================
    List<Map<String, String>> filteredList = new ArrayList<>();
    
    // 1. 필터
    for(Map<String, String> item : historyList) {
        if("all".equals(statusFilter)) {
            filteredList.add(item);
        } else if("pending".equals(statusFilter) && "미답변".equals(item.get("status"))) {
            filteredList.add(item);
        } else if("answered".equals(statusFilter) && "답변완료".equals(item.get("status"))) {
            filteredList.add(item);
        }
    }
    
    // 2. 정렬
    Collections.sort(filteredList, new Comparator<Map<String, String>>() {
        @Override
        public int compare(Map<String, String> o1, Map<String, String> o2) {
            String date1 = o1.get("date");
            String date2 = o2.get("date");
            if("dateAsc".equals(sortOrder)) {
                return date1.compareTo(date2);
            } else {
                return date2.compareTo(date1);
            }
        }
    });
    
    // ==========================================================================
    // [4] 페이징 자르기
    // ==========================================================================
    int totalCount = filteredList.size();
    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
    if (currentPage > totalPages && totalPages > 0) currentPage = totalPages;
    
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
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>문의 처리 이력 - 두두 DuDu</title>
  <link rel="canonical" href="https://www.wrappixel.com/templates/niceadmin-lite/" />
  <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png" />
  <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet" />
  <link href="css/style.min.css" rel="stylesheet" />
  
  <style>
    .card-body {
      display: flex;
      align-items: center;
      justify-content: space-between;
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
    .radio-wrap input { cursor: pointer; }
    .sort-select {
      padding: 5px 10px;
      border: 1px solid #e9ecef;
      border-radius: 4px;
      cursor: pointer;
    }
    tbody tr:hover { background-color: #f8f9fa; cursor: pointer; }
    .page-item.active .page-link {
        background-color: #2962FF;
        border-color: #2962FF;
        color: white;
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
                <li class="sidebar-item"><a href="service-center.jsp" class="sidebar-link"><i class="mdi mdi-email"></i><span class="hide-menu">문의 목록</span></a></li>
                <li class="sidebar-item active"><a href="inquiry-history.jsp" class="sidebar-link active"><i class="mdi mdi-history"></i><span class="hide-menu">처리 이력</span></a></li>
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
            <h4 class="page-title">문의 처리 이력</h4>
          </div>
          <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="main.jsp">홈</a></li>
                  <li class="breadcrumb-item">고객센터</li>
                  <li class="breadcrumb-item active" aria-current="page">처리 이력</li>
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
                <h4 class="card-title mb-0">처리 이력 (총 <%= totalCount %>건)</h4>
                
                <form action="inquiry-history.jsp" method="get" class="filter-form">
                    <label class="radio-wrap">
                        <input type="radio" name="status" value="all" onchange="this.form.submit()" <%= "all".equals(statusFilter) ? "checked" : "" %>>
                        <span>전체</span>
                    </label>

                    <label class="radio-wrap">
                        <input type="radio" name="status" value="pending" onchange="this.form.submit()" <%= "pending".equals(statusFilter) ? "checked" : "" %>>
                        <span>미답변</span>
                    </label>

                    <label class="radio-wrap">
                        <input type="radio" name="status" value="answered" onchange="this.form.submit()" <%= "answered".equals(statusFilter) ? "checked" : "" %>>
                        <span>답변완료</span>
                    </label>
                    
                    <select class="sort-select" name="sort" onchange="this.form.submit()">
                        <option value="dateDesc" <%= "dateDesc".equals(sortOrder) ? "selected" : "" %>>최신순</option>
                        <option value="dateAsc" <%= "dateAsc".equals(sortOrder) ? "selected" : "" %>>오래된순</option>
                    </select>
                </form>
              </div>
              
              <div class="table-responsive">
                <table class="table table-hover align-middle">
                  <thead>
                    <tr>
                      <th class="border-top-0">문의 제목</th>
                      <th class="border-top-0">사용자 ID</th>
                      <th class="border-top-0">상태</th>
                      <th class="border-top-0">처리 담당자</th>
                      <th class="border-top-0">처리일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% for(Map<String, String> item : currentList) { %>
                    <tr>
                      <td><span class="font-medium"><%= item.get("title") %></span></td>
                      <td class="txt-oflo"><%= item.get("userId") %></td>
                      <td>
                        <span class="label <%= item.get("statusClass") %> label-rounded"><%= item.get("status") %></span>
                      </td>
                      <td class="txt-oflo"><%= item.get("manager") %></td>
                      <td class="txt-oflo"><%= item.get("date") %></td>
                    </tr>
                    <% } %>
                    
                    <% if(currentList.isEmpty()) { %>
                        <tr><td colspan="5" class="text-center">조회된 이력이 없습니다.</td></tr>
                    <% } %>
                  </tbody>
                </table>
              </div>
              
              <div class="d-flex justify-content-center mt-4 mb-3">
                <nav aria-label="Page navigation">
                  <ul class="pagination">
                    <li class="page-item <%= (currentPage == 1) ? "disabled" : "" %>">
                      <a class="page-link" href="inquiry-history.jsp?page=<%= currentPage - 1 %>&status=<%= statusFilter %>&sort=<%= sortOrder %>">이전</a>
                    </li>

                    <% for(int i = 1; i <= totalPages; i++) { %>
                        <li class="page-item <%= (currentPage == i) ? "active" : "" %>">
                            <a class="page-link" href="inquiry-history.jsp?page=<%= i %>&status=<%= statusFilter %>&sort=<%= sortOrder %>"><%= i %></a>
                        </li>
                    <% } %>

                    <li class="page-item <%= (currentPage == totalPages) ? "disabled" : "" %>">
                      <a class="page-link" href="inquiry-history.jsp?page=<%= currentPage + 1 %>&status=<%= statusFilter %>&sort=<%= sortOrder %>">다음</a>
                    </li>
                  </ul>
                </nav>
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