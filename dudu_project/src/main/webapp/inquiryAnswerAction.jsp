<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // 1. 한글 깨짐 방지
    request.setCharacterEncoding("UTF-8");

    // 2. 폼 데이터 받기 (inquiry-detail.jsp에서 넘어온 값)
    String inquiryId = request.getParameter("inquiryId");         // 문의 번호 (CS_NO)
    String answerContent = request.getParameter("answerContent"); // 답변 내용 (ANSWER_CONT)

    // 3. DB 연결 및 업데이트 준비
    Connection conn = null;
    PreparedStatement pstmt = null;
    boolean isSuccess = false;

    try {
        // ---------------------------------------------------------
        // [DB 연결 정보] (김민하님 계정 정보 적용)
        // ---------------------------------------------------------
        String jdbcUrl = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe";
        String dbId = "campus_25IS_GA2_p2_4"; 
        String dbPw = "smhrd4";
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);

        // 4. SQL 작성 [중요: 실제 DB 테이블명 적용]
        // TB_CS_INQUIRY 테이블의 답변내용(ANSWER_CONT)을 수정하고, 
        // 처리상태(PROC_ST)를 'R'(답변완료)로 변경합니다.
        String sql = "UPDATE TB_CS_INQUIRY SET ANSWER_CONT = ?, PROC_ST = 'R' WHERE CS_NO = ?";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, answerContent); // 첫 번째 ? : 답변 내용
        pstmt.setString(2, inquiryId);     // 두 번째 ? : 문의 번호 (CS_NO)

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
        alert("답변이 성공적으로 등록되었습니다.");
        // 처리가 끝나면 다시 상세 페이지로 이동해서 등록된 답변을 확인합니다.
        location.href = "inquiry-detail.jsp?inquiryId=<%= inquiryId %>"; 
    <% } else { %>
        alert("답변 등록 실패! DB 연결 상태를 확인해주세요.");
        history.back();
    <% } %>
</script>