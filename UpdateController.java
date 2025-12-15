package com.vcube.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.vcube.dao.StudentDAO;
import com.vcube.model.UpdateModel;


@WebServlet(name = "UpdateController", urlPatterns = { "/UpdateController" })
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		UpdateModel um = new UpdateModel();
		um.setUsername(username);
		um.setPassword(password);
		
		StudentDAO sd = new StudentDAO();
		String status = sd.UpdateStudent(um);
		
		if(status.equals("success")) {
			request.setAttribute("username", username);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("forgotPassword.jsp");
			rd.forward(request, response);
		}
	}

}

