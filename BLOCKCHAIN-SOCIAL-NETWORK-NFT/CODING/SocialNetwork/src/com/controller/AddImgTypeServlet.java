package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ImageDAO;

public class AddImgTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type=request.getParameter("type");
		int result=0;
		try{
			result =ImageDAO.addType(type);
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(result>0)
				response.sendRedirect("admin_add_img_type.jsp?msg='*Type Added'");
			else
				response.sendRedirect("admin_add_img_type.jsp?msg='*Unable to Added OR Type already exist'");
			
		}
		
	}
}
