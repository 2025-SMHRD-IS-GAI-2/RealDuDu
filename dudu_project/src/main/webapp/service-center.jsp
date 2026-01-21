<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
    // =================================================================
    // [Backend] 오라클 DB에서 TB_CS_INQUIRY 목록 가져오기
    // =================================================================
    
    String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
    String dbId = "campus_25IS_GA2_p2_4";
    String dbPw = "smhrd4";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    List<Map<String, String>> inquiryList = new ArrayList<>();
    int waitingCount = 0; // 답변 대기 건수

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbId, dbPw);

        // [SQL] 최신순 조회 (올려주신 테이블 컬럼명 적용)
        String sql = "SELECT CS_NO, CS_TITLE, USER_ID, TO_CHAR(REG_DT, 'YYYY-MM-DD') AS D, CS_TYPE, ANSWER_CONT "
                   + "FROM TB_CS_INQUIRY "
                   + "ORDER BY REG_DT DESC";

        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            Map<String, String> map = new HashMap<>();
            
            String csNo = rs.getString("CS_NO");
            String answer = rs.getString("ANSWER_CONT");
            
            // [상태 판단 로직]
            // ANSWER_CONT가 비어있으면(null) '대기', 뭐라도 써있으면 '완료'
            String status = (answer == null || answer.trim().isEmpty()) ? "대기" : "완료";
            
            if ("대기".equals(status)) {
                waitingCount++;
            }

            map.put("id", csNo);
            map.put("title", rs.getString("CS_TITLE"));
            map.put("user", rs.getString("USER_ID"));
            map.put("date", rs.getString("D"));
            map.put("cate", rs.getString("CS_TYPE"));
            map.put("status", status);

            inquiryList.add(map);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if(rs!=null) try{rs.close();}catch(Exception e){}
        if(ps!=null) try{ps.close();}catch(Exception e){}
        if(conn!=null) try{conn.close();}catch(Exception e){}
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고객센터 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>

<body class="bg-light">

    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />

        <div class="flex-grow-1 p-4" style="min-height: 100vh;">
            
            <h2 class="mb-4">1:1 문의 관리</h2>

            <div class="row mb-4">
                <div class="col-md-12">
                    <div class="alert alert-warning d-flex align-items-center shadow-sm border-0" role="alert">
                        <i class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2 fs-4"></i>
                        <div>
                            현재 <strong><%= waitingCount %>건</strong>의 답변 대기 중인 문의가 있습니다.
                        </div>
                    </div>
                </div>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white py-3">
                    <h5 class="m-0 fw-bold">문의 접수 현황</h5>
                </div>
                
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0 text-center">
                            <thead class="table-light">
                                <tr>
                                    <th>No.</th>
                                    <th>카테고리</th>
                                    <th class="text-start w-50">제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>상태</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (inquiryList.isEmpty()) { %>
                                    <tr><td colspan="7" class="py-4">데이터가 없습니다.</td></tr>
                                <% } else {
                                    for (Map<String, String> item : inquiryList) {
                                        boolean isDone = "완료".equals(item.get("status"));
                                        String badgeClass = isDone ? "bg-secondary" : "bg-danger";
                                        
                                        // 상세 페이지 링크 (ID값 전달)
                                        String linkUrl = "inquiry-detail.jsp?id=" + item.get("id");
                                        if (isDone) linkUrl += "&readonly=true";
                                %>
                                <tr>
                                    <td><%= item.get("id") %></td>
                                    <td><span class="badge bg-light text-dark border"><%= item.get("cate") %></span></td>
                                    <td class="text-start text-truncate" style="max-width: 300px;">
                                        <%= item.get("title") %>
                                    </td>
                                    <td><%= item.get("user") %></td>
                                    <td><%= item.get("date") %></td>
                                    <td><span class="badge <%= badgeClass %> rounded-pill"><%= item.get("status") %></span></td>
                                    <td>
                                        <a href="<%= linkUrl %>" class="btn btn-sm <%= isDone ? "btn-outline-secondary" : "btn-primary" %>">
                                            <%= isDone ? "상세보기" : "처리하기" %>
                                        </a>
                                    </td>
                                </tr>
                                <% }} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div> 
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>