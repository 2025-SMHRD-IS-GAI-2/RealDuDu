<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 1. adminjoin.jsp에서 보낸 데이터 받기
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");

    Connection conn = null;
    PreparedStatement ps = null;
    boolean isSuccess = false;

    try {
        String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
        String dbId = "campus_25IS_GA2_p2_4";
        String dbPw = "smhrd4";
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbId, dbPw);

        // 2. 관리자 데이터 삽입 (부서코드 없음)
        String sql = "INSERT INTO TB_ADMIN (ADMIN_ID, ADMIN_PW, ADMIN_NM, REG_DT) VALUES (?, ?, ?, SYSDATE)";
        
        ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, pw);
        ps.setString(3, name);

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
        alert("관리자가 성공적으로 등록되었습니다.");
        location.href = "main.jsp"; 
    <% } else { %>
        alert("등록 실패! 이미 사용 중인 아이디입니다.");
        history.back();
    <% } %>
</script>