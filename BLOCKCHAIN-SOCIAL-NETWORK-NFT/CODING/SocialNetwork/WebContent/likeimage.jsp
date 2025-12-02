
<%@page import="com.dao.ImageDAO"%>
<%@page import="com.dao.UserDAO"%><%
	int id =Integer.parseInt(request.getParameter("id"));
	String c_user=(String)session.getAttribute("user");
	ImageDAO.like(id,c_user);
	UserDAO.createNotfication(ImageDAO.getImgUser(id),c_user +" : Like Your Image");
%>