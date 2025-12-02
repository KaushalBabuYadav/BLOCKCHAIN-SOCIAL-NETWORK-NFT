<html>
	<head>
		<title>Image Type</title>
		<style type="text/css">
			#div1{
				width: 400px;
				height: 200px;
				margin: auto;
				border: 2px solid brown;
				margin-top: 60px;
			}
			.p1{
				font-size: 30px;
				text-align: center;
				color: blue;
				margin-top: 15px;
				font-family: sans-serif;
				text-decoration: underline;
			}
			input {
				border-radius:10px;
				padding: 5px;
				width:70%;
				margin-right: 10px; 
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
			<p class="p1">Add Image Type</p>
			<form action="addtype">
				<label class="l">Type</label>
				<input type="text" name="type"><br/><br/>
				<button type="submit">Add Type</button>
			</form>
		</div>
		<script type="text/javascript">
  	  		document.getElementById("msg").innerText=<%= request.getParameter("msg")%>
  	  	</script>
	</body>
</html>