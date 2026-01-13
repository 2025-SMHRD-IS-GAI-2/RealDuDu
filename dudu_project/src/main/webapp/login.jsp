<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<h2>로그인</h2>

<form action="<%=request.getContextPath()%>/login" method="post">
    아이디 :
    <input type="text" name="userId" required><br>

    비밀번호 :
    <input type="password" name="userPw" required><br>

    <input type="submit" value="로그인">
</form>

<%
    String error = request.getParameter("error");
    if ("fail".equals(error)) {
%>
    <p style="color:red;">아이디 또는 비밀번호가 틀렸습니다.</p>
<%
    }
%>

</body>
</html>