<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // 1. 한글 깨짐 방지
    request.setCharacterEncoding("UTF-8");

    // 2. 폼 데이터 받기 
    // [중요] inquiry-detail.jsp의 <input name="...">과 똑같아야 함!
    String id = request.getParameter("id");      // 수정할 글 번호 (CS_NO)
    String answer = request.getParameter("answer"); // 답변 내용 (ANSWER_CONT)

    // 3. DB 연결 및 업데이트 준비
    Connection conn = null;
    PreparedStatement pstmt = null;
    boolean isSuccess = false;

    try {
        // [DB 연결 정보]
        String jdbcUrl = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
        String dbId = "campus_25IS_GA2_p2_4"; 
        String dbPw = "smhrd4";
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);

        // 4. SQL 작성
        // PROC_ST = 'R' (Reply/Resolved)로 변경
        String sql = "UPDATE TB_CS_INQUIRY SET ANSWER_CONT = ?, PROC_ST = 'R' WHERE CS_NO = ?";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, answer); 
        pstmt.setInt(2, Integer.parseInt(id)); 

        // 5. 실행
        int result = pstmt.executeUpdate();
        if (result > 0) {
            isSuccess = true;
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>

<script>
    <% if (isSuccess) { %>
        alert("답변 등록 및 처리가 완료되었습니다.");
        // [수정] 처리가 끝나면 '목록(service-center.jsp)'으로 가는 게 관리하기 더 편합니다.
        location.href = "service-center.jsp"; 
    <% } else { %>
        alert("등록 실패! 관리자에게 문의하세요.");
        history.back();
    <% } %>
</script>