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
				var answers = [];
				var index;
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
				$(".answer").click(
						function() {
							index = parseInt($("#unitnumber").text(), 10);
							if (index != parseInt($("#maxnumberunit").text(),10)) {
								answers[index - 1] = $(this).text().split(")")[0].toLowerCase();
								$($("#sound source")[0]).attr("src",$($($("#unit tr")[index]).find('td')[6]).html());								
								if("${typeListen}" != 'questionresponse'){
									$("#answerd").html($($($("#unit tr")[index]).find('td')[5]).html());
									$("#question").html("<h4>"+($($($("#unit tr")[index]).find('td')[0]).html())+"</h4>");
									$("#answera").html($($($("#unit tr")[index]).find('td')[2]).html());
									$("#answerb").html($($($("#unit tr")[index]).find('td')[3]).html());
									$("#answerc").html($($($("#unit tr")[index]).find('td')[4]).html());
								}else{
									$("#question").html("<h4>Question</h4>");
									$("#answera").html("A");
									$("#answerb").html("B");
									$("#answerc").html("C");
								}
								document.getElementById("sound").load();
								document.getElementById("sound").play();
								index++;
								$("#unitnumber").text(index);
							} else {
								answers[index - 1] = $(this).text().split(")")[0].toLowerCase();
								var i = 0;
								document.getElementById("sound").load();
								$(".shortconversationquestion").each(function() {
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
#question h5{
font-size: 150%
}
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
	color: fuchsia;
	cursor: pointer;
}
audio{
	width: 100%;
}
#shortconversationcontent {
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
	<div id="shortconversationcontent"
		style="width: 864px; height: 850px; margin: 70px auto;border-style: solid; background-color: white; opacity: 0.85">
		<div id="level"
			style="text-align: center; margin: 7% auto; color: red">
			<h2>${unitname}</h2>
		</div>
		<div id="testunit" style="margin-left: 15%;height: 35%;width:75%;border: 1px solid black;">
				<div style="font-size: x-large; margin: 20px auto; width: 30%">
					Unit number: <span id="unitnumber">1</span>/<span
						id="maxnumberunit">${number}</span>
				</div>
			<div style="margin-top: 5%;margin-left:40px; height: 100%;width:100%">
			<c:if test="${typeListen ne 'questionresponse'}">
			<div id = "question">
				<h5>${listShortConversationContent[0].shortConversationQuestion}</h5>
			</div>
			</c:if>
			<c:if test="${typeListen eq 'questionresponse'}">
			<div id = "question">
				<h4>Question</h4>
			</div>
			</c:if>
				<div id="answers" style="margin-left: 8%;">
					<ul>
					<c:if test="${typeListen ne 'questionresponse'}">
						<li class="answer" id="answera">${listShortConversationContent[0].shortConversationAnswerA}</li>
						<li class="answer" id="answerb">${listShortConversationContent[0].shortConversationAnswerB}</li>
						<li class="answer" id="answerc">${listShortConversationContent[0].shortConversationAnswerC}</li>
						<li class="answer" id="answerd">${listShortConversationContent[0].shortConversationAnswerD}</li>
					</c:if>					
					<c:if test="${typeListen eq 'questionresponse'}">
						<li class="answer" id="answera">A</li>
						<li class="answer" id="answerb">B</li>
						<li class="answer" id="answerc">C</li>
						</c:if>
					</ul>
				</div>
				<div style="float: right; margin-right: 60px;margin-top:-10%;width:25%">
					<audio controls id="sound" > <source
						src='${listShortConversationContent[0].soundLink}' type='audio/mpeg'
						preload='auto'></audio>
				</div>
			</div>
		</div>
		<table id="unit" hidden>
			<c:forEach items="${ listShortConversationContent}"
				var="shortConversationContent">
					<tr>
						<td>${shortConversationContent.shortConversationQuestion}</td>
						<td>${shortConversationContent.shortConversationAnswer}</td>
						<td>${shortConversationContent.shortConversationAnswerA}</td>
						<td>${shortConversationContent.shortConversationAnswerB}</td>
						<td>${shortConversationContent.shortConversationAnswerC}</td>
						<td>${shortConversationContent.shortConversationAnswerD}</td>
						<td>${shortConversationContent.soundLink}</td>
					</tr>
			</c:forEach>
		</table>
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
						<c:forEach items="${listShortConversationContent}"
							var="shortConversationContent">
							<div class="shortconversationquestion">
							<c:if test="${typeListen eq 'questionresponse'}">
							<h4>${shortConversationContent.shortConversationQuestion}</h4>
								<h5 id="a">${shortConversationContent.shortConversationAnswerA}</h5>
								<h5 id="b">${shortConversationContent.shortConversationAnswerB}</h5>
								<h5 id="c">${shortConversationContent.shortConversationAnswerC}</h5>
								<div hidden id="answerofthis">${shortConversationContent.shortConversationAnswer}</div>
								<div style="width:70%"><audio controls id="answersound"> <source
									src='${shortConversationContent.soundLink}' type='audio/mpeg'
									preload='auto'></audio>
									</div>
							</c:if>
							<c:if test="${typeListen ne 'questionresponse'}">							
							<h4>${shortConversationContent.shortConversationQuestion}</h4>
								<h5 id="a">${shortConversationContent.shortConversationAnswerA}</h5>
								<h5 id="b">${shortConversationContent.shortConversationAnswerB}</h5>
								<h5 id="c">${shortConversationContent.shortConversationAnswerC}</h5>
								<h5 id="d">${shortConversationContent.shortConversationAnswerD}</h5>
								<div hidden id="answerofthis">${shortConversationContent.shortConversationAnswer}</div>
								<div style="width:70%"><audio controls id="answersound"> <source
									src='${shortConversationContent.soundLink}' type='audio/mpeg'
									preload='auto'></audio>
									</div>
							</c:if>
								
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