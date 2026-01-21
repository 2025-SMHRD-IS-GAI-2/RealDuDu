package com.dudu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dudu.model.CSInquiry;
import com.dudu.model.CSInquiryDAO;

@WebServlet("/csInquiryAnswer")
public class CSInquiryAnswerService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        int csNo = Integer.parseInt(request.getParameter("csNo"));
        String answerCont = request.getParameter("answerCont");

        System.out.println("🔥 관리자 답변 처리");
        System.out.println("CS_NO=" + csNo);

        CSInquiry inquiry = new CSInquiry();
        inquiry.setCsNo(csNo);
        inquiry.setAnswerCont(answerCont);
        inquiry.setProcSt("C"); // 답변 완료

        CSInquiryDAO dao = new CSInquiryDAO();
        int result = dao.updateAnswer(inquiry);

        if (result > 0) {
            System.out.println("✅ 답변 등록 성공");
        } else {
            System.out.println("❌ 답변 등록 실패");
        }

        response.sendRedirect(request.getContextPath() + "/admin_main.jsp");
    }
}
