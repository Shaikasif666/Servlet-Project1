package com.vcube.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.vcube.dao.StudentDAO;
import com.vcube.model.LoginModel;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginModel lm = new LoginModel();
        lm.setUsername(username);
        lm.setPassword(password);

        StudentDAO sd = new StudentDAO();
        String status = sd.selectStudent(lm);

        if (status.equals("success")) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // Only redirect
            response.sendRedirect("home.jsp");
        } 
        else {
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }
}
