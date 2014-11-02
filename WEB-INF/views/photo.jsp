<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Photo test</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/dataTables.bootstrap.css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="resources/js/dataTables.bootstrap.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/bootbox.js"></script>
<script type="text/javascript" src="resources/js/loginscript.js"></script>
<style type="text/css">
body {
	height: 850px;
	background-image: url("resources/images/bg.jpg");
	background-position: center;
}

#footer {
	margin-top: 14%;
	background-color: #E0E0E0;
	height: 6%;
}

#photocontent {
	border-radius: 0.6%;
	border: 2px solid #6BAFFF;
	box-shadow: 0px 0px 25px;
	border: 2px solid #6BAFFF;
}
</style>
<script>

$(document).ready(function(){
	$("#loginButton").click(function() {
		$.ajax({
			url : "checklogin",
			type : "post"
		}).done(function(data) {
			if (data == "logined") {
				$.ajax({
					url : "logout",
					type : "post"
				}).done(function(data) {
					window.location.href="index";
				});
			} 
		});
	});
	
	var table = $("#listunittable").DataTable({
		"paging" : true,
		"ordering" : false,
		"info" : false,
		"searching" : false,
		"bLengthChange": false
	});
	table.page.len(4).draw();
	$("#upload").click(function(){
		$("#uploadunittestModal").modal('show');
	});
});
</script>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" style="color: white">Toeic Training</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">Home</a></li>
				</ul>
				<div class="collapse navbar-collapse" style="float: right">
					<ul class="nav navbar-nav">
						<li><a id="registerButton"
							style="cursor: pointer; color: white">Register</a></li>
						<li><a id="loginButton" style="cursor: pointer; color: white">Login</a></li>
						<li class="dropdown"><a id="profile" data-toggle="dropdown"
							style="cursor: pointer; color: white" role="button"></a>
							<ul id="menu2" class="dropdown-menu" aria-labelledby="drop5"
								role="menu">
								<li role="presentation"><a tabindex="-1" role="menuitem"
									id="changepasswordbutton">Change password</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="photocontent"
		style="width: 864px; height: 850px; margin: 70px auto;border-style: solid; background-color: white; opacity: 0.85">
		<div id="level" style="text-align: center;margin: 50px auto"><h2>CHOOSE YOUR PHOTO TEST IN ${level } LEVEL</h2></div>
		<table id="listunittable" style="margin: 0px auto; width: 76%" cellspacing="0" class="table">
						<thead>
							<tr>
								<th></th>								
							</tr>
						</thead>
						<tbody>
			<c:forEach items="${listPhotoTestUnit}" var="photoTestUnit">
				<tr style="margin-top:0px">
					<td>
					<img alt="" src="resources/images/photo/photounit.jpg" height = "140px" width="140px" style="float:left;border:2px solid;">
					<div id="information" style="margin-left:35%">
						<div id="unittitle" style="color: green"><h3>${ photoTestUnit.photoTestUnitName}</h3></div>
						<div id="unitdescript"><h4>${ photoTestUnit.photoTestDescription}</h4></div>
						<a id="starttest" href="dophoto?unit=${ photoTestUnit.photoTestUnitId}">Start your test!</a>
					</div>
				</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<c:if test="${role eq 'admin'}">
		<div style="margin:32%">
		<font>
			<label style="float:left">Input your unit test for this level</label>
			<button id="upload" type="submit" class="btn btn-primary btn" style="margin-left:10px;margin-top:-5px">Upload</button>
			</font>
		</div>
		</c:if>
		
	</div>
	<%@include file="/WEB-INF/views/loginform.jsp"%>
	<c:if test="${role eq 'admin'}">
		<div id="uploadunittestModal" class="modal fade" >
			<div class="modal-dialog" style="width: 680px;">
				<div class="modal-content">
					<div class="modal-body">
						<div class="container" style="width: 100%">
							<form method="post" action="uploadPhotoTest" enctype="multipart/form-data">
								<input hidden name="level" value="${level}">
								<b>Unit test content: </b><input id="input-1" type="file" name="file" required><br>
								<b>Sound of test: </b><input id="input-2" type="file" name="file" required><br>
								<b>Image of test: </b><input id="input-3" type="file" name="file" required>
								<input type="submit" value="Upload" class="btn btn-success" style="float:right;width: 120px;margin-top:10px">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:if>
	<div id="footer">
		<p style="text-align: center;">
			Le Huu Thanh - Nguyen Cong Thanh <br>@Copy right TowThanh.com
		</p>
	</div>
</body>
</html>