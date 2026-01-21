<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%
    // =================================================================
    // [Backend] 지자체/관리자용 메인 대시보드 (DB 연동 최종판)
    // =================================================================
    
    String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
    String dbId = "campus_25IS_GA2_p2_4";
    String dbPw = "smhrd4";

    // 데이터 담을 변수
    StringBuilder sbDates = new StringBuilder();   // 날짜 라벨
    StringBuilder sbScores = new StringBuilder();  // 안전점수 추이
    StringBuilder sbWarns = new StringBuilder();   // 경고 발생 추이
    
    StringBuilder sbWorstUsers = new StringBuilder(); // 상습 위반자 ID
    StringBuilder sbWorstCounts = new StringBuilder(); // 위반 횟수

    int totalUserCount = 0; // 총 회원 수
    List<Map<String, String>> recentUserList = new ArrayList<>(); // 하단 테이블 리스트

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbId, dbPw);

        // -----------------------------------------------------------
        // [SQL 1] 메인 차트: 최근 7일간 안전 지표 추이
        // -----------------------------------------------------------
        String sql1 = "SELECT * FROM (" 
                    + "  SELECT TO_CHAR(START_DT, 'MM/DD') AS DT, "
                    + "         ROUND(AVG(SCORE_CG), 1) AS AVG_SCORE, " 
                    + "         SUM(NOHELMET_CNT) AS SUM_WARN "
                    + "  FROM TB_RIDE " 
                    + "  GROUP BY TO_CHAR(START_DT, 'MM/DD') " 
                    + "  ORDER BY MIN(START_DT) DESC " 
                    + ") WHERE ROWNUM <= 7 ORDER BY DT ASC";

        ps = conn.prepareStatement(sql1);
        rs = ps.executeQuery();
        while (rs.next()) {
            if (sbDates.length() > 0) { sbDates.append(","); sbScores.append(","); sbWarns.append(","); }
            sbDates.append("'" + rs.getString("DT") + "'");
            sbScores.append(rs.getDouble("AVG_SCORE")); 
            sbWarns.append(rs.getInt("SUM_WARN"));      
        }
        rs.close(); ps.close();

        // -----------------------------------------------------------
        // [SQL 2] 워스트 유저 Top 5 (상습 헬멧 미착용자)
        // -----------------------------------------------------------
        String sql2 = "SELECT * FROM (" 
                    + "  SELECT USER_ID, SUM(NOHELMET_CNT) AS TOTAL_WARN " 
                    + "  FROM TB_RIDE "
                    + "  GROUP BY USER_ID " 
                    + "  ORDER BY TOTAL_WARN DESC " 
                    + ") WHERE ROWNUM <= 5";

        ps = conn.prepareStatement(sql2);
        rs = ps.executeQuery();
        while (rs.next()) {
            int cnt = rs.getInt("TOTAL_WARN");
            if(cnt > 0) { 
                if (sbWorstUsers.length() > 0) { sbWorstUsers.append(","); sbWorstCounts.append(","); }
                sbWorstUsers.append("'" + rs.getString("USER_ID") + "'");
                sbWorstCounts.append(cnt);
            }
        }
        rs.close(); ps.close();

        // -----------------------------------------------------------
        // [SQL 3] 전체 사용자 수
        // -----------------------------------------------------------
        String sql3 = "SELECT COUNT(*) FROM TB_USER";
        ps = conn.prepareStatement(sql3);
        rs = ps.executeQuery();
        if (rs.next()) totalUserCount = rs.getInt(1);
        rs.close(); ps.close();

        // -----------------------------------------------------------
        // [SQL 4] 최근 가입 사용자 목록
        // -----------------------------------------------------------
        String sql4 = "SELECT * FROM ("
                    + "  SELECT USER_ID, USER_NM, SAFETY_SCORE, SAFETY_GR, TO_CHAR(JOIN_DT, 'YYYY-MM-DD') AS J_DT " 
                    + "  FROM TB_USER "
                    + "  ORDER BY JOIN_DT DESC "
                    + ") WHERE ROWNUM <= 5";

        ps = conn.prepareStatement(sql4);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map<String, String> map = new HashMap<>();
            map.put("name", rs.getString("USER_NM"));
            map.put("id", rs.getString("USER_ID"));
            map.put("date", rs.getString("J_DT"));
            map.put("score", rs.getString("SAFETY_SCORE"));
            
            String grade = rs.getString("SAFETY_GR"); 
            if(grade == null) grade = "-";
            map.put("grade", grade);

            String badge = "bg-secondary";

            if ("DIAMOND".equals(grade)) badge = "bg-primary";
            else if ("PLATINUM".equals(grade)) badge = "bg-info text-dark";
            else if ("GOLD".equals(grade)) badge = "bg-warning text-dark";
            else if ("BLACKLIST".equals(grade) || "Y".equals(rs.getString("SAFETY_GR"))) badge = "bg-dark";
            else if ("1".equals(grade)) badge = "bg-success";

            map.put("badge", badge);

            recentUserList.add(map);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if(rs!=null) try{rs.close();}catch(Exception e){}
        if(ps!=null) try{ps.close();}catch(Exception e){}
        if(conn!=null) try{conn.close();}catch(Exception e){}
    }

    String chDates = (sbDates.length() == 0) ? "'데이터없음'" : sbDates.toString();
    String chScores = (sbScores.length() == 0) ? "0" : sbScores.toString();
    String chWarns = (sbWarns.length() == 0) ? "0" : sbWarns.toString();
    
    String chWorstUsers = (sbWorstUsers.length() == 0) ? "'위반없음'" : sbWorstUsers.toString();
    String chWorstCounts = (sbWorstCounts.length() == 0) ? "0" : sbWorstCounts.toString();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>DUDU 안전 관제 시스템</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font/css/materialdesignicons.min.css">
    
    <style>
        tbody tr:hover { background-color: #f8f9fa; cursor: pointer; }
        .card-title { font-weight: bold; }
    </style>
</head>

<body class="bg-light">

    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />

        <div class="flex-grow-1 p-4" style="min-height: 100vh;">
            
            <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
                <div>
                    <h2 class="fw-bold"><i class="bi bi-shield-check text-success"></i> 안전 관제 대시보드</h2>
                    <p class="text-muted mb-0">우리 지역 전동 킥보드 안전 현황을 실시간으로 모니터링합니다.</p>
                </div>
                <div class="text-muted small">
                    <i class="bi bi-clock"></i> Update: <%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date()) %>
                </div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-6 col-md-3">
                    <div class="card text-white bg-primary h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="mdi mdi-scooter fs-1"></i>
                            <h5 class="card-title mt-2">킥보드 기기 관리</h5>
                            <p class="card-text small opacity-75">기기 상태 및 점검</p>
                            <a href="kickboard-list.jsp" class="btn btn-sm btn-light text-primary fw-bold w-100">바로가기</a>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card text-white bg-success h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="mdi mdi-headset fs-1"></i>
                            <h5 class="card-title mt-2">민원/문의 관리</h5>
                            <p class="card-text small opacity-75">사용자 불편 접수 현황</p>
                            <a href="service-center.jsp" class="btn btn-sm btn-light text-success fw-bold w-100">바로가기</a>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card text-dark bg-warning h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="mdi mdi-account-group fs-1"></i>
                            <h5 class="card-title mt-2">회원 관리</h5>
                            <p class="card-text small opacity-75">안전 점수 및 제재</p>
                            <a href="user-status.jsp" class="btn btn-sm btn-light text-warning fw-bold w-100">바로가기</a>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-3">
                    <div class="card text-white bg-dark h-100 shadow-sm border-0">
                        <div class="card-body text-center">
                            <i class="mdi mdi-account-key fs-1"></i>
                            <h5 class="card-title mt-2">관리자 설정</h5>
                            <p class="card-text small opacity-75">계정 및 보안 설정</p>
                            <a href="#" class="btn btn-sm btn-secondary fw-bold w-100">설정하기</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mb-4">
                <div class="col-md-8">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-body">
                            <h5 class="card-title text-secondary">📉 일별 안전점수 변동 & 경고 발생 추이</h5>
                            <p class="text-muted small">최근 7일간의 주행 데이터를 분석한 결과입니다.</p>
                            <div style="height: 300px;">
                                <canvas id="mainTrendChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card mb-3 shadow-sm border-0">
                        <div class="card-body">
                            <h5 class="card-title text-danger">🚨 상습 안전수칙 위반 (Top 5)</h5>
                            <div style="height: 180px;">
                                <canvas id="worstUserChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="card shadow-sm border-0">
                        <div class="card-body text-center py-4">
                            <h5 class="card-title text-muted">등록된 사용자 수</h5>
                            <h2 class="display-4 fw-bold text-primary">
                                <%= String.format("%,d", totalUserCount) %><span class="fs-4 text-muted">명</span>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white py-3">
                    <h5 class="mb-0 fw-bold"><i class="bi bi-person-plus"></i> 최근 가입 사용자 목록</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th class="ps-4">이름 (ID)</th>
                                    <th>안전 등급</th>
                                    <th>가입일</th>
                                    <th>현재 안전 점수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (recentUserList.isEmpty()) { %>
                                    <tr><td colspan="4" class="text-center py-3">데이터가 없습니다.</td></tr>
                                <% } else { 
                                     for (Map<String, String> u : recentUserList) { 
                                %>
                                    <tr>
                                        <td class="ps-4">
                                            <span class="fw-bold"><%=u.get("name")%></span> 
                                            <span class="text-muted small">(<%=u.get("id")%>)</span>
                                        </td>
                                        <td>
                                            <span class="badge rounded-pill <%=u.get("badge")%>"><%=u.get("grade")%></span>
                                        </td>
                                        <td><%=u.get("date")%></td>
                                        <td class="text-success fw-bold"><%=u.get("score")%>점</td>
                                    </tr>
                                <%   } 
                                   } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div> 
    </div> 
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        // 1. 메인 라인 차트
        const ctxMain = document.getElementById('mainTrendChart').getContext('2d');
        new Chart(ctxMain, {
            type: 'line',
            data: {
                labels: [<%= chDates %>], 
                datasets: [{
                    label: '평균 점수 변동',
                    data: [<%= chScores %>],
                    borderColor: '#2962FF', tension: 0.4,
                    yAxisID: 'y'
                }, {
                    label: '경고 발생 건수',
                    data: [<%= chWarns %>],
                    borderColor: '#dc3545', 
                    backgroundColor: 'rgba(220, 53, 69, 0.1)', 
                    fill: true, tension: 0.4,
                    yAxisID: 'y1'
                }]
            },
            options: {
                responsive: true, maintainAspectRatio: false,
                scales: {
                    y: { position: 'left', title: {display: true, text: '점수 변동(점)'} },
                    y1: { position: 'right', min: 0, grid: {drawOnChartArea: false}, title: {display: true, text: '위반 건수(회)'} }
                }
            }
        });

        // 2. 워스트 유저 바 차트
        const ctxWorst = document.getElementById('worstUserChart').getContext('2d');
        new Chart(ctxWorst, {
            type: 'bar',
            data: {
                labels: [<%= chWorstUsers %>],
                datasets: [{
                    label: '위반 횟수',
                    data: [<%= chWorstCounts %>],
                    backgroundColor: '#dc3545', borderRadius: 4
                }]
            },
            options: {
                responsive: true, maintainAspectRatio: false,
                indexAxis: 'y', // 가로 막대
                plugins: { legend: { display: false } }
            }
        });
    </script>
</body>
</html>