
<%@page import="java.util.List"%>
<%@page import="com.dao.UserDAO"%><html>
	<head>
		<title>User Requests</title>
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
			.btn{
				background: lightgreen;
				padding: 0px;
				margin: 5px;
			}
		</style>
		 <script type="text/javascript">
		var request;
function sendInfo(id) {
	if(confirm('Continue !')){
	var v = id;
	var url = "./accept?uname=" + v;
	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}
	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var res = request.responseText;
				alert(res);
				location.reload()
			}
		};
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
	}
}
		</script>
	</head>
	<body>
		<%@include file="admin_header.jsp" %>
		<div id="main">
			<p id="p1">Users</p>
			<table border="1" style="border-collapse: collapse; width: 100%;">
				<thead>
					<tr> 
						<th>UserName</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<List<String>> list =null;
						list =UserDAO.getUserReqs();
						if(list.size()>0){
						for(List<String> l:list){
							if(l.get(2).equals("0")){
					%>
							<tr>
								<td><%=l.get(0) %></td>
								<td><%=l.get(1) %></td>
								<td><button class="btn" id="<%= l.get(0)%>" type="button" onclick="sendInfo(this.id)">Confirm</button></td>
							</tr>
					<%
							}
						  }
						}	
					%>
				</tbody>
			</table>
		</div>
	</body>
</html>