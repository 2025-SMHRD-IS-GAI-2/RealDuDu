package com.dudu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dudu.model.KickboardDAO;

@WebServlet("/kickboardStatusUpdate")
public class KickboardStatusUpdateService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String kickboardId = request.getParameter("kickboardId");
        String kickboardSt = request.getParameter("kickboardSt");

        System.out.println("🔥 킥보드 상태 변경");
        System.out.println("ID=" + kickboardId);
        System.out.println("ST=" + kickboardSt);

        KickboardDAO dao = new KickboardDAO();
        int result = dao.updateStatus(kickboardId, kickboardSt);

        if (result > 0) {
            System.out.println("✅ 상태 변경 성공");
        } else {
            System.out.println("❌ 상태 변경 실패");
        }

        response.sendRedirect(request.getContextPath() + "/main.jsp");
    }
}