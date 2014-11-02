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
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/bootbox.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script type="text/javascript" src="resources/js/registration.js"></script>
<script type="text/javascript" src="resources/js/changepassword.js"></script>
<script type="text/javascript" src="resources/js/loginscript.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
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
				var answers = [];
				var index;
				$(".answer").click(
						function() {
							index = parseInt($("#unitnumber").text(), 10);
							if (index != parseInt($("#maxnumberunit").text(),10)) {
								answers[index - 1] = $(this).text().toLowerCase();
								$("#phototestimg").attr("src",$($($("#unit tr")[index]).find('td')[0]).html());
								$($("#photosound source")[0]).attr("src",$($($("#unit tr")[index]).find('td')[1]).html());
								document.getElementById("photosound").load();
								document.getElementById("photosound").play();
								index++;
								$("#unitnumber").text(index);
							} else {
								answers[index - 1] = $(this).text().toLowerCase();
								var i = 0;
								document.getElementById("photosound").load();
								$(".photoquestion").each(function() {
											var answerofthis = $($(this).find('#answerofthis')).text();
											($(this).find('#' + answers[i])).css('color', '#CC0000');
											($(this).find('#' + answerofthis)).css('color', '#006600');
											i++;
										});
								$("#answerModal").modal('show');
							}
						});
				$("#answerModal").on('hidden.bs.modal', function() {
					window.location.reload(true);
				});
			});
</script>
<style type="text/css">
body {
	height: 750px;
	background-image: url("resources/images/bg.jpg");
	background-position: center;
}

#footer {
	margin-top: 10%;
	background-color: #E0E0E0;
	height: 6%;
}
.answer:hover {
	color: red;
	cursor: pointer;
}
audio{
	width: 100%;
}
#photocontent {
	border-radius: 0.6%;
	border: 2px solid #6BAFFF;
	box-shadow: 0px 0px 25px;
	border: 2px solid #6BAFFF;
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
		style="width: 864px; height: 850px; margin: 70px auto; border-style: solid; background-color: white; opacity: 0.85">
		<div id="level"
			style="text-align: center; margin: 7% auto; color: red">
			<h2>${unitTest}</h2>
		</div>
		<div id="testunit" style="margin-left: 15%;height: 75%;width:75%">
				<div style="font-size: x-large; margin-left: 0%; width: 30%">
					Unit number: <span id="unitnumber">1</span>/<span
						id="maxnumberunit">${number }</span>
				</div>
			<div style="margin-top: 5%; height: 100%;width:100%">
			<div style="float: left; border: 2px solid;height: 55%;width:45%">
				<img id="phototestimg" src="${listPhotoTestUnitContent[0].imgLink}"
					height="100%" width="100%">
					</div>
				<div id="answers" style="margin-left: 60%;">
					<ul>
						<li class="answer">A</li>
						<li class="answer">B</li>
						<li class="answer">C</li>
						<li class="answer">D</li>
					</ul>
				</div>
				<div style="float: right; margin-right: 0%;width:45%">
					<audio controls id="photosound" > <source
						src='${listPhotoTestUnitContent[0].soundLink}' type='audio/mpeg'
						preload='auto'></audio>
				</div>
			</div>
		</div>
		<c:forEach items="${ listPhotoTestUnitContent}"
			var="photoTestUnitContent">
			<table id="unit" hidden>
				<tr>
					<td>${photoTestUnitContent.imgLink }</td>
					<td>${photoTestUnitContent.soundLink }</td>
				</tr>
			</table>
		</c:forEach>
	</div>
	<%@include file="/WEB-INF/views/loginform.jsp"%>
	<%@ include file="/WEB-INF/views/registrationpage.jsp"%>
	<%@ include file="/WEB-INF/views/changepassword.jsp"%>
	<div id="answerModal" class="modal fade">
		<div class="modal-dialog" style="">
			<div class="modal-content">
				<div class="modal-header">
					<div style="color: #FF00FF">
						<h2>Result</h2>
						<img src="resources/images/photo/resultphotoimg.jpg"
							style="float: right; margin-top: -75px" width="100px"
							height="80px">
					</div>
				</div>
				<div class="modal-body">
					<div class="container" style="width: 100%">
						<c:forEach items="${listPhotoTestUnitContent }"
							var="photoTestUnitContent">
							<div class="photoquestion">
								<img class="answerphotoimg"
									src="${photoTestUnitContent.imgLink}"
									style="float: right; margin-right: 2%; margin-top: 2%"
									height="120px" width="120px">
								<h3 style="color: #6633FF">Your photo</h3>
								<h5 id="a">${photoTestUnitContent.answerA}</h5>
								<h5 id="b">${photoTestUnitContent.answerB}</h5>
								<h5 id="c">${photoTestUnitContent.answerC}</h5>
								<h5 id="d">${photoTestUnitContent.answerD}</h5>
								<div hidden id="answerofthis">${photoTestUnitContent.answer}</div>
								<div style="width:70%"><audio controls id="answersound"> <source
									src='${photoTestUnitContent.soundLink}' type='audio/mpeg'
									preload='auto'></audio>
									</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<p style="text-align: center;">
			Le Huu Thanh - Nguyen Cong Thanh <br>@Copy right TowThanh.com
		</p>
	</div>
</body>
</html>