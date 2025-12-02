<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.OutputStream"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%
	try {
		int i = Integer.parseInt(request.getParameter("val"));

		byte[] img = (byte[]) session.getAttribute(i + "img");
		OutputStream oImage;
		response.setContentType("image/gif");
		oImage = response.getOutputStream();
		oImage.write(img);
		oImage.flush();
		oImage.close();
	} catch (Exception e) {
	
	}
%>