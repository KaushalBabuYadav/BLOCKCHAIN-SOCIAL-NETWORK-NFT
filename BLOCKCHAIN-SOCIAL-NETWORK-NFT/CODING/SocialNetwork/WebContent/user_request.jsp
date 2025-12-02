
<%@page import="com.beans.UserBO"%>
<%@page import="com.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ImageDAO"%><html>
	<head>
	<%
		String C_user =(String)session.getAttribute("user");
         System.out.println("kishan====>"+C_user);
	 %>
		<title>Requests</title>
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
				height: 800px;
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
				<p style="margin: 0px;margin-top: 5px;text-align: center;font-family:cursive;font-size: 20px;background:lime;  ">Friend Requests</p>
				<div style="width:99.6%; height: 94.5%; border: 1px solid gray; margin-top: 10px;">
					<%
						List<String> li =null;
						li =UserDAO.getReq(C_user);
						if(li.size()>0){
							for(String s:li){
					 %>
							<div id="" style="width:95%;height:30px;padding:5px;;border-bottom: 2px solid gray;margin: 5px; ">
								<%= s%>
								<button id="<%=s%>" style="float: right;border-radius:5px;background: blue;color: white;width: 100px;height: 30px;margin-left: 10px;">Delete</button>
								<button id="<%=s%>" style="float: right;border-radius:5px;background: blue;color: white;width: 100px;height: 30px;" onclick="sendInfo('./ac_req?frnd=<%=s %>')">Accept</button>
							</div>		
					 <%		}			
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
							if(!s.equals(C_user)){
					 %>
							<div id="<%=s%>" class="sugg" style="width:90%;height:30px;padding:5px;;border-bottom: 2px solid gray;margin: 5px; ">
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
	var url =id;
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
function filter(){
	var v=document.getElementById("search").value;
	var c =document.getElementsByClassName("sugg");
	for(let item of c)
	{
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