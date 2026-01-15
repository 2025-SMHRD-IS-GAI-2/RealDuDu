package com.dudu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dudu.model.Admin;
import com.dudu.model.AdminDAO;

@WebServlet("/adminLogin")
public class AdminLoginService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ===== 인코딩 설정 =====
        request.setCharacterEncoding("UTF-8");

        // ===== 파라미터 수신 =====
        String adminId = request.getParameter("adminId");
        String adminPw = request.getParameter("adminPw");

        // ===== 디버그 로그 =====
        System.out.println("🔥 AdminLoginService 진입");
        System.out.println("👉 입력 ID = " + adminId);
        System.out.println("👉 입력 PW = " + adminPw);

        // ===== DAO 호출 =====
        AdminDAO dao = new AdminDAO();
        Admin param = new Admin(adminId, adminPw); // 로그인용 생성자
        Admin admin = dao.login(param);

        System.out.println("👉 로그인 결과 admin = " + admin);

        // ===== 로그인 성공 / 실패 분기 =====
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginAdmin", admin);

            System.out.println("✅ 관리자 로그인 성공");
            response.sendRedirect(request.getContextPath() + "/main.jsp");
        } else {
            System.out.println("❌ 관리자 로그인 실패");
            response.sendRedirect(request.getContextPath() + "/admin_login.jsp?error=fail");
        }
    }
}
