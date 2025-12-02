package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.beans.UploadImg;
import com.dao.ImageDAO;

public class UploadImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cat = null;
		int result = 0;
		response.setContentType("text/html");
		File dir = new File("D:/sujatha/data");
		dir.mkdir();
		String fileName=null;
		byte[] b=null;
		try {
			List<FileItem> items = new ServletFileUpload(
					new DiskFileItemFactory()).parseRequest(request);
			for (FileItem item : items) {
				if (item.isFormField()) {
					cat = item.getString();
				} else {
					fileName = FilenameUtils.getName(item.getName());
					InputStream fileContent = item.getInputStream();
					b = new byte[(int) item.getSize()];
					fileContent.read(b);
				}
			}
			
			UploadImg img =new UploadImg();
			img.setImg_name(fileName);
			img.setUsername((String)request.getSession().getAttribute("user"));
			System.out.println(img.getUsername());
			img.setCat(cat);
			img.setPath(b);
			result =ImageDAO.uploadImage(img);
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			if(result>0)
				response.sendRedirect("user_home.jsp?msg='*Image Uploaded'");
			else
				response.sendRedirect("user_home.jsp?msg='*Unable to process request'");
		}
	}
}