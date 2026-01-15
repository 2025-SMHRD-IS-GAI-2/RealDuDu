package com.dudu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dudu.model.CSInquiry;
import com.dudu.model.CSInquiryDAO;

@WebServlet("/csInquiryInsert")
public class CSInquiryInsertService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("userId");
        String csTitle = request.getParameter("csTitle");
        String csType = request.getParameter("csType");
        String csCont = request.getParameter("csCont");

        System.out.println("🔥 고객센터 문의 등록");
        System.out.println("USER=" + userId);
        System.out.println("TITLE=" + csTitle);

        CSInquiry inquiry = new CSInquiry(
                userId,
                csTitle,
                csType,
                csCont
        );

        CSInquiryDAO dao = new CSInquiryDAO();
        int result = dao.insert(inquiry);

        if (result > 0) {
            System.out.println("✅ 문의 등록 성공");
            response.sendRedirect(request.getContextPath() + "/main.jsp");
        } else {
            System.out.println("❌ 문의 등록 실패");
            response.sendRedirect(request.getContextPath() + "/main.jsp?error=cs");
        }
    }
}
