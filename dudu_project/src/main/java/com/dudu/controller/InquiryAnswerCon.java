package com.dudu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dudu.model.AdminDAO;

@WebServlet("/InquiryAnswer.do")
public class InquiryAnswerCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        // 1. 파라미터 수집
        String idParam = request.getParameter("id");
        String answer = request.getParameter("answer");

        int id = 0;
        if(idParam != null) id = Integer.parseInt(idParam);

        // 2. DAO 호출
        AdminDAO dao = new AdminDAO();
        int result = dao.updateInquiryAnswer(id, answer);

        // 3. 결과에 따른 페이지 이동
        if (result > 0) {
            // 성공 시 다시 상세 페이지로 돌아가서 완료된 모습을 보여줌
            response.sendRedirect("inquiry-detail.jsp?id=" + id);
        } else {
            // 실패 시 알림
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>alert('답변 등록 실패'); history.back();</script>");
        }
    }
}