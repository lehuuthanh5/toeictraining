$(document)
		.ready(
				function() {
					// when user click register button, show registration modal
					$("#registerButton").click(function() {
						document.getElementById("registrationForm").reset();
						$("#usererror").html('');
						$("#repassworderror").html('');
						$("#registerModal").modal('show');
					});
					// set input date field
					$("#birthdayrp").datepicker({
						changeMonth : true,
						changeYear : true
					});
					// when user name field lost focus, valid user name (user
					// name exist?)
					$("#usernamerp")
							.change(
									function() {
										// this ajax use to check username, if
										// username exist show message to user
										$
												.ajax(
														{
															url : "checkusername",
															type : "post",
															data : "usernamerp="
																	+ $(
																			"#usernamerp")
																			.val()
														})
												.done(
														function(data) {
															if (data == "1") {
																$("#usererror")
																		.html(
																				'');
																$("#usererror")
																		.append(
																				"<img src='resources/images/wrong.png' height='24' width='24'><b>Existent</b>");
															} else {
																$("#usererror")
																		.html(
																				'');
															}
														});
									});
					// check re-password equal with password field?
					$("#repasswordrp")
							.focusout(
									function() {
										if ($("#passwordrp").val() != $(
												"#repasswordrp").val()) {
											$("#repassworderror").html('');
											$("#repassworderror")
													.append(
															"<img src='resources/images/wrong.png' height='24' width='24'><b>Wrong re-pass</b>")
										} else {
											$("#repassworderror").html('');
										}
									});
					// registrationFrom submit method
					$("#registrationForm")
							.submit(
									function(e) {
										if ($("#passwordrp").val() != $(
												"#repasswordrp").val()) {
											$("#repassworderror").html('');
											$("#repassworderror")
													.append(
															"<img src='resources/images/wrong.png' height='24' width='24'><b>Wrong re-pass</b>")
										} else {
											$("#repassworderror").html('');
										}
										// if have no error occur, call
										// registeruser controller to register
										// new user
										if ($("#usererror").html() != ''
												|| $("#repassworderror").html() != '') {
										} else {
											$
													.ajax(
															{
																url : "registeruser",
																type : "post",
																data : $(
																		'#registrationForm')
																		.serialize()
															})
													.done(
															// if registration
															// is successful,
															// login new user to
															// system
															function(data) {
																if (data != "") {

																	$
																			.ajax(
																					{
																						url : 'login',
																						type : 'post',
																						data : "username="
																								+ $(
																										"#usernamerp")
																										.val()
																								+ "&password="
																								+ $(
																										"#passwordrp")
																										.val()
																					})
																			.done(
																					function(
																							data) {
																						//get name of user to display
																						$
																								.ajax(
																										{
																											url : "getusernamesession",
																											type : "post"
																										})
																								.done(
																										function(
																												data) {
																											$
																													.ajax(
																															{
																																url : "getusername",
																																type : "post",
																																data : "username="
																																		+ data
																															})
																													.done(
																															function(
																																	data) {
																																$(
																																		"#profile")
																																		.append(
																																				"<b>"
																																						+ data
																																						+ "</b>");
																															});

																										});
																						$(
																								"#registerModal")
																								.modal(
																										'hide');
																						$(
																								"#loginButton")
																								.text(
																										"Sign out");
																						$(
																								"#registerButton")
																								.hide();
																						$(
																								"#profile")
																								.prop(
																										"disabled",
																										false);
																					});
																} else {
																	alert("false");
																}
															});
										}
										e.preventDefault();
									});
				});