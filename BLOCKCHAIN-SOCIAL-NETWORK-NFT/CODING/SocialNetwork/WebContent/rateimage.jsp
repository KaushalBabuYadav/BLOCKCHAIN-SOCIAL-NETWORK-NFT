
<%@page import="com.dao.ImageDAO"%>
<%@page import="com.dao.UserDAO"%><%
	
	String req=request.getParameter("idd");
	int id =Integer.parseInt(req);
	String rate1 =request.getParameter("rate");
	int rate=Integer.parseInt(rate1);
	String c_user=(String)session.getAttribute("user");
	ImageDAO.rate(id,c_user,rate);
	UserDAO.createNotfication(ImageDAO.getImgUser(id),c_user +" : rate Your Image");
%>