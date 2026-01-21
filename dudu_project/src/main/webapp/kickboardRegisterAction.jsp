<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 1. 폼 데이터 받기
    String id = request.getParameter("id");
    String model = request.getParameter("model");
    String status = request.getParameter("status");

    Connection conn = null;
    PreparedStatement ps = null;
    boolean isSuccess = false;

    try {
        String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
        String dbId = "campus_25IS_GA2_p2_4";
        String dbPw = "smhrd4";
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbId, dbPw);

        // 2. [SQL] 데이터 삽입 (INSERT)
        // KICKBOARD_ID, MODEL_NM, KICKBOARD_ST, REG_DT
        String sql = "INSERT INTO TB_KICKBOARD (KICKBOARD_ID, MODEL_NM, KICKBOARD_ST, REG_DT) VALUES (?, ?, ?, SYSDATE)";
        
        ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, model);
        ps.setString(3, status);

        int row = ps.executeUpdate();
        if(row > 0) isSuccess = true;

    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(ps!=null) try{ps.close();}catch(Exception e){}
        if(conn!=null) try{conn.close();}catch(Exception e){}
    }
%>
<script>
    <% if(isSuccess) { %>
        alert("신규 기기가 성공적으로 등록되었습니다.");
        location.href = "kickboard-list.jsp"; // 등록 후 목록으로 이동
    <% } else { %>
        alert("등록 실패! 기기 ID가 중복되었거나 DB 오류입니다.");
        history.back();
    <% } %>
</script>