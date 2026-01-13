<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<h2>회원가입</h2>

<form action="<%=request.getContextPath()%>/join" method="post">

    아이디 : <input type="text" name="userId" required><br><br>
    비밀번호 : <input type="password" name="userPw" required><br><br>
    이름 : <input type="text" name="userNm" required><br><br>
    전화번호 : <input type="text" name="userTel"><br><br>

    <input type="submit" value="회원가입">

</form>

</body>
</html>