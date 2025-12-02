<html>
  <head>
	<title>Login</title>
	<style type="text/css">
		body {
			background-image: url("2.jpg");
		
		}
		#login{
			border: 1px solid black;
			width: 300px;
			height: 220px;
			background: rgba(239,210,210,0.7);
			margin-left:410px;
			padding: 10px;
			border-radius:10px; 
			box-shadow:10px 10px 10px 10px #ccc;
		}
		input {
			border-radius:10px;
			padding: 3px;
			float: right;
			margin-right: 10px; 
		}
		.l {
			font-size: 20px;
			padding: 3px;
		}
		button {
			border-radius:10px;
			padding: 3px;
			width: 70%;
			background: lime;
			font-size: 18px;
			margin-left: 40px;
		}
	</style>
  </head>
  
  <body>
  	  	<h1 style="color: white; font-size: 80px; text-align: center;margin-bottom: 2px;">Social Networks</h1>
  	  	<span id="msg" style="height:25px;color:blue; font-size:25px;display: block;text-align: center;font-weight: bold;"></span>
  	  	<br/>
  	  	<div id="login">
  	  		<label style="display: block; text-align: center;font-size: 30px;font-family: sans-serif; ">User Login</label>
  	  		<br/>
  	  		<form action="login">
  	  		<label class="l">Username</label>
  	  		<input type="text" name="user">
  	  		<br/><br/>
  	  		<label class="l">Password</label>
  	  		<input type="password" name="pass">
  	  		<br/><br/>
  	  		<button type="submit">Login</button><br/>
  	  		<span style="display: block;text-align: center;font-weight: bold;">OR</span>
  	  		<button type="button" onclick="window.location.href='signup.jsp'">Signup</button>
  	  		</form>
  	  	</div>
  	  	 	<br/> 	<br/> 	<br/>
  	  
  	  	<script type="text/javascript">
  	  		document.getElementById("msg").innerText=<%= request.getParameter("msg")%>
  	  	</script>
  </body>
</html>
