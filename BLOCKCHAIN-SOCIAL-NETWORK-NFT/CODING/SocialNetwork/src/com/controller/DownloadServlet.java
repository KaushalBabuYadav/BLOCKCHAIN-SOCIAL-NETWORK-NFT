package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ImageDAO;

public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String image_id=request.getParameter("id");
		int id =Integer.parseInt(image_id);
		try{
			byte[] img =ImageDAO.getImage(id);
			File dir = new File(getServletContext().getRealPath("/") + "data");
			dir.mkdir();
			File f =new File(dir+"/img.png");
			OutputStream os =new FileOutputStream(f);
			os.write(img);
			os.flush();
			os.close();
			response.setContentType("text/html");

			PrintWriter out = response.getWriter();
			String filename = f.getName();
			response.setContentType("APPLICATION/OCTET-STREAM");
			response
					.setHeader("Content-Disposition",
							"attachment; filename=\""
									+ filename + "\"");

			java.io.FileInputStream fileInputStream = new java.io.FileInputStream(f);
			int i;
			while ((i = fileInputStream.read()) != -1) {
				out.write(i);
			}
			fileInputStream.close();
			out.close();
			f.delete();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
