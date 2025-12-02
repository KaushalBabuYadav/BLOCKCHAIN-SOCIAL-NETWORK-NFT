<%
		String loginstatus = "";
		if (session != null) {
		   loginstatus = (String) session.getAttribute("status");
			  if (!loginstatus.equals("login")) {
				response.sendRedirect("login.jsp?msg='you are logged out,plz login first'");
		   }
        }
%>

<html>
  <head>
	<title>Home</title>
	<style type="text/css">
body{
	margin: 0px;
	margin-top:10px;
}
#heading{
  width: 100%;
  height: 60px;
  border-bottom: 1px solid gray;	
  text-align: center;
  font-size: 22px;
}
.dropbtn {
  font-size: 20px;
  border: none;
  padding-left:35px;	
  padding-right:45px;
  color: blue;
}
.dropdown {
  position: relative;
  display: inline-block;
  padding-right: 0px;
}

.dropdown-content {
  display: none;
  margin-left:30px;
  position: absolute;
  top:20px;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1; 
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  color: blue;
  font-family:serif;
  font-size: 15px;
}		
#nav{
  height: 24px;
  padding:5px;
  background:lime;
  border-bottom: 1px solid gray;
}


.dropdown-content a:hover {background-color: lime;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {text-decoration: underline;}
	</style>
  </head>
  <body>
	<div id="heading">
	<h1>Social Networks</h1>
	
	</div>
	<div id="nav">
		<div class="dropdown">
  				<a href="admin_home.jsp" class="dropbtn">Home</a>
		</div>
		<div class="dropdown">
  				<a class="dropbtn">Images</a>
  				<div class="dropdown-content">
    				<a href="admin_add_img_cat.jsp">Add Image Category</a>
    				<a href="admin_view_img_cat.jsp">View Categories</a>
    				<a href="admin_add_img_type.jsp">Add Image Type</a>
    				<a href="admin_view_img_type.jsp">View Image Type</a>
  				</div>
		</div>
		<div class="dropdown">
  				<a class="dropbtn">Users</a>
  				<div class="dropdown-content">
    				<a href="admin_view_user.jsp">View user requests</a>
    				<a href="admin_view_all_user.jsp">View all users</a>
  				</div>
		</div>
		<div class="dropdown" style="float:right;">
  				<a href="logout" class="dropbtn">Logout</a>
		</div>
	</div>
	<p style="float: right; font-size: 20px;color:blue;font-family: cursive;margin-right: 10px;margin-top: 0px;">Welcome ! <%=session.getAttribute("user") %></p>
  </body>
</html>
