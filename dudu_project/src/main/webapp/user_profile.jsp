<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page import="com.dudu.model.User" %>

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
    <title>회원 정보</title>
</head>
<body>

<h2>회원 정보</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <td><%= user.getUSER_ID() %></td>
    </tr>
    <tr>
        <th>이름</th>
        <td><%= user.getUSER_NM() %></td>
    </tr>
    <tr>
        <th>전화번호</th>
        <td><%= user.getUSER_TEL() %></td>
    </tr>
    <tr>
        <th>안전등급</th>
        <td><%= user.getSAFETY_GR() %></td>
    </tr>
    <tr>
        <th>블랙리스트 여부</th>
        <td><%= user.getBLACK_YN() %></td>
    </tr>
</table>

</body>
</html>

