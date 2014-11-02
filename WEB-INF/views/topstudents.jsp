<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Top Student</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/bootbox.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script type="text/javascript" src="resources/js/registration.js"></script>
<script type="text/javascript" src="resources/js/changepassword.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#profile").prop("disabled", true);
		$("input").on({
			change : function() {
				this.value = this.value.replace(/\s/g, "");
			}
		});
		$("#changepasswordbutton").click(function() {
			$("#changePasswordModal").modal('show');
			$("#errorChangePassword").html('');
			document.getElementById("changePasswordForm").reset();
		});

		$.ajax({
			url : "resources/js/loginscript.js",
			dataType : "script"
		});
	});
</script>
<style type="text/css">
body {
	height: 850px;
}
</style>
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
					<li class="active"><a href="topstudents">Top students</a></li>
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
	<%@include file="/WEB-INF/views/loginform.jsp"%>
	<%@ include file="/WEB-INF/views/registrationpage.jsp"%>
	<%@ include file="/WEB-INF/views/changepassword.jsp"%>
	<%@ include file="/WEB-INF/views/choosentypepage.jsp"%>
</body>
</html>