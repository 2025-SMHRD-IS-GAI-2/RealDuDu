<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id"); // URL로 넘어온 킥보드 ID

    // DB 연결 변수
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String model = "";
    String status = "";
    String regDate = "";

    try {
        String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
        String dbId = "campus_25IS_GA2_p2_4";
        String dbPw = "smhrd4";
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbId, dbPw);

        // [SQL] 특정 킥보드 정보 조회
        String sql = "SELECT MODEL_NM, KICKBOARD_ST, TO_CHAR(REG_DT, 'YYYY-MM-DD') AS R_DT FROM TB_KICKBOARD WHERE KICKBOARD_ID = ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        rs = ps.executeQuery();

        if(rs.next()) {
            model = rs.getString("MODEL_NM");
            status = rs.getString("KICKBOARD_ST"); // A, M, O 등 코드값
            regDate = rs.getString("R_DT");
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
    <title>기기 상세 관리 - 두두 Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="d-flex">
        <jsp:include page="adminSidebar.jsp" />
        <div class="flex-grow-1 p-4" style="min-height: 100vh;">
            
            <h2 class="mb-4">기기 상세 정보</h2>

            <div class="card shadow-sm border-0" style="max-width: 600px;">
                <div class="card-header bg-white fw-bold">기기 정보 수정</div>
                <div class="card-body p-4">
                    
                    <form action="kickboardUpdateAction.jsp" method="post">
                        
                        <div class="mb-3">
                            <label class="form-label fw-bold">기기 ID</label>
                            <input type="text" class="form-control bg-light" name="id" value="<%=id%>" readonly>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">모델명</label>
                            <input type="text" class="form-control" name="model" value="<%=model%>" readonly>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">등록일</label>
                            <input type="text" class="form-control" value="<%=regDate%>" readonly>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold">현재 상태</label>
                            <select class="form-select" name="status">
                                <option value="A" <%="A".equals(status)?"selected":""%>>운영가능 (A)</option>
                                <option value="M" <%="M".equals(status)?"selected":""%>>점검중 (M)</option>
                                <option value="O" <%="O".equals(status)?"selected":""%>>사용중 (O)</option>
                            </select>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="kickboard-list.jsp" class="btn btn-secondary">취소 (목록으로)</a>
                            <button type="submit" class="btn btn-primary">변경사항 저장</button>
                        </div>
                    </form>

                </div>
            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>