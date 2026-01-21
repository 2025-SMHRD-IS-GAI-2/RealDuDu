package com.dudu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dudu.model.Kickboard;
import com.dudu.model.KickboardDAO;

@WebServlet("/kickboardInsert")
public class KickboardInsertService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String kickboardId = request.getParameter("kickboardId");
        String modelNm = request.getParameter("modelNm");
        String kickboardSt = request.getParameter("kickboardSt");

        System.out.println("🔥 킥보드 등록");
        System.out.println("ID=" + kickboardId);
        System.out.println("MODEL=" + modelNm);
        System.out.println("ST=" + kickboardSt);

        Kickboard kickboard =
                new Kickboard(kickboardId, modelNm, kickboardSt);

        KickboardDAO dao = new KickboardDAO();
        int result = dao.insert(kickboard);

        if (result > 0) {
            System.out.println("✅ 킥보드 등록 성공");
            response.sendRedirect(request.getContextPath() + "/main.jsp");
        } else {
            System.out.println("❌ 킥보드 등록 실패");
            response.sendRedirect(request.getContextPath() + "/main.jsp?error=kickboard");
        }
    }
}
