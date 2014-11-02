$(document)
		.ready(
				function() {
					$("#changePasswordForm")
							.submit(
									function(e) {
										//check if re-password is wrong, show error message  
										if ($("#renewpassword").val() != $(
												"#newpassword").val()) {
											$("#errorChangePassword").html('');
											$("#errorChangePassword").append(
													'<b>Wrong re-password</b>');
										} else {
											$("#errorChangePassword").html('');
										}
										if ($("#errorChangePassword").html() == '') {
											$
													.ajax(
															{
																url : "changepassword",
																type : "post",
																data : $(
																		"#changePasswordForm")
																		.serialize()
															})
													.done(
															function(data) {
																if (data == "success") {
																	$(
																			"#changePasswordModal")
																			.modal(
																					'hide');
																	bootbox.alert("Your password was changed!", function() {
																		});
																}
																if (data == "wrongpassword") {
																	$(
																			"#errorChangePassword")
																			.append(
																					'<b>Wrong user password</b>');
																}
															});
										}
										e.preventDefault();
									});
					$("#yourpassword").focusin(function() {
						$("#errorChangePassword").html('');
					});
					$("#renewpassword").focusout(
							function() {
								if ($("#renewpassword").val() != $(
										"#newpassword").val()) {
									$("#errorChangePassword").html('');
									$("#errorChangePassword").append(
											'<b>Wrong re-password</b>');
								} else {
									$("#errorChangePassword").html('');
								}
							});
				});
