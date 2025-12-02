<html>
  <head>
	<title>Signup</title>
	<style type="text/css">
		body {
			background-image: url("2.jpg");
		
		}
		#prereg{
			border: 1px solid black;
			width: 300px;
			height: 200px;
			background: rgba(239,210,210,0.7);
			padding: 10px;
			float:left;
			border-radius:10px; 
			margin-left:30px;
			box-shadow:10px 10px 10px 10px #ccc;
		}
		#login{
			border: 1px solid black;
			width: 600px;
			height: 290px;
			background: rgba(239,210,210,0.7);
			padding: 10px;
			border-radius:10px; 
			float:right;
			margin-right:30px;
			box-shadow:10px 10px 10px 10px #ccc;
		}
		input {
			border-radius:10px;
			padding: 5px;
			margin-right: 10px; 
		}
		td{
			padding: 5px;
		}
		.l {
			font-size: 20px;
			padding: 3px;
		}
		button {
			border-radius:10px;
			padding: 3px;
			width: 50%;
			background: lime;
			font-size: 20px;
			margin-left: 170px;
		}
		#pre{
			border-radius:10px;
			padding: 3px;
			width: 50%;
			background: lime;
			font-size: 20px;
			margin-left: 70px;
		}
	</style>
  </head>
  
  <body>
  	  	<h1 style="color: white; font-size: 80px; text-align: center;margin-bottom: 2px;">Social Networks</h1>
  	  	<span id="msg" style="height:25px;color:blue; font-size:25px;display: block;text-align: center;font-weight: bold;"></span>
  	  	<br/>
  	  	<div id="prereg">
  	  		<label style="display: block; text-align: center;font-size: 30px;font-family: sans-serif; ">Pre-Registration</label>
  	  		<br/>
  	  		<form action="prereg">
  	  			<label class="l">Username</label>
  	  			<input type="text" name="puser" style="float: right;">
  	  			<br/><br/>
  	  			<label class="l">Email</label>
  	  			<input type="email" name="pemail" style="float: right;">
  	  			<br/><br/>
  	  			<button  id="pre" type="submit">Submit Details</button><br/>
  	  		</form>
  	  	</div>
  	  	
  	  	<div id="login">
  	  		<label style="display: block; text-align: center;font-size: 30px;font-family: sans-serif; ">Signup</label>
  	  		<br/>
  	  		<form action="register">
  	  			<table>
  	  			<tr>
  	  			<td><label class="l">Enter Key</label></td>
  	  			<td><input type="text" name="key"></td>
  	  			<td><label class="l">Username</label></td>
  	  			<td><input type="text" name="user"></td>
  	  			</tr>
  	  			<tr>
  	  			<td><label class="l">Password</label></td>
  	  			<td><input type="password" name="pass"></td>
  	  			<td><label class="l">Name</label></td>
  	  			<td><input type="text" name="name"></td>
  	  			</tr>
  	  			<tr>
				<td><label class="l">Mobile</label></td>
  	  			<td><input type="number" name="mobile"></td>
  	  		  	<td><label class="l">Email</label></td>
  	  			<td><input type="email" name="email"></td>
  	  			</tr>
  	  			<tr>
 	 	  		<td><label class="l">DOB</label></td>
  	  			<td><input type="date" name="dob"></td>
  	  			<td><label class="l">Gender</label></td>
  	  			<td><input type="radio" name="gender" value="Male">Male<input type="radio" name="gender" value="Female">Female</td>
  	  			</tr>
  	  			</table>
  	  			<button type="submit">Register</button><br/>
  	  			<a href="login.jsp">back</a>
  	  		</form>
  	  	</div>
  	  	<script type="text/javascript">
  	  		document.getElementById("msg").innerText=<%= request.getParameter("msg")%>
  	  	</script>
  </body>
</html>
