package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDAO;

public class AcceptUserReqServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String frnd =request.getParameter("frnd");
		String user =(String)request.getSession().getAttribute("user");
		int result=0;
		try{
			result =UserDAO.acceptReq(user, frnd);
			UserDAO.createNotfication(frnd,user +" : accept your friend request");
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(result>0)
				response.getWriter().print("Request Accepted");
			else
				response.getWriter().print("Unable to process your request");
		}
	}

}
