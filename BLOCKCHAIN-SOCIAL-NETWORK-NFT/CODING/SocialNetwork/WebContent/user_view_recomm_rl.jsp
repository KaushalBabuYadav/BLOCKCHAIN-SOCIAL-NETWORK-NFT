
<%@page import="java.util.List"%>
<%@page import="com.dao.RecommDAO"%>
<%@page import="com.beans.UploadImg"%><html>
	<head>
		<title>Rated Images</title>
		<style type="text/css">
			#main{
				border: 2px solid gray;
				width: 98%;
				height: 98%;
				overflow:auto;
				margin-right: 10px;
				padding: 10px;
			}
			p{
				margin: 0px;
				margin-top:5px;
				text-align:center;font-family:cursive;
				font-size: 20px;
				color:blue;
				background:lightyellow; 
			}
			button {
				float: right;
				margin-top: 5px;
				border-radius:5px;
				background: blue;
				color: white; 
			}
		</style>
	</head>
	<body>
		<%@include file="user_header.jsp" %>
		<br/><hr/>
		<div id="main">
			<p>Image Recommendations based on Reting</p>
			<a href="user_view_recomm.jsp" style="color: blue; font-size: 20px; font-family: cursive;">back</a>
			<div style="padding: 35px;">
				<%
					List<UploadImg> list =RecommDAO.getRLRecomm((String)session.getAttribute("user"));
					int count=0;
					if(list.size()>0){
						for(UploadImg img:list){
							session.setAttribute(count+"img",img.getPath());
				%>			
				<div style="width: 320x; height: 210px; margin: 35px; float: left; border: 1px solid black;padding: 5px;">
					<img alt="" src="image.jsp?val=<%=count%>" height="180" width="250"><br/>
					<button type="button"  onclick="window.location.href='./download?id=<%=img.getImg_id() %>'">Download</button>
				</div>
				<%	count++;
						}
					}
				 %>
			</div>
		</div>
	</body>
</html>