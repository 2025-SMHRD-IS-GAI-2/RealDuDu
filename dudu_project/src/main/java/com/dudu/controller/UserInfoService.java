package com.dudu.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dudu.model.User;
import com.dudu.model.UserDAO;

@WebServlet("/userInfo")
public class UserInfoService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // 로그인 안 된 경우
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // 로그인 유저
        User loginUser = (User) session.getAttribute("loginUser");

        // 최신 정보 DB 조회
        UserDAO dao = new UserDAO();
        User user = dao.selectById(loginUser.getUSER_ID());

        // JSP로 전달
        request.setAttribute("user", user);

        RequestDispatcher rd =
                request.getRequestDispatcher("/user_profile.jsp");
        rd.forward(request, response);
    }
}
