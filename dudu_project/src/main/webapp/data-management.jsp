<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    // [Backend] DB 통계 데이터 조회
    
    int avgScore = 0;        // 평균 안전 점수
    int totalWarnings = 0;   // 누적 경고(미착용) 횟수 (전체 기간)
    int todayWarnings = 0;   // [추가] 오늘 발생한 경고 횟수 (차트용)
    int helmetRate = 0;      // 헬멧 착용률 (%)
    int totalRideCount = 0;  // 총 주행 횟수

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
    String dbId = "campus_25IS_GA2_p2_4";
    String dbPw = "smhrd4";

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbId, dbPw);

        // ---------------------------------------------------
        // [Query 1] 유저 평균 점수
        // ---------------------------------------------------
        String sql1 = "SELECT AVG(SAFETY_SCORE) AS AVG_SCORE FROM TB_USER";
        ps = conn.prepareStatement(sql1);
        rs = ps.executeQuery();
        if (rs.next()) avgScore = (int) Math.round(rs.getDouble("AVG_SCORE"));
        rs.close(); ps.close();

        // ---------------------------------------------------
        // [Query 2] 전체 통계 (누적)
        // ---------------------------------------------------
        String sql2 = "SELECT COUNT(*) AS TOTAL_RIDE, "
                    + "SUM(CASE WHEN NOHELMET_CNT > 0 THEN 1 ELSE 0 END) AS VIOLATION_RIDE "
                    + "FROM TB_RIDE";
        ps = conn.prepareStatement(sql2);
        rs = ps.executeQuery();
        if (rs.next()) {
            int totalRide = rs.getInt("TOTAL_RIDE");
            int violationRide = rs.getInt("VIOLATION_RIDE");
            totalRideCount = totalRide;
            totalWarnings = violationRide; // 여기가 286
            if(totalRide > 0) helmetRate = (int) (((double)(totalRide - violationRide) / totalRide) * 100);
        }
        rs.close(); ps.close();

        // ---------------------------------------------------
        // [Query 3] 오늘 날짜 경고 횟수만 따로 조회 (차트 수정용)
        // ---------------------------------------------------
        String sql3 = "SELECT COUNT(*) AS TODAY_CNT FROM TB_RIDE "
                    + "WHERE NOHELMET_CNT > 0 "
                    + "AND TO_CHAR(START_DT, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD')";
        ps = conn.prepareStatement(sql3);
        rs = ps.executeQuery();
        if (rs.next()) {
            todayWarnings = rs.getInt("TODAY_CNT"); // 오늘은 0 또는 소수
        }

    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs!=null) try{rs.close();}catch(Exception e){}
        if(ps!=null) try{ps.close();}catch(Exception e){}
        if(conn!=null) try{conn.close();}catch(Exception e){}
    }
    
    // [등급 결정 로직]
    String gradeName = "BRONZE";
    String gradeColor = "bg-bronze";
    String gradeIcon = "bi-shield";

    if (avgScore >= 81) { gradeName = "DIAMOND"; gradeColor = "bg-diamond"; gradeIcon = "bi-stars"; }
    else if (avgScore >= 61) { gradeName = "PLATINUM"; gradeColor = "bg-platinum"; gradeIcon = "bi-gem"; }
    else if (avgScore >= 41) { gradeName = "GOLD"; gradeColor = "bg-gold"; gradeIcon = "bi-trophy-fill"; }
    else if (avgScore >= 21) { gradeName = "SILVER"; gradeColor = "bg-silver"; gradeIcon = "bi-shield-check"; }
    else if (avgScore >= 1) { gradeName = "BRONZE"; gradeColor = "bg-bronze"; gradeIcon = "bi-shield"; }
    else { gradeName = "BLACKLIST"; gradeColor = "bg-blacklist"; gradeIcon = "bi-slash-circle"; }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>데이터 통합 관리 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <style>
        .stat-card { transition: transform 0.2s; border: none; box-shadow: 0 0.125rem 0.25rem rgba(0,0,0,0.075); }
        .stat-card:hover { transform: translateY(-3px); }
        .grade-circle { width: 70px; height: 70px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.2rem; font-weight: bold; color: white; margin: 0 auto 10px auto; box-shadow: 0 4px 6px rgba(0,0,0,0.2); }
        .bg-blacklist { background: #212529; }
        .bg-bronze    { background: linear-gradient(45deg, #cd7f32, #dfa579); }
        .bg-silver    { background: linear-gradient(45deg, #c0c0c0, #e0e0e0); }
        .bg-gold      { background: linear-gradient(45deg, #ffd700, #fdb931); }
        .bg-platinum  { background: linear-gradient(45deg, #00ced1, #48d1cc); }
        .bg-diamond   { background: linear-gradient(45deg, #b9f2ff, #0072ff); }
        .chart-container { position: relative; height: 350px; width: 100%; }
    </style>
</head>

<body class="bg-light">
    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />

        <div class="flex-grow-1 p-4" style="min-height: 100vh;">
            <h2 class="mb-4">데이터 통합 관리</h2>

            <div class="card mb-4 border-0 shadow-sm">
                <div class="card-body py-3">
                    <form class="d-flex align-items-center gap-2">
                        <i class="bi bi-calendar-check text-muted me-2"></i>
                        <span class="fw-bold me-2">데이터 기준:</span>
                        <span class="text-primary fw-bold">실시간 DB 데이터 (TB_RIDE)</span>
                    </form>
                </div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-md-3">
                    <div class="card stat-card h-100 text-center py-3">
                        <div class="card-body">
                            <h6 class="text-muted fw-bold mb-3">전체 사용자 평균 등급</h6>
                            <div class="grade-circle <%=gradeColor%>"><i class="bi <%=gradeIcon%>"></i></div>
                            <h3 class="fw-bold mb-1" style="color: #333;"><%=avgScore%>점</h3>
                            <span class="badge rounded-pill <%=gradeColor%>"><%=gradeName%></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card stat-card h-100 text-center py-3">
                        <div class="card-body">
                            <h6 class="text-muted fw-bold mb-3">누적 헬멧 경고</h6>
                            <div class="mb-3 text-danger display-6"><i class="bi bi-exclamation-triangle-fill"></i></div>
                            <h3 class="fw-bold text-danger mb-1"><%=totalWarnings%>회</h3>
                            <small class="text-danger">헬멧 미착용 감지 총합</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card stat-card h-100 text-center py-3">
                        <div class="card-body">
                            <h6 class="text-muted fw-bold mb-3">평균 헬멧 착용률</h6>
                            <div class="mb-3 text-primary display-6"><i class="bi bi-scooter"></i></div>
                            <h3 class="fw-bold text-dark mb-1"><%=helmetRate%>%</h3>
                            <small class="text-success fw-bold">전체 주행 대비 정상 비율</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card stat-card h-100 text-center py-3">
                        <div class="card-body">
                            <h6 class="text-muted fw-bold mb-3">총 이용 횟수</h6>
                            <div class="mb-3 text-success display-6"><i class="bi bi-people-fill"></i></div>
                            <h3 class="fw-bold text-dark mb-1"><%=totalRideCount%>회</h3>
                            <small class="text-muted">서비스 누적 이용 건수</small>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-3 mb-4">
                <div class="col-lg-8">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-header bg-white py-3">
                            <h6 class="m-0 fw-bold"><i class="bi bi-graph-up"></i> 일별 경고 추이 (최근 7일)</h6>
                        </div>
                        <div class="card-body">
                            <div class="chart-container">
                                <canvas id="dailyTrendChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-header bg-white py-3">
                            <h6 class="m-0 fw-bold"><i class="bi bi-pie-chart-fill"></i> 등급 분포</h6>
                        </div>
                        <div class="card-body d-flex align-items-center justify-content-center">
                            <div style="height: 300px; width: 100%;">
                                <canvas id="gradeDistChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        // [수정됨] 차트 데이터: 앞의 숫자들은 예시(Dummy)로 두고, 
        // 마지막 '오늘' 데이터만 DB의 todayWarnings 변수로 교체했습니다.
        const ctxDaily = document.getElementById('dailyTrendChart').getContext('2d');
        new Chart(ctxDaily, {
            type: 'line',
            data: {
                labels: ['D-6', 'D-5', 'D-4', 'D-3', 'D-2', '어제', '오늘'],
                datasets: [{
                    label: '일일 경고 횟수',
                    // 기존: [..., <%=totalWarnings%>] -> 수정: [..., <%=todayWarnings%>]
                    data: [2, 5, 3, 8, 4, 12, <%=todayWarnings%>], 
                    borderColor: '#ff6b6b', backgroundColor: 'rgba(255, 107, 107, 0.1)',
                    fill: true, tension: 0.4
                }]
            },
            options: { responsive: true, maintainAspectRatio: false }
        });

        const ctxGrade = document.getElementById('gradeDistChart').getContext('2d');
        new Chart(ctxGrade, {
            type: 'doughnut',
            data: {
                labels: ['다이아', '플래티넘', '골드', '실버', '브론즈', '블랙'],
                datasets: [{
                    data: [10, 20, 30, 20, 15, 5],
                    backgroundColor: ['#0072ff', '#00ced1', '#ffd700', '#c0c0c0', '#cd7f32', '#212529'],
                    hoverOffset: 4
                }]
            },
            options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { position: 'bottom' } } }
        });
    </script>
</body>
</html>