package com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDAO;
import com.beans.UserBO;
import com.utility.CryptoUtils;

public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user = null, pass = null, name = null, email = null, mobile = null, dob = null;
		String key = null;
		String gender = null;
		gender = request.getParameter("gender");
		user = request.getParameter("user");
		key = request.getParameter("key");
		int result = 0;
		String msg="";
		try {
			if (key.equals(UserDAO.getKey(user))) {
				pass = request.getParameter("pass");
				String epass=CryptoUtils.encrypt(pass);
				name = request.getParameter("name");
				email = request.getParameter("email");
				mobile = request.getParameter("mobile");
				dob = request.getParameter("dob");
				Date d = new SimpleDateFormat("yyyy-MM-dd").parse(dob);
				UserBO bo = new UserBO();
				bo.setUsername(user);
				bo.setPassword(epass);
				bo.setEmail(email);
				bo.setMobile(Long.parseLong(mobile));
				bo.setName(name);
				bo.setDob(new java.sql.Date(d.getTime()));
				bo.setGender(gender);
				result = UserDAO.register(bo);
				msg ="*Registration done! login here";
			}else{
				msg ="You have entered a wrong key";
			}
		} catch (Exception e) {
			msg ="*Registration failed";
			e.printStackTrace();
		} finally {
			if (result > 0)
				response.sendRedirect("login.jsp?msg='"+msg+"'");
			else
				response.sendRedirect("signup.jsp?msg='"+msg+"'");
		}

	}

}
