<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>
<body>

<h2>회원가입 성공</h2>

<p>
가입된 아이디 :
<b><%= request.getAttribute("userId") %></b>
</p>

<a href="join.jsp">다시 가입</a>

</body>
</html>