<%@ page import="com.dudu.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
User user = (User) session.getAttribute("loginUser");

if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>

<h2>회원정보 수정</h2>

<form action="<%=request.getContextPath()%>/userUpdate" method="post">

    <!-- ❗ userId는 화면 입력 금지 -->
    <input type="hidden" name="userId" value="<%= user.getUSER_ID() %>">

    이름 :
    <input type="text" name="userNm"
           value="<%= user.getUSER_NM() %>" required><br><br>

    전화번호 :
    <input type="text" name="userTel"
           value="<%= user.getUSER_TEL() %>"><br><br>

    비밀번호 :
    <input type="password" name="userPw"
           placeholder="변경 시에만 입력"><br><br>

    <input type="submit" value="수정하기">
</form>

</body>
</html>
