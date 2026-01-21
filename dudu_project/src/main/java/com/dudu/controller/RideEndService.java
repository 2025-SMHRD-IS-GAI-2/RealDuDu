package com.dudu.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dudu.model.Ride;
import com.dudu.model.RideDAO;

@WebServlet("/rideEnd")
public class RideEndService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String rideId = request.getParameter("rideId");

        // ⚠ Python에서 계산된 값이 들어온다고 가정
        Date startDt = new Date(); // 실제로는 Python 결과
        Date endDt = new Date();
        Date helmetTm = new Date();
        int scoreCg = Integer.parseInt(request.getParameter("scoreCg"));

        Ride ride = new Ride();
        ride.setRideId(rideId);
        ride.setStartDt(startDt);
        ride.setEndDt(endDt);
        ride.setHelmetTm(helmetTm);
        ride.setScoreCg(scoreCg);
        ride.setRideSt("E");

        RideDAO dao = new RideDAO();
        dao.endRide(ride);

        response.sendRedirect(request.getContextPath() + "/main.jsp");
    }
}
