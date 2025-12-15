package com.vcube.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.vcube.dao.StudentDAO;
import com.vcube.model.Student;


@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
	//private static final long serialVersionUID = 1L;

    public StudentController() {

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Student s=new Student();
		s.setFullname(fullname);
		s.setUsername(username);
		s.setPassword(password);
		
		StudentDAO sd = new StudentDAO();
		String status = sd.insertStudent(s);
		
		if(status.equals("success")) {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}

}
