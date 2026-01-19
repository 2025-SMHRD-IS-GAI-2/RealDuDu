<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.dudu.model.CSInquiry" %>
<%@ page import="com.dudu.model.CSInquiryDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의 관리</title>
</head>
<body>

<h2>고객센터 문의 목록 (관리자)</h2>

<%
    CSInquiryDAO dao = new CSInquiryDAO();
    List<CSInquiry> list = dao.selectAll();
%>

<table border="1" cellpadding="5">
    <tr>
        <th>번호</th>
        <th>사용자</th>
        <th>제목</th>
        <th>유형</th>
        <th>내용</th>
        <th>답변</th>
        <th>상태</th>
        <th>처리</th>
    </tr>

<%
    for (CSInquiry cs : list) {
%>
    <tr>
        <td><%= cs.getCsNo() %></td>
        <td><%= cs.getUserId() %></td>
        <td><%= cs.getCsTitle() %></td>
        <td><%= cs.getCsType() %></td>
        <td><%= cs.getCsCont() %></td>
        <td><%= cs.getAnswerCont() == null ? "-" : cs.getAnswerCont() %></td>
        <td><%= cs.getProcSt() %></td>
        <td>
            <form action="<%=request.getContextPath()%>/csInquiryAnswer" method="post">
                <input type="hidden" name="csNo" value="<%= cs.getCsNo() %>">
                <input type="text" name="answerCont" placeholder="답변 입력" required>
                <input type="submit" value="답변">
            </form>
        </td>
    </tr>
<%
    }
%>

</table>

</body>
</html>
