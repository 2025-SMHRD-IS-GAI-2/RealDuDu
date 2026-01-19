<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // 1. 한글 깨짐 방지
    request.setCharacterEncoding("UTF-8");

    // 2. kickboard-status.jsp에서 보낸 데이터 받기
    String kickboardId = request.getParameter("kickboardId"); // 킥보드 ID (예: KB-001)
    String kickboardSt = request.getParameter("kickboardSt"); // 변경할 상태 (O, M, X)

    // 3. DB 연결 및 업데이트 로직
    Connection conn = null;
    PreparedStatement pstmt = null;

    // 성공 여부 확인용 변수
    boolean isUpdated = false;

    try {
        // =========================================================
        // [수정 완료] 사진에 있는 DB 정보로 교체했습니다.
        // =========================================================
        
        // JDBC URL 형식: jdbc:oracle:thin:@주소:포트:서비스이름(xe)
        String jdbcUrl = "jdbc:oracle:thin:@project-db-campus.smhrd.com:1524:xe"; 
        
        String dbId = "campus_25IS_GA2_p2_4"; // 사진에 있는 USER
        String dbPw = "smhrd4";               // 사진에 있는 PW
        
        // 오라클 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver"); 
        
        // DB 연결 시도
        conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);

        // 4. SQL 쿼리 작성 
        // ★중요★: DB에 실제 테이블 이름이 "KICKBOARD"가 맞는지 확인해야 합니다!
        // 컬럼 이름(STATUS, KICKBOARD_ID)도 실제 DB와 똑같아야 합니다.
        String sql = "UPDATE KICKBOARD SET KICKBOARD_ST = ? WHERE KICKBOARD_ID = ?";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, kickboardSt); // 첫 번째 ? : 변경할 상태 값
        pstmt.setString(2, kickboardId); // 두 번째 ? : 조건(킥보드 ID)

        // 5. 쿼리 실행
        int result = pstmt.executeUpdate();
        
        if (result > 0) {
            isUpdated = true; // 1개 이상의 행이 수정됨 (성공)
        }

    } catch (Exception e) {
        e.printStackTrace(); // 에러 발생 시 콘솔에 로그 출력
    } finally {
        // 자원 해제 (역순)
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>

<script>
    <% if (isUpdated) { %>
        alert("상태가 성공적으로 변경되었습니다.");
        location.href = "kickboard-list.jsp"; // 목록 페이지로 이동
    <% } else { %>
        alert("상태 변경 실패! DB 연결 정보나 테이블 이름을 확인해주세요.");
        history.back(); // 이전 페이지로 돌아가기
    <% } %>
</script>