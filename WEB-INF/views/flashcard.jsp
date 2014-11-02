<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FlashCard Pack</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/bootbox.js"></script>
<link rel="stylesheet" href="resources/css/jquery-ui.css">
<script type="text/javascript" src="resources/js/registration.js"></script>
<script type="text/javascript" src="resources/js/changepassword.js">
</script>
<script type="text/javascript" src="resources/js/loginscript.js"></script>
<script>

$(document).ready(function() {

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
	$("#upload").click(function(){
		$('#uploadFlashCardModal').modal('show');
	});
	var showhelp = false;
	$("#profile").prop("disabled", true);
	//set submitflag true (disable submit form)
	var submitflag=true;
	$("#changepasswordbutton").click(function() {
		$("#changePasswordModal").modal('show');
		$("#errorChangePassword").html('');
		document.getElementById("changePasswordForm").reset();
	});

	//when form submit add class flipable
	$("#flashcardshowanswer").click(function() {
		$("#flipid").addClass('flipable');
	});
	//submit form event
	$("#flashcardform").submit(function(e) {
		e.preventDefault();
		if(submitflag == true){
			return;
		}
		//check answer
		if($("#inputword").val() == $("#backword").text()){
			var correctanswer = parseInt($("#correctanswer").text(),10);
			correctanswer++;
			$("#correctanswer").text(correctanswer+'/');
			$("#correct").trigger('play');
			submitflag = true;
			$("#nextflashcard").trigger('click');
		}
		else{
			$("#wrong").trigger('play');
		}
		$("#inputword").val('');
		if(!showhelp){
			$('#wordenglishmean').attr('hidden','');
		}else{
			
		}
	});
	//hover back face of flashcard event
	$("#backflashcard").hover(function(){
		$("#backcardsound").trigger('play');
	});
	$("#flashcardhelper").click(function(){
		$('#wordenglishmean').removeAttr('hidden');
		showhelp = true;
	});
	//click next flashcard
	$("#nextflashcard").click(function() {
		$.ajax({
			url : "getrandomflashcard",
			type : "post",
			data : {"level": $("#flashcardlevel").text()},
			dataType:"json"
		}).done(function(data) {
			submitflag = false;
			var numberofquestion = parseInt($("#numberofquestion").text(),10);
			numberofquestion++;
			$("#numberofquestion").text(numberofquestion);
			$("#nextflashcard").text("Next");
			$("#flipid").removeClass('flipable');
			$("#word").html('');
			$("#word").append("<h3><strong>"+data.flashCardWord+"</strong></h3>");
			$("#wordpronunciation").html('');
			$("#wordpronunciation").append("<h4><i>"+data.flashCardWordPronunciation+"</i></h4>");
			$("#wordenglishmean").html('');
			$('#wordenglishmean').attr('hidden','');
			$("#wordenglishmean").append("<h5 id='englishmean' style='color:#FF0000;padding:5px;font-size:120%'>"+data.flashCardWordEnglishMeaning+"</h5>");
			$("#imageword").attr("src",data.flashCardWordImage);				
			$(".flashcardsound").html('');
			$(".flashcardsound").append("<source src='"+data.flashCardWordSound+"' type='audio/mpeg' preload='auto'>");
			document.getElementById("frontfacesound").load();
			document.getElementById("backcardsound").load();
			$("#backword").html('');
			$("#backword").append(data.flashCardWordVietMeaning);
			$("#inputword").focus();
		});
	});
	
});
</script>
<style type="text/css">
body {
	height: 850px;
	background-image: url("resources/images/bg.jpg");
	background-position: center;
}

#footer {
	margin-top: 8%;
	background-color: #E0E0E0;
	height: 6%;
}

#flashcardcontent {
	border-radius: 0.6%;
	border: 2px solid #6BAFFF;
	box-shadow: 0px 0px 25px;
	border: 2px solid #6BAFFF;
}
</style>
<style>
/* entire container, keeps perspective */
.flip-container {
	perspective: 1000;
}
/* flip the pane when hovered */
.flipable:hover .flipper {
	transform: rotateY(180deg);
}

.flip-container, .front, .back {
	width: 500px;
	height: 250px;
	border-radius: 2%;
	border-top-left-radius: 25%;
}

.flip-container {
	margin-left: 20%;
}

/* flip speed goes here */
.flipper {
	transition: 0.6s;
	transform-style: preserve-3d;
	position: relative;
}

/* hide back of pane during swap */
.front, .back {
	backface-visibility: hidden;
	position: absolute;
	top: 0;
	left: 0;
	background-image: url("resources/images/flashcardimg/flashimg-bg.jpg");
	background-position: center;
	border: 2px solid #6BAFFF;
}

/* front pane, placed above back */
.front {
	z-index: 2;
	/* for firefox 31 */
	transform: rotateY(0deg);
}

/* back, initially hidden pane */
.back {
	transform: rotateY(180deg);
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
	<div id="flashcardcontent"
		style="width: 864px; height: 850px; margin:70px auto; border-style: solid; background-color: white; opacity: 0.85">
		<div style="margin-left: 1%">
			<div id="flashcardheader" style="margin-top: 4%; text-align: left">
				<img src="resources/images/flashcardimg/flashcard.jpg" width="25%"
					height="25%">
				<div id="guide" class="text-info"
					style="float: right; margin-right: 4%; margin-top: 2%">
					<h5 style="font-size: 114%">
						<strong>Welcome to FlashCard Park! In this site, we'll
							show to you flashcards <br> one by one. With one, it have
							front and back face. In front face, <br>we give word and
							some information and your work is inputting meaning <br>of
							that word in VietNamese, then submit and you can see back face of<br>flashcard
						</strong>
					</h5>
					******************************************************************************************************
				</div>
			</div>
			<table style="margin-left: 20%; margin-top: 5%;">
				<tr>
					<td>
						<div id="level">
							<h3 style="color: black">
								<strong>Your level: <span id="flashcardlevel"
									style="color: red">${level}</span></strong>
							</h3>
						</div>
					</td>
					<td>
						<div id="score" style="margin-left: 65px">
							<h3 style="color: black">
								<strong>Your score: <span id="correctanswer" style="color: green">0/</span><span id="numberofquestion">0</span></strong>
							</h3>
						</div>
					</td>
				</tr>
			</table>
			<div id="formcontrol" style="margin-top: 5%">
				<form id="flashcardform">
					<div id="flipid" class="flip-container" ontouchstart="this.classList.toggle('hover');">
						<div class="flipper">
							<div class="front" id="frontflashcard">
								<div id="word" style="text-align: center">
									<h3>
										<strong>Start flashcard</strong>
									</h3>
								</div>
								<div id="wordpronunciation" style="text-align: center; color: green">
									<h4>
										<i>Good luck</i>
									</h4>
								</div>
								<div id="wordimage" style="height: 135px; width: 135px; border: 1px solid; margin-left: 20px; margin-top: 12px">
									<img id="imageword" width="100%" height="100%" src="">
								</div>
								<div style="height: 100px; width: 270px; border: 1px solid; margin-right: 20px; float: right; margin-top: -135px;">
									<div hidden id="wordenglishmean">
									</div>
								</div>
								<div id="wordenglishmean"
									style="height: 25px; width: 270px; border: 1px solid; margin-right: 20px; float: right; margin-top: -26px">
									<audio controls class="flashcardsound" id="frontfacesound" style="width:100%;height:50%;">
									</audio>
								</div>
							</div>
							<div class="back" id="backflashcard">
								<div id="backword" style="text-align: center;margin-top:23%;font-size: 150%">
									<h3>
										<strong>Your answer</strong>
									</h3>
								</div>
								<audio id="backcardsound" class="flashcardsound" style="width:100%;height:50%;">		
									</audio>
							</div>
						</div>
					</div>
					<input type="text" class="form-control" id="inputword"
						name="inputword" placeholder="Type your answer"
						style="margin-top: 5%; width: 45%; margin-left: 22%;">
					
				</form>
				<div class="btn-group-vertical" style="float:right; margin-top:-38%;margin-right:1%;">
						<button class="btn btn-default" id="flashcardhelper">Helper</button>
						<button class="btn btn-default" id="flashcardshowanswer">Show Answer</button>
					</div>
				<button class="btn btn-warning" id="nextflashcard"
						style="float: right; margin-right: 25%; margin-top: -33px">Start</button>
			</div>
		</div>
		<c:if test="${role eq 'admin'}">
		<div style="margin:16%">
		<font>
			<label style="float:left">Input your flashcards to this level</label>
			<button id="upload" type="submit" class="btn btn-primary btn" style="margin-left:10px;margin-top:-5px">Upload</button>
			</font>
		</div>
		</c:if>
	</div>
	
	<%@include file="/WEB-INF/views/loginform.jsp"%>
	<%@ include file="/WEB-INF/views/registrationpage.jsp"%>
	<%@ include file="/WEB-INF/views/changepassword.jsp"%>
	<%@ include file="/WEB-INF/views/choosentypepage.jsp"%>
	<c:if test="${role eq 'admin'}">
		<div id="uploadFlashCardModal" class="modal fade" >
			<div class="modal-dialog" style="width: 680px;">
				<div class="modal-content">
					<div class="modal-body">
						<div class="container" style="width: 100%">
							<form method="post" action="uploadflashcard" enctype="multipart/form-data">
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
	<audio id="correct">
	<source src="resources/sound/correctanswer.mp3" type='audio/mpeg' >
	</audio>
	<audio id="wrong">
	<source src="resources/sound/wronganswer.mp3" type='audio/mpeg' >
	</audio>
	<div id="footer">
		<p style="text-align: center;">
			Le Huu Thanh - Nguyen Cong Thanh <br>@Copy right TowThanh.com
		</p>
	</div>
</body>
</html>