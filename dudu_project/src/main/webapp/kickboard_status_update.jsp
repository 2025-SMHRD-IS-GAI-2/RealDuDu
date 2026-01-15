<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>킥보드 상태 변경</title>
</head>
<body>

<h2>킥보드 상태 변경</h2>

<form action="<%=request.getContextPath()%>/kickboardStatusUpdate" method="post">

    킥보드 ID :
    <input type="text" name="kickboardId" required><br><br>

    상태 :
    <select name="kickboardSt" required>
        <option value="O">운영중</option>
        <option value="M">정비중</option>
        <option value="A">대기중</option>
    </select><br><br>

    <input type="submit" value="상태 변경">

</form>

</body>
</html>
