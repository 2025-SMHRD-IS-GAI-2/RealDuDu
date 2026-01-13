package com.dudu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dudu.database.SqlSessionManager;

@WebServlet("/dbtest")
public class DBTestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain; charset=UTF-8");

        SqlSession sqlSession = null;

        try {
            sqlSession = SqlSessionManager.getSqlSession();
            response.getWriter().print("DB 연결 성공");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("DB 연결 실패");
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }
}