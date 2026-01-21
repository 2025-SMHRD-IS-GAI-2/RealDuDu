<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // [Backend] 상세 정보 조회
    String rideId = request.getParameter("id");
    
    // 화면에 보여줄 변수들 초기화
    String userId = "-", kickId = "-", sDate = "-", eDate = "-", status = "-";
    int score = 0, noHelmet = 0;
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
        String dbId = "campus_25IS_GA2_p2_4";
        String dbPw = "smhrd4";
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbId, dbPw);

        // 특정 ID의 주행 기록만 조회
        String sql = "SELECT USER_ID, KICKBOARD_ID, "
                   + "       TO_CHAR(START_DT, 'YYYY-MM-DD HH24:MI:SS') AS S_DT, "
                   + "       TO_CHAR(END_DT, 'YYYY-MM-DD HH24:MI:SS') AS E_DT, "
                   + "       NOHELMET_CNT, SCORE_CG "
                   + "FROM TB_RIDE WHERE RIDE_ID = ?";
        
        ps = conn.prepareStatement(sql);
        ps.setString(1, rideId);
        rs = ps.executeQuery();

        if(rs.next()) {
            userId = rs.getString("USER_ID");
            kickId = rs.getString("KICKBOARD_ID");
            sDate = rs.getString("S_DT");
            eDate = rs.getString("E_DT");
            noHelmet = rs.getInt("NOHELMET_CNT");
            score = rs.getInt("SCORE_CG");
            
            status = (noHelmet > 0) ? "안전 수칙 위반 (헬멧 미착용)" : "정상 주행 완료";
        }
    } catch(Exception e) { e.printStackTrace(); } finally {
        if(rs!=null) try{rs.close();}catch(Exception e){}
        if(ps!=null) try{ps.close();}catch(Exception e){}
        if(conn!=null) try{conn.close();}catch(Exception e){}
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주행 상세 정보 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />
        <div class="flex-grow-1 p-4">
            
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3>📜 주행 상세 기록</h3>
                <a href="ride-log-list.jsp" class="btn btn-secondary">목록으로</a>
            </div>

            <div class="card shadow-sm border-0">
                <div class="card-header bg-white fw-bold">기본 운행 정보</div>
                <div class="card-body">
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label fw-bold">주행 ID</label>
                        <div class="col-sm-10 pt-2"><%= rideId %></div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label fw-bold">사용자 ID</label>
                        <div class="col-sm-10 pt-2"><%= userId %></div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label fw-bold">킥보드 ID</label>
                        <div class="col-sm-10 pt-2"><%= kickId %></div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label fw-bold">운행 시간</label>
                        <div class="col-sm-10 pt-2"><%= sDate %> ~ <%= (eDate!=null)?eDate:"주행중" %></div>
                    </div>
                </div>
            </div>
            
            <div class="card shadow-sm border-0 mt-4">
                <div class="card-header bg-white fw-bold text-danger">안전 분석 결과</div>
                <div class="card-body">
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label fw-bold">위반 사항</label>
                        <div class="col-sm-10 pt-2 text-danger fw-bold"><%= status %></div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label fw-bold">헬멧 미착용 감지</label>
                        <div class="col-sm-10 pt-2"><%= noHelmet %> 회</div>
                    </div>
                    <div class="row mb-3">
                        <label class="col-sm-2 col-form-label fw-bold">안전 점수 변동</label>
                        <div class="col-sm-10 pt-2 fw-bold text-primary"><%= score %> 점</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>
</html>