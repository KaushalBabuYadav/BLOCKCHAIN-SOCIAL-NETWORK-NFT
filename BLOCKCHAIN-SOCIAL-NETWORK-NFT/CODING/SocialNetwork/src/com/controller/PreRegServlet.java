package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDAO;

public class PreRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user =request.getParameter("puser");
		String email =request.getParameter("pemail");
		int result=0;
		try{
			result =UserDAO.preRegister(user, email);
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			if(result>0){
				response.sendRedirect("signup.jsp?msg='Your request sent successfully,wait for confirmation form admin'");
			}
			else{
				response.sendRedirect("signup.jsp?msg='unable to process request'");
			}
		}
	}

}
