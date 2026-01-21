<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    // [Backend] 1. 상태별 개수 세기 & 2. 최근 등록된 5개 가져오기
    
    request.setCharacterEncoding("UTF-8");

    int totalCnt = 0;   
    int activeCnt = 0;  
    int fixCnt = 0;     
    int useCnt = 0;     

    // 최근 기기 담을 리스트
    List<Map<String, String>> recentList = new ArrayList<>();

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
    String dbId = "campus_25IS_GA2_p2_4";
    String dbPw = "smhrd4";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbId, dbPw);

        // --------------------------------------------------------
        // [Query 1] 상태별 통계 (기존 로직)
        // --------------------------------------------------------
        String sql1 = "SELECT KICKBOARD_ST, COUNT(*) AS CNT FROM TB_KICKBOARD GROUP BY KICKBOARD_ST";
        ps = conn.prepareStatement(sql1);
        rs = ps.executeQuery();

        while(rs.next()) {
            String st = rs.getString("KICKBOARD_ST");
            int cnt = rs.getInt("CNT");
            totalCnt += cnt;
            
            if("A".equals(st)) activeCnt = cnt;
            else if("M".equals(st)) fixCnt = cnt;
            else if("O".equals(st)) useCnt = cnt;
        }
        
        // 자원 정리 후 재사용
        rs.close();
        ps.close();

        // --------------------------------------------------------
        // [Query 2] 최근 등록된 기기 5개만 조회 (ROWNUM 사용)
        // --------------------------------------------------------
        String sql2 = "SELECT * FROM ( "
                    + "  SELECT KICKBOARD_ID, MODEL_NM, KICKBOARD_ST, TO_CHAR(REG_DT, 'YYYY-MM-DD') AS R_DT "
                    + "  FROM TB_KICKBOARD ORDER BY REG_DT DESC "
                    + ") WHERE ROWNUM <= 5";

        ps = conn.prepareStatement(sql2);
        rs = ps.executeQuery();

        while(rs.next()) {
            Map<String, String> map = new HashMap<>();
            map.put("id", rs.getString("KICKBOARD_ID"));
            map.put("model", rs.getString("MODEL_NM"));
            map.put("date", rs.getString("R_DT"));
            
            // 상태 한글 변환
            String code = rs.getString("KICKBOARD_ST");
            String statusText = "기타";
            String badge = "bg-secondary";
            
            if("A".equals(code)) { statusText = "운영가능"; badge = "bg-success"; }
            else if("M".equals(code)) { statusText = "점검중"; badge = "bg-danger"; }
            else if("O".equals(code)) { statusText = "사용중"; badge = "bg-primary"; }
            
            map.put("statusText", statusText);
            map.put("badge", badge);

            recentList.add(map);
        }

    } catch(Exception e) {
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
    <title>실시간 기기 현황 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .status-card { cursor: pointer; transition: transform 0.2s; }
        .status-card:hover { transform: translateY(-5px); box-shadow: 0 .5rem 1rem rgba(0,0,0,.15)!important; }
        .icon-circle { width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.5rem; color: white; }
    </style>
</head>
<body class="bg-light">
    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />
        <div class="flex-grow-1 p-4" style="min-height: 100vh;">
            
            <h2 class="mb-4">실시간 기기 현황</h2>
            <p class="text-muted">현재 등록된 모든 킥보드의 상태를 실시간으로 모니터링합니다.</p>

            <div class="row g-4 mb-4">
                <div class="col-md-3">
                    <div class="card status-card border-0 shadow-sm h-100" onclick="location.href='kickboard-list.jsp'">
                        <div class="card-body d-flex align-items-center">
                            <div class="icon-circle bg-dark me-3"><i class="bi bi-hdd-stack"></i></div>
                            <div><h6 class="text-muted mb-1">전체 기기</h6><h3 class="fw-bold mb-0"><%=totalCnt%>대</h3></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card status-card border-0 shadow-sm h-100" onclick="location.href='kickboard-list.jsp?filter=A'">
                        <div class="card-body d-flex align-items-center">
                            <div class="icon-circle bg-success me-3"><i class="bi bi-check-lg"></i></div>
                            <div><h6 class="text-muted mb-1">운영 가능</h6><h3 class="fw-bold text-success mb-0"><%=activeCnt%>대</h3></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card status-card border-0 shadow-sm h-100" onclick="location.href='kickboard-list.jsp?filter=O'">
                        <div class="card-body d-flex align-items-center">
                            <div class="icon-circle bg-primary me-3"><i class="bi bi-person-bounding-box"></i></div>
                            <div><h6 class="text-muted mb-1">현재 사용 중</h6><h3 class="fw-bold text-primary mb-0"><%=useCnt%>대</h3></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card status-card border-0 shadow-sm h-100" onclick="location.href='kickboard-list.jsp?filter=M'">
                        <div class="card-body d-flex align-items-center">
                            <div class="icon-circle bg-danger me-3"><i class="bi bi-wrench-adjustable"></i></div>
                            <div><h6 class="text-muted mb-1">점검/수리 필요</h6><h3 class="fw-bold text-danger mb-0"><%=fixCnt%>대</h3></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                    <h6 class="m-0 fw-bold"><i class="bi bi-clock-history"></i> 최근 신규 등록 기기</h6>
                    <a href="kickboard-list.jsp" class="btn btn-sm btn-light">전체보기</a>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0 text-center">
                            <thead class="table-light">
                                <tr>
                                    <th>기기 ID</th>
                                    <th>모델명</th>
                                    <th>등록일</th>
                                    <th>현재 상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if(recentList.isEmpty()) { %>
                                    <tr><td colspan="4" class="py-4 text-muted">최근 등록된 기기가 없습니다.</td></tr>
                                <% } else { 
                                    for(Map<String,String> item : recentList) {
                                %>
                                <tr>
                                    <td class="fw-bold"><%= item.get("id") %></td>
                                    <td><%= item.get("model") %></td>
                                    <td><%= item.get("date") %></td>
                                    <td><span class="badge <%= item.get("badge") %> rounded-pill"><%= item.get("statusText") %></span></td>
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