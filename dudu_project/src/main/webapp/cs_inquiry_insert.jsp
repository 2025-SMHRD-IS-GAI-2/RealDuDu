<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의</title>
</head>
<body>

<h2>고객센터 문의</h2>

<form action="<%=request.getContextPath()%>/csInquiryInsert" method="post">

    사용자 ID<br>
    <input type="text" name="userId" required><br><br>

    문의 제목<br>
    <input type="text" name="csTitle" required><br><br>

    문의 유형<br>
    <select name="csType" required>
        <option value="제보">제보</option>
        <option value="기기결함">기기결함</option>
        <option value="기타">기타</option>
    </select><br><br>

    문의 내용<br>
    <textarea name="csCont" rows="5" cols="40" required></textarea><br><br>

    <input type="submit" value="문의 등록">

</form>

</body>
</html>
