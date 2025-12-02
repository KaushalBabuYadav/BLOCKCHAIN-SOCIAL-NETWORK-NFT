
<%@page import="java.util.List"%>
<%@page import="com.dao.ImageDAO"%>
<html>
	<head>
		<title>View Categories</title>
		<style type="text/css">
			#main{
				width:720px;
				height: auto;
				box-shadow:10px 10px 10px 10px #ccc;
				position: absolute;
				top:200px;
				margin:20px;
				margin-left:200px;
				border-radius:5px;
				padding: 20px;
				background: white;
			}
			tbody {
				text-align: center;
			}	
			#p1{
				font-size: 30px;
				text-align: center;
				color: blue;
				margin-top: 0px;
				font-family: sans-serif;
				text-decoration: underline;
			}
		</style>
	</head>
	<body>
		<%@include file="admin_header.jsp" %>
		<div id="main">
			<p id="p1">Image Categories</p>
			<table border="1" style="border-collapse: collapse; width: 100%;">
				<thead>
					<tr> 
						<th>S.NO</th>
						<th>Type</th>
						<th>Category</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<List<String>> list =null;
						list =ImageDAO.getCategory();
						int c=0;
						for(List<String> l:list){
							if(list.size()>0){
					%>
							<tr>
								<td><%=++c%></td>
								<td><%=l.get(1) %></td>
								<td><%=l.get(0) %></td>
							</tr>
					<%
							}
						}	
					%>
				</tbody>
			</table>
		</div>
	</body>
</html>