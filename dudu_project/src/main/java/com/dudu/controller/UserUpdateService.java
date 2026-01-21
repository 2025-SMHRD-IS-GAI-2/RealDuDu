package com.dudu.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dudu.model.User;
import com.dudu.model.UserDAO;

@WebServlet("/userUpdate")
public class UserUpdateService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");

        // 로그인 검증
        if (loginUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 수정할 값
        String userNm = request.getParameter("userNm");
        String userTel = request.getParameter("userTel");

        // 기존 객체에 값만 변경
        loginUser.setUSER_NM(userNm);
        loginUser.setUSER_TEL(userTel);

        UserDAO dao = new UserDAO();
        int result = dao.updateUser(loginUser);

        if (result > 0) {
            // ⭐ 세션 갱신 (중요)
            session.setAttribute("loginUser", loginUser);
            System.out.println("✅ 회원정보 수정 성공");
        } else {
            System.out.println("❌ 회원정보 수정 실패");
        }

        response.sendRedirect("main.jsp");
    }
}
