<%@page import="java.util.List"%>
<%@page import="com.dao.ImageDAO"%>
<html>
	<head>
		<title>Image Category</title>
		<style type="text/css">
			#div1{
				width: 450px;
				height: 240px;
				margin: auto;
				border: 2px solid brown;
				margin-top: 60px;
				border-radius:10px; 
			}
			.p1{
				font-size: 30px;
				text-align: center;
				color: blue;
				margin-top: 15px;
				font-family: sans-serif;
				text-decoration: underline;
			}
			input ,select{
				border-radius:10px;
				padding: 5px;
				width:70%;
				margin-right: 10px; 
				float: right;
			}
			.l {
				font-size: 20px;
				padding: 3px;
				margin: 20px;
			}
			button {
				border-radius:10px;
				padding: 3px;
				width: 40%;
				background: lime;
				float:right;
				font-size: 18px;
				margin-right: 30px;
			}
			
		</style>
	</head>
	<body>
		<%@include file="admin_header.jsp" %><br/><br/>
		<p style="display: block;text-align: center;font-size: 18px;background: red;color: blue;" id="msg"></p>
		<div id="div1">
			<p class="p1">Add Image Category</p>
			<form action="addcat">
				<label class="l">Type</label>
				<select name="type">
					<%
						List<String> list =ImageDAO.getTypes();
						for(String s:list){
					%>
							<option><%=s %></option>		
					<%
						}
					%>
				</select><br/><br/>
				<label class="l">Category</label>
				<input type="text" name="cat"><br/><br/>
				<button type="submit">Add Category</button>
			</form>
		</div>
		<script type="text/javascript">
  	  		document.getElementById("msg").innerText=<%= request.getParameter("msg")%>
  	  	</script>
	</body>
</html>