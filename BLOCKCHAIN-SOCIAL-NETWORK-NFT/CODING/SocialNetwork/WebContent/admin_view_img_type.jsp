
<%@page import="java.util.List"%>
<%@page import="com.dao.ImageDAO"%>
<html>
	<head>
		<title>View Types</title>
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
			<p  id="p1">Image Types</p>
			<table border="1" style="border-collapse: collapse; width: 100%;">
				<thead>
					<tr> 
						<th>S.NO</th>
						<th>Type</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<String> list =null;
						list =ImageDAO.getTypes();
						int c=0;
						for(String s:list){
							if(list.size()>0){
					%>
							<tr>
								<td><%=++c%></td>
								<td><%=s %></td>
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