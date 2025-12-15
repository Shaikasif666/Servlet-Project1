package com.vcube.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.vcube.dao.StudentDAO;
import com.vcube.model.DeleteModel;


@WebServlet("/DeleteController")
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		DeleteModel dm = new DeleteModel();
		dm.setUsername(username);
		dm.setPassword(password);
		
		StudentDAO sd = new StudentDAO();
		String status = sd.DeleteStudent(dm);
		
		if(status.equals("success")) {
			request.setAttribute("username", username);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("deleteAccount.jsp");
			rd.forward(request, response);
		}
	}


	}


