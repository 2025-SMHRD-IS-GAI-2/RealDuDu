<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    Object loginUser = session.getAttribute("loginUser");
    if (loginUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

<h2>로그인 성공 🎉</h2>

<p>
    세션 정보 확인:<br>
    <%= loginUser %>
</p>

<a href="login.jsp">로그인 페이지</a>

</body>
</html>