package com.dudu.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dudu.model.Ride;
import com.dudu.model.RideDAO;

@WebServlet("/rideStart")
public class RideStartService extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("userId");
        String kickboardId = request.getParameter("kickboardId");

        String rideId = "RIDE_" + UUID.randomUUID();

        Ride ride = new Ride(rideId, userId, kickboardId, "P");

        RideDAO dao = new RideDAO();
        dao.startRide(ride);

        response.sendRedirect(request.getContextPath() + "/main.jsp");
    }
}
