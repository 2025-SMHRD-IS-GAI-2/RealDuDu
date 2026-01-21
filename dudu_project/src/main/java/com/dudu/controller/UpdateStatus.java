package com.dudu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dudu.model.AdminDAO;

@WebServlet("/UpdateStatus.do")
public class UpdateStatus extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 파라미터 수집 (id, status)
        String userId = request.getParameter("id");
        String status = request.getParameter("status");

        // 2. DAO를 통한 DB 업데이트 수행
        AdminDAO dao = new AdminDAO();
        int result = dao.updateBlacklist(userId, status);

        // 3. 결과에 따른 페이지 이동
        if (result > 0) {
            // 성공 시 다시 상세 페이지로 이동 (변경된 상태 확인을 위해)
            response.sendRedirect("user-detail.jsp?id=" + userId);
        } else {
            // 실패 시 메시지 출력 후 뒤로가기
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>alert('업데이트 실패'); history.back();</script>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}