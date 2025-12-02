package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDAO;

public class SendReqServlet extends HttpServlet {
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
			result =UserDAO.sendReq(user, frnd);
			UserDAO.createNotfication(frnd,user+" : sent you a friend request");
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(result>0)
				response.getWriter().print("Request Sent");
			else
				response.getWriter().print("Request not Sent");
		}
	}

}
