package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDAO;
import com.utility.CryptoUtils;

public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user=null,pass=null;
		user =request.getParameter("user");
		pass =request.getParameter("pass");
		System.out.println("user name & password");
		System.out.println(user+" "+pass);
		int result=0;
		String role=null;
		try{
			String dpass =CryptoUtils.encrypt(pass);	
			System.out.println("====>"+dpass);
			result =UserDAO.login(user, dpass);
			if(result>0)
				role=UserDAO.getRole(user);
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(result>0){
				request.getSession().setAttribute("status","login");
				request.getSession().setAttribute("user",user);
				if(role.equalsIgnoreCase("admin"))
					response.sendRedirect("admin_home.jsp");
				else
					response.sendRedirect("user_home.jsp");
			}else{
				response.sendRedirect("login.jsp?msg='*Invalid Credentials'");
			}
		}
	}
}
