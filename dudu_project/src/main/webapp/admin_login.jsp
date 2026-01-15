<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>

<h2>관리자 로그인</h2>

<form action="<%=request.getContextPath()%>/adminLogin" method="post">
    관리자 ID :
    <input type="text" name="adminId" required><br><br>

    비밀번호 :
    <input type="password" name="adminPw" required><br><br>

    <input type="submit" value="관리자 로그인">
</form>

<%
    if ("fail".equals(request.getParameter("error"))) {
%>
    <p style="color:red;">아이디 또는 비밀번호가 틀렸습니다.</p>
<%
    }
%>

</body>
</html>
