<html>
	<head>
		<title>Recommendations</title>
		<style type="text/css">
			#main{
				border: 2px solid gray;
				width: 98%;
				height: 75%;
				margin-right: 10px;
				padding: 10px;
			}
			#type1{
				box-shadow:10px 10px 10px 10px #ccc;
				border: 5px solid red;
				width: 	400px;
				height: 180px;
				float: left;
				margin-left: 80px;
				margin-top: 30px;
			}
			#type2{
				box-shadow:10px 10px 10px 10px #ccc;
				border: 5px solid red;
				width: 	400px;
				height: 180px;
				float: right;
				margin-right: 80px;
				margin-top: 30px;
			}
			#type3{
				box-shadow:10px 10px 10px 10px #ccc;
				border: 5px solid red;
				width: 	400px;
				height: 180px;
				float: left;
				margin-left: 350px;
				margin-top: 30px;
			}
			p{
				margin: 0px;
				margin-top:5px;
				text-align:center;font-family:cursive;
				font-size: 20px;
				color:blue;
				background:lightyellow; 
			}
			button{
				width: 200px;
				height: 40px;
				background:lime;
				color:white;
				border-radius:10px;
				margin-top: 60px;
				font-family:cursive;
				font-size:20px;
				margin-left: 100px;
			}
		</style>
	</head>
	<body>
		<%@include file="user_header.jsp" %>
		<br/><hr/>
		<div id="main">
			<p>Image Recommendations</p>
			<div id="type1">
			<p>Upload History</p>
			<button type="button" onclick="window.location.href='user_view_recomm_uh.jsp'">Click here</button>
			</div>
			<div id="type2">
			<p>Image Likes</p>
			<button type="button" onclick="window.location.href='user_view_recomm_li.jsp'">Click here</button>
			</div>
			<div id="type3">
			<p>Image Ratings</p>
			<button type="button" onclick="window.location.href='user_view_recomm_rl.jsp'">Click here</button>
			</div>
		</div>
	</body>
</html>