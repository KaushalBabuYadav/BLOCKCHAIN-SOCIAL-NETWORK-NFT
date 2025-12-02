
<%@page import="com.beans.UserBO"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ImageDAO"%>
<%@page import="com.beans.UploadImg"%><html>
	<head>
	<%
		String C_user =(String)session.getAttribute("user");
	 %>
	 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
		<title>Home</title>
		<style type="text/css">
			#main{
				border: 2px solid gray;
				width: 98%;
				height: 900px;
				margin-right: 10px;
				padding: 10px;
			}
			#profile{
				border: 1px solid gray;
				width: 200px;
				height: 330px;
				float: left;
				margin-right:10px; 
			}
			#home{
				border: 1px solid gray;
				width: 580px;
				height: 880px;
				float: left;
				padding:10px;
				margin-right: 10px;
			}
			#r{
				border: 1px solid gray;
				width: 250px;
				height: 700px;
				float: left;
				padding: 10px;
			}
		</style>
	</head>
	<body> 
		<%@include file="user_header.jsp" %>
		<br/><hr/>
		
		<div id="main">
			<div id="profile">
				<img src="images/profile.jpg" style="border-radius:60px;margin: 37px;margin-top: 20px; "/>
				<div style="margin: 10px;color:blue;margin-top: 0px;font-family:cursive;font-size: 15px;">
					<%
						UserBO bo =UserDAO.getUser(C_user);
					 %>
					
					<label>Name :<%=bo.getName() %></label><br/>
					<label>Email :<%=bo.getEmail() %></label><br/>
					<label>DOB :<%=bo.getDob() %></label><br/>
					<label>Mobile :<%=bo.getMobile() %></label><br/>
					<label>Gender :<%=bo.getGender() %></label><br/>
				</div>
			</div>
			<div id="home">
				<div style="width: 99%;height: 130px; border: 2px solid gray;">
					<p style="margin: 0px;margin-top: 5px;text-align: center;font-family:cursive;font-size: 15px;background:lime;  ">Upload Images</p>
					<div style="margin: 10px;">
					<form action="upload" enctype="multipart/form-data" method="post">
						<label>Select Category</label>
						<select name="cat" style="width: 200px;height: 20px;">
						 <%
							List<String> l =ImageDAO.getCat();
							for(String s:l){
						 %>
						 	<option><%=s %></option>
						 <%			
							}
						 %>
						</select>
						<br/><br/>
						<input type="file" accept=".png,.jpg,.jpeg" name="myFile">
						<button type="submit" style="width: 100px;height: 30px;float: right;background: blue;color: white;border-radius:5px;">Upload</button>
						<p id="msg" style="text-align: center;color: blue;"></p>
						</form>
					</div>
				</div>
				<div id="i" style="width: 99%;height: 83%; overflow: auto;border: 2px solid gray;margin-top: 10px;">
					<%
						List<UploadImg> img =null;
						img =ImageDAO.getImages(C_user);
						if(img.size()>0){
							int count=0;
							for(UploadImg i:img){
							session.setAttribute(count+"img",i.getPath());
							
					%>	
							<div style="width: 500px; height: 340px; margin: 10px;padding: 20px; border: 1px solid black;">
								<p id="<%=i.getImg_id()%>" style="padding-bottom:5px;margin: 0px; color: blue; font-family: cursive; display: inline;"><%=i.getUsername() %></p>
								<p style="float:right;padding-bottom:5px;margin: 0px; color: blue; font-family: cursive; display: inline;">Category :<%=i.getCat() %></p>
								<img alt="" src="image.jsp?val=<%=count%>" height="280" width="500">
								
								<div style="height: 40px; border: 2px solid gray;margin: 0px;">
									<div id="l" style="padding: 10px; float: left;">
										<%
											if(ImageDAO.isLiked(i.getImg_id(),C_user)){
										 %>
										<button id="<%=i.getImg_id()%>" style="color: white; background: blue; "disabled="disabled">Liked</button></button>
										<%
											}else{
										 %>
										 <button id="<%=i.getImg_id()%>" style="color: blue; background: white;" onclick="sendIn('likeimage.jsp?id=<%=i.getImg_id() %>')">Like</button></button>
										 <%
										 	}
										  %>
										<span style="color: blue; font-family: cursive;"><%=ImageDAO.getLikes(i.getImg_id()) %> : Likes</span>
									</div>
									<div style="float: right;padding: 10px;">
										<%
											if(ImageDAO.isRated(C_user,i.getImg_id())){
										%>
										<button id="<%=i.getImg_id()%>" style="color: white; background: blue; "disabled="disabled">Rated</button></button>
										<%
											}else{
										%>
										 <button id="<%=i.getImg_id()%>" style="color: blue; background: white;" onclick="rate('<%=i.getImg_id() %>')">Rate Now</button></button>
										<%
										 	}
										%>
										<span style="color: blue; font-family: cursive;">Rating :<%=ImageDAO.getRating(i.getImg_id()) %></span>		
									</div>
								</div>
							</div>
					<%			
							count++;
							}
						}
					%>
				</div>
			</div>
			<div id="r">
				<input id="search" style="width: 190px;" type="text" oninput="filter()"/><button type="button">Search</button>
				<hr/>
				<div style="width: 100%;height: 270px;border: 2px solid gray;overflow: auto;">
					<p style="margin: 0px;margin-top: 5px;text-align: center;font-family:cursive;font-size: 15px;background:lime;  ">Friends Suggestions</p>
					 <%
						List<String> list =null;
						list =UserDAO.getFriendSugg(C_user);
						if(list.size()>0){
							for(String s:list){
						if((!s.equals(C_user))){
					 %>
							<div id=<%=s%> class="sugg" style="width:90%;height:30px;padding:5px;;border-bottom: 2px solid gray;margin: 5px; ">
								<%= s%>
								<button id="<%=s%>" style="float: right;border-radius:5px;background: blue;color: white;" onclick="sendInfo('./sendReq?frnd=<%=s %>')">Add Friend</button>
							</div>		
					 <%		}			
							}
						}
					 %>
				</div>
				
				<div style="width: 100%;margin-top:10px;;height: 375px;border: 2px solid gray;overflow: auto;">
					<p style="margin: 0px;margin-top: 5px;text-align: center;font-family:cursive;font-size: 15px;background:lime;  ">Friend List</p>
					 <%
						List<String> friend =null;
						friend =UserDAO.getFriends(C_user);
						for(String s:friend){
							if(friend.size()>0){
					 %>
							<div id="" style="width:90%;height:30px;padding:5px;;border-bottom: 2px solid gray;margin: 5px; ">
								<%= s%>
								<button id="<%=s%>" style="float: right;border-radius:5px;background: blue;color: white;" onclick="window.location.href='viewProfile.jsp?who=<%=s%>'">View Profile</button>
							</div>		
					 <%		
							}
						}
					 %>
				</div>
			</div>
		</div>
			 <script type="text/javascript">
		var request;
function sendInfo(id) {
	if(confirm('Continue !')){
	var url = id;
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
function sendIn(id) {
	var url = id;
	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}
	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var res = request.responseText;
				location.reload()
			}
		};
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function rate(id) {
	
	var rating =window.prompt("Give Rating");
	var url = "rateimage.jsp?idd="+id+"&rate="+rating;
	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}
	try {
		request.onreadystatechange = function() {
			if (request.readyState == 4) {
				var res = request.responseText;
				location.reload()
			}
		};
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}


function filter(){
	var v=document.getElementById("search").value;
	var c =document.getElementsByClassName("sugg");
	for(let item of c){
		if(!(item.id).startsWith(v ,0)){
			item.style.display="none";
		}else{
			item.style.display="";
		}
	}
}
		</script>
		<script type="text/javascript">
  	  		document.getElementById("msg").innerText=<%= request.getParameter("msg")%>
  	  	</script>
	</body>
</html>