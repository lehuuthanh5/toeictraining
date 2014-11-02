	<div id="loginModal" class="modal fade" >
			<div class="modal-dialog" style="width: 450px;">
				<div class="modal-content">
					<div class="modal-body">
						<div class="modelcontainer" style="width: 390px">
							<form class="form-signin" action="login" method="post"
								role="form" id="loginForm">
								<h2 class="form-signin-heading">Please sign in</h2>
								<input id="username" style="height: 45px" name="username"
									type="text" class="form-control" placeholder="User name"
									required autofocus> <input id="password"
									name="password" style="margin-top: 2px; height: 45px"
									type="password" class="form-control" placeholder="Password"
									required> <label class="checkbox"
									style="margin-left: 25px"> <input type="checkbox"
									value="remember-me"> Remember me
								</label>
								<div id="errorLogin" style="color: red; text-align: center"></div>
								<button id="submitLogin"
									class="btn btn-lg btn-primary btn-block" type="submit">Sign
									in</button>
							</form>
						</div>
						<!-- /container -->
					</div>
				</div>
			</div>
		</div>