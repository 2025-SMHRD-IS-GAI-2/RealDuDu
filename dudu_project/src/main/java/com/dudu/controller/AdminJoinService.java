package com.dudu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dudu.model.Admin;
import com.dudu.model.AdminDAO;

@WebServlet("/adminJoin")
public class AdminJoinService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String adminId = request.getParameter("adminId");
        String adminPw = request.getParameter("adminPw");
        String adminNm = request.getParameter("adminNm");

        System.out.println("🔥 관리자 회원가입");
        System.out.println("ID=" + adminId + ", NM=" + adminNm);

        Admin admin = new Admin(adminId, adminPw, adminNm);
        AdminDAO dao = new AdminDAO();

        int result = dao.join(admin);

        if (result > 0) {
            System.out.println("✅ 관리자 가입 성공");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            System.out.println("❌ 관리자 가입 실패");
            response.sendRedirect(request.getContextPath() + "/admin_join.jsp");
        }
    }
}