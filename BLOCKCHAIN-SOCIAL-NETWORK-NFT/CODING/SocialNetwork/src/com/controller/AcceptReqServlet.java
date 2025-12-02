package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDAO;
import com.utility.GetRamdomKey;
import com.utility.Mailer;

public class AcceptReqServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user =request.getParameter("uname");
		String key =GetRamdomKey.getKey();
		String email=null;
		int result=0;
		try{
			result=UserDAO.saveKey(user, key);
			email =UserDAO.getPEmail(user);
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(result>0){
				String msg ="Your Request for registration is approved.\nYour username ="+user+"\n and Key :"+key+"\n use this key to complete registration";
				Mailer.send(email,"Mail For Registration",msg);
				response.getWriter().print("Operation Succeed");
			}else{
				response.getWriter().print("Operation Failed");
			}
		}
		
	}

}
