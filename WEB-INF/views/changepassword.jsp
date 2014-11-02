	<div id="changePasswordModal" class="modal fade">
			<div class="modal-dialog" style="width: 36%;">
				<div class="modal-content">
					<div class="modal-body">
						<div class="container" style="width: 100%">
							<form class="form-signin" action="changepassword" method="post"
								role="form" id="changePasswordForm">
								<h2 class="form-signin-heading">Change your password here</h2>
								<input id="yourpassword" style="height: 45px" name="yourpassword"
									type="password" class="form-control" placeholder="Your password"
									required autofocus> <input id="newpassword"
									name="newpassword" style="margin-top: 5px; height: 45px"
									type="password" class="form-control" placeholder="New password"
									required>									
								<input id="renewpassword"
									name="renewpassword" style="margin-top: 5px; height: 45px"
									type="password" class="form-control" placeholder="Re-New password"
									required>
								<div id="errorChangePassword" style="color: red; text-align: center"></div>
								<button id="submitLogin"
									class="btn btn-lg btn-primary btn-block" type="submit" style="margin-top:5px">Change password</button>
							</form>
						</div>
						<!-- /container -->
					</div>
				</div>
			</div>
		</div>