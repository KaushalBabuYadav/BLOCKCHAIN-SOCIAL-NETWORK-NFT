package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ImageDAO;

public class AddImgCatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type =request.getParameter("type");
		String cat =request.getParameter("cat");
		int result=0;
		
		try{
			result =ImageDAO.addImgCat(type, cat);
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(result>0)
				response.sendRedirect("admin_add_img_cat.jsp?msg='*Category added Successfully'");
			else
				response.sendRedirect("admin_add_img_cat.jsp?msg='*Unable to process the request'");
		}
		
		
	}

}
