<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    
    // 1. admin-login.jsp에서 보낸 아이디, 비번 받기
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    boolean isSuccess = false;
    String adminName = "";

    try {
        // 2. DB 연결
        String url = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
        String dbId = "campus_25IS_GA2_p2_4";
        String dbPw = "smhrd4";
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbId, dbPw);

        // 3. 아이디/비번 일치 여부 확인 (TB_ADMIN 테이블)
        String sql = "SELECT ADMIN_NM FROM TB_ADMIN WHERE ADMIN_ID = ? AND ADMIN_PW = ?";
        
        ps = conn.prepareStatement(sql);
        ps.setString(1, id);
        ps.setString(2, pw);
        
        rs = ps.executeQuery();
        
        if(rs.next()) {
            // 로그인 성공
            isSuccess = true;
            adminName = rs.getString("ADMIN_NM");
            
            // [중요] 세션에 로그인 정보 저장 (이제 브라우저가 이 사람을 기억함)
            session.setAttribute("adminId", id);
            session.setAttribute("adminName", adminName);
        }

    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs!=null) try{rs.close();}catch(Exception e){}
        if(ps!=null) try{ps.close();}catch(Exception e){}
        if(conn!=null) try{conn.close();}catch(Exception e){}
    }
%>

<script>
    <% if(isSuccess) { %>
        alert("<%=adminName%>님 환영합니다!");
        location.href = "main.jsp"; // 메인 페이지로 이동
    <% } else { %>
        alert("로그인 실패! 아이디 또는 비밀번호를 확인해주세요.");
        history.back(); // 다시 로그인 화면으로
    <% } %>
</script>