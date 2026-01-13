package com.dudu.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dudu.model.User;
import com.dudu.model.UserDAO;

@WebServlet("/join")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userNm = request.getParameter("userNm");
		String userTel = request.getParameter("userTel");

		User user = new User(userId, userPw, userNm, userTel);

		UserDAO dao = new UserDAO();
		int result = dao.join(user);

		if (result > 0) {
			request.setAttribute("userId", userId);
			RequestDispatcher rd = request.getRequestDispatcher("join_success.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("join.jsp");
		}
	}
}