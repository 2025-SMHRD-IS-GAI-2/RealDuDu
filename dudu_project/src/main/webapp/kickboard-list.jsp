<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    // [1] 파라미터 받기 (필터 및 페이지)
    String filter = request.getParameter("filter");
    String pageParam = request.getParameter("page");
    
    // 화면에 보여줄 제목 정하기
    String pageTitle = "전체 기기 목록";
    if("A".equals(filter)) pageTitle = "운영 가능 기기";
    else if("M".equals(filter)) pageTitle = "점검/수리 기기";
    else if("O".equals(filter)) pageTitle = "사용 중인 기기";

    String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
    String dbId = "campus_25IS_GA2_p2_4";
    String dbPw = "smhrd4";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    // 전체 데이터를 담을 리스트
    List<Map<String, String>> kickList = new ArrayList<>();

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbId, dbPw);

        // [SQL] 동적 쿼리 작성 (필터가 있으면 WHERE절 추가)
        String sql = "SELECT KICKBOARD_ID, MODEL_NM, KICKBOARD_ST, TO_CHAR(REG_DT, 'YYYY-MM-DD') AS R_DT FROM TB_KICKBOARD ";
        
        if(filter != null && !filter.isEmpty()) {
            sql += " WHERE KICKBOARD_ST = ? ";
        }
        
        sql += " ORDER BY REG_DT DESC";
        
        ps = conn.prepareStatement(sql);
        
        if(filter != null && !filter.isEmpty()) {
            ps.setString(1, filter);
        }
        
        rs = ps.executeQuery();

        while(rs.next()) {
            Map<String, String> map = new HashMap<>();
            
            map.put("id", rs.getString("KICKBOARD_ID"));
            map.put("model", rs.getString("MODEL_NM"));
            map.put("date", rs.getString("R_DT"));

            String code = rs.getString("KICKBOARD_ST");
            String statusText = "기타";
            String badgeClass = "bg-secondary";

            if ("A".equals(code)) {
                statusText = "운영가능";
                badgeClass = "bg-success";
            } else if ("M".equals(code)) {
                statusText = "점검중";
                badgeClass = "bg-danger";
            } else if ("O".equals(code)) {
                statusText = "사용중";
                badgeClass = "bg-primary";
            }

            map.put("statusText", statusText);
            map.put("badge", badgeClass);
            
            kickList.add(map);
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs!=null) try{rs.close();}catch(Exception e){}
        if(ps!=null) try{ps.close();}catch(Exception e){}
        if(conn!=null) try{conn.close();}catch(Exception e){}
    }
    
    // ==========================================
    // [2] 페이징 처리 로직 (Java List 자르기)
    // ==========================================
    
    // 현재 페이지 번호 (기본값 1)
    int currentPage = 1;
    if (pageParam != null && !pageParam.isEmpty()) {
        try {
            currentPage = Integer.parseInt(pageParam);
        } catch(NumberFormatException e) {
            currentPage = 1;
        }
    }

    int pageSize = 10; // 한 페이지당 보여줄 개수
    int totalCount = kickList.size(); // 전체 데이터 개수
    
    // 전체 페이지 수 계산 (예: 21개 데이터 / 10개씩 = 3페이지)
    int totalPages = (int) Math.ceil((double) totalCount / pageSize);
    
    // 페이지 번호 보정 (1보다 작거나 전체페이지보다 크면 조정)
    if (currentPage < 1) currentPage = 1;
    if (currentPage > totalPages && totalPages > 0) currentPage = totalPages;

    // 리스트 자를 시작과 끝 인덱스 계산
    int startIdx = (currentPage - 1) * pageSize;
    int endIdx = Math.min(startIdx + pageSize, totalCount);

    // 현재 페이지에 보여줄 데이터만 currentList에 담기
    List<Map<String, String>> currentList = new ArrayList<>();
    if (totalCount > 0 && startIdx < totalCount) {
        currentList = kickList.subList(startIdx, endIdx);
    }
    
    // 링크 유지용 필터 문자열 처리
    String filterLink = (filter != null) ? "&filter=" + filter : "";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>킥보드 관리 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />
        <div class="flex-grow-1 p-4" style="min-height: 100vh;">
            
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2><%= pageTitle %></h2>
                
                <div>
                    <% if(filter != null) { %>
                        <a href="kickboard-list.jsp" class="btn btn-outline-secondary me-2">전체 목록 보기</a>
                    <% } %>
                    <a href="kickboard-register.jsp" class="btn btn-primary">
                        <i class="bi bi-plus-lg"></i> 신규 기기 등록
                    </a>
                </div>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white py-3">
                    <span class="fw-bold">총 <%= totalCount %>대</span>의 기기가 검색되었습니다.
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0 text-center">
                            <thead class="table-light">
                                <tr>
                                    <th>기기 ID</th>
                                    <th>모델명</th>
                                    <th>상태</th>
                                    <th>등록일</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if(currentList.isEmpty()) { %>
                                    <tr><td colspan="5" class="py-5 text-muted">해당 상태의 기기가 없습니다.</td></tr>
                                <% } else { 
                                    // [중요] 전체 리스트(kickList) 대신 잘라낸 리스트(currentList)를 반복
                                    for(Map<String,String> k : currentList) {
                                %>
                                <tr>
                                    <td class="fw-bold"><%=k.get("id")%></td>
                                    <td><%=k.get("model")%></td>
                                    <td>
                                        <span class="badge <%=k.get("badge")%> rounded-pill">
                                            <%=k.get("statusText")%>
                                        </span>
                                    </td>
                                    <td><%=k.get("date")%></td>
                                    <td>
                                        <a href="kickboard-status.jsp?id=<%=k.get("id")%>" class="btn btn-sm btn-outline-primary">관리</a>
                                    </td>
                                </tr>
                                <% }} %>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="card-footer bg-white d-flex justify-content-center py-3">
                    <nav aria-label="Page navigation">
                        <ul class="pagination mb-0">
                            <li class="page-item <%= (currentPage == 1) ? "disabled" : "" %>">
                                <a class="page-link" href="kickboard-list.jsp?page=<%= currentPage - 1 %><%= filterLink %>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            
                            <% for(int i = 1; i <= totalPages; i++) { %>
                                <li class="page-item <%= (currentPage == i) ? "active" : "" %>">
                                    <a class="page-link" href="kickboard-list.jsp?page=<%= i %><%= filterLink %>"><%= i %></a>
                                </li>
                            <% } %>
                            
                            <li class="page-item <%= (currentPage == totalPages || totalPages == 0) ? "disabled" : "" %>">
                                <a class="page-link" href="kickboard-list.jsp?page=<%= currentPage + 1 %><%= filterLink %>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                </div>
            
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>