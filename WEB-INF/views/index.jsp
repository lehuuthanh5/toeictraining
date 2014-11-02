<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/bootbox.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<title>Toeic Training</title>
<style>
body {
	height: 901px;
}

.rp {
	width: 100%;
}

#FlashCards:HOVER, #FlashCards:focus, #FlashCards:active, .imglogo:hover,
	.imglogo:focus, .imglogo:active {
	transform: scale(1.3);
	color: white;
	filter: alpha(opacity = 100);
	opacity: 1.0;
	cursor: pointer;
}

#FlashCards, .imglogo {
	opacity: 0.8;
	display: inline-block;
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-property: transform;
	transition-property: transform;
	-webkit-transform: translateX(0);
	transform: translateX(0);
	box-shadow: 0 0 1px rgba(0, 0, 0, 0);
}

.badge {
	background-color: #FF0000;
}

#footer {
	background-color: #E0E0E0;
	height: 51px;
}

.list-group-item:HOVER {
	background-color: #99FFFF;
}

.containerindex {
	background-image: url("resources/images/bg_03.jpg");
	background-repeat: no-repeat;
	background-position: center;
	margin: 0px auto;
	width: 864px;
	height: 850px;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".chooselevel").click(function(event) {
							var level = $(this).html();
							window.location.href = "flashcard?level=" + level;
						});
						$(".choosetype")
								.click(
										function(event) {
											var level = $("#toeiclevel").text()
													.split(" ")[1].trim();
											if ($(this).text().trim() == "Photo") {
												window.location.href = "photo?level="
														+ level;
											}
											if ($(this).text().trim() == "Short conversation") {
												window.location.href = "shortconversation?level="
														+ level
														+ "&type=shortconversation";
											}
											if ($(this).text().trim() == "Short Talk") {
												window.location.href = "shortconversation?level="
														+ level
														+ "&type=shorttalk";
											}
											if ($(this).text().trim() == "Question-Response") {
												window.location.href = "shortconversation?level="
														+ level
														+ "&type=questionresponse";
											}
										});
						$("input").on({
							change : function() {
								this.value = this.value.replace(/\s/g, "");
							}
						});
						$("#changepasswordbutton").click(
								function() {
									$("#changePasswordModal").modal('show');
									$("#errorChangePassword").html('');
									document.getElementById(
											"changePasswordForm").reset();
								});

						$.ajax({
							url : "resources/js/loginscript.js",
							dataType : "script"
						});
						$("#FlashCards")
								.click(
										function(event) {
											var toeiclevel = event.target.id;
											$
													.ajax({
														url : "checklogin",
														type : "post"
													})
													.done(
															function(data) {
																if (data != "logined") {
																	$(
																			"#loginModal")
																			.modal(
																					'show');
																} else {
																	$(
																			"#flashCardModal")
																			.modal(
																					'show');
																	$(
																			"#flashcardlevel")
																			.html(
																					'');
																	$(
																			"#flashcardlevel")
																			.append(
																					"<b>"
																							+ toeiclevel
																							+ "</b>");
																}
															});

										});
						$(".imglogo").click(
								function(event) {
									var toeiclevel = event.target.id;
									$.ajax({
										url : "checklogin",
										type : "post"
									}).done(
											function(data) {
												if (data != "logined") {
													$("#loginModal").modal(
															'show');
												} else {
													$("#choosenModal").modal(
															'show');
													$("#toeiclevel").html('');
													$("#toeiclevel").append(
															"<b>" + toeiclevel
																	+ "</b>");
												}
											});
								});
					});
</script>
<script type="text/javascript" src="resources/js/registration.js"></script>
<script type="text/javascript" src="resources/js/changepassword.js"></script>
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
					<li class="active"><a href="index.jsp">Home</a></li>
				</ul>
				<div class="collapse navbar-collapse" style="float: right">
					<ul class="nav navbar-nav">
						<li><a id="registerButton"
							style="cursor: pointer; color: white">Register</a></li>
						<li><a id="loginButton" style="cursor: pointer; color: white">Login</a></li>
						<li class="dropdown"><a id="profile" data-toggle="dropdown"
							style="cursor: pointer; color: white"></a>
							<ul class="dropdown-menu" role="menu">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									id="changepasswordbutton">Change password</a></li>

							</ul></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="containerindex" id="container">
		<div id="350500" title="FlashCards"
			style="margin-top: 136px; margin-left: 17px; float: left">
			<img src="resources/images/350-500.jpg" alt="Help" id="FlashCards"
				height="230" width="230">
		</div>
		<div id="350500"
			style="margin-top: 136px; margin-right: 90px; float: right;"
			title="Test Toeic 350-500">
			<img src="resources/images/350-500.png" alt="Toeic 350 - 500"
				id="Toeic 350-500" height="230" width="230" class="imglogo">
		</div>
		<div id="500700"
			style="margin-top: 505px; margin-left: -180px; float: left;"
			title="Test Toeic 500-700">
			<img src="resources/images/500-700.jpg" alt="Toeic 500 - 700"
				id="Toeic 500-700" height="230" width="230" class="imglogo">
		</div>
		<div id="700900"
			style="margin-top: -260px; margin-left: 550px; float: left;"
			title="Test Toeic 700-900">
			<img src="resources/images/700-900.png" alt="Toeic 700 - 900"
				id="Toeic 700-900" height="230" width="230" class="imglogo">
		</div>
		<!-- Login modal -->
		<%@include file="/WEB-INF/views/loginform.jsp"%>
		<%@ include file="/WEB-INF/views/registrationpage.jsp"%>
		<%@ include file="/WEB-INF/views/changepassword.jsp"%>
		<%@ include file="/WEB-INF/views/choosentypepage.jsp"%>


	</div>
	<div id="footer">
		<p style="text-align: center;">
			Le Huu Thanh - Nguyen Cong Thanh <br>@Copy right TowThanh.com
		</p>
	</div>
</body>
</html>






