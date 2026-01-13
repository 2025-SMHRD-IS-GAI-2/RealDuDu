package com.dudu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dudu.model.User;
import com.dudu.model.UserDAO;
import com.dudu.model.UserTest;

@WebServlet("/login")
public class LoginService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");

        // 🔎 디버그 로그 (성공/실패 판별용)
        System.out.println("🔥 LoginService 진입");
        System.out.println("👉 입력 ID = " + userId);
        System.out.println("👉 입력 PW = " + userPw);

        UserDAO dao = new UserDAO();
        User user = dao.login(userId, userPw);

        System.out.println("👉 로그인 결과 user = " + user);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", user);
            System.out.println("✅ 로그인 성공");

            response.sendRedirect(request.getContextPath() + "/main.jsp");
        } else {
            System.out.println("❌ 로그인 실패");
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=fail");
        }
    }
}