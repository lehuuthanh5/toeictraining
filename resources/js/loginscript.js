//when button login clicked
$("#loginButton").click(function() {
	// reset form login and error message
	document.getElementById("loginForm").reset();
	$("#errorLogin").html('');
	// check login status
	$.ajax({
		url : "checklogin",
		type : "post"
	}).done(function(data) {
		// if user was logged into system, call log out controller and then show
		// login button and register button
		// else (user was not logged into system) show login modal
		if (data == "logined") {
			$.ajax({
				url : "logout",
				type : "post"
			}).done(function(data) {
				$("#profile").html('');
				$("#loginButton").text("Login");
				$("#registerButton").show();
				$("#profile").prop( "disabled", true );
			});
			
		} else {
			$("#loginModal").modal('show');
		}
	});
});
// check login status
// if user was log, hide register button and show sign out button, get user name to display
$.ajax({
	url : "checklogin",
	type : "post"
}).done(function(data) {
	if (data == "logined") {
		$("#loginButton").text("Sign out");
		$("#registerButton").hide();
		//this ajax use to get name of user to display
		$.ajax({
			url : "getusernamesession",
			type : "post"
		}).done(function(data) {			
			$.ajax({
				url : "getusername",
				type : "post",
				data : "username=" + data
			}).done(function(data) {	
				$("#profile").append("<b>"+data+"</b>");
				$("#profile").prop("disabled", false);
			});

		});
	}else{
		$("#profile").prop("disabled", true);
	}
});
// login form submit event
// call login controller and this controller return 3 option value
// "guest" if wrong user or password
// "admin" if user is system admin
// "student" if user is system student
$('#loginForm').bind('submit', function(e) {
	e.preventDefault();
	$("#submitLogin").css('disable');
	$.ajax({
		url : 'login',
		type : 'post',
		data : $('#loginForm').serialize()
	}).done(function(data) {
		if (data == "guest") {
			$("#errorLogin").html('');
			$("#errorLogin").append("<b>Wrong user name or password</b>");
		} else {
			$("#loginModal").modal('hide');
			$("#loginButton").text("Sign out");
			$("#registerButton").hide();
			$.ajax({
				url : "getusernamesession",
				type : "post"
			}).done(function(data) {			
				$.ajax({
					url : "getusername",
					type : "post",
					data : "username=" + data
				}).done(function(data) {	
					$("#profile").append("<b>"+data+"</b>");
					$("#profile").prop( "disabled", false );
				});

			});
		}
	});

});