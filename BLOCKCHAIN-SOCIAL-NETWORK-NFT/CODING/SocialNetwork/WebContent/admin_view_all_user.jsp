
<%@page import="java.util.List"%>
<%@page import="com.beans.UserBO"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="java.util.Date"%>
<html>
	<head>
		<title>All users</title>
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
			<p id="p1">Users</p>
			<table border="1" style="border-collapse: collapse; width: 100%;">
				<thead>
					<tr> 
						<th>UserName</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Date_Of_Birth</th>
						<th>Gender</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<UserBO> list =null;
						list =UserDAO.getUsers();
						for(UserBO bo:list){
							if(list.size()>0){
					%>
							<tr>
								<td><%=bo.getUsername() %></td>
								<td><%=bo.getName() %></td>
								<td><%=bo.getEmail() %></td>
								<td><%=bo.getMobile() %></td>
								<td><%=bo.getDob() %></td>
								<td><%=bo.getGender() %></td>
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