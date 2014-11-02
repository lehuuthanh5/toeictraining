
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="registerModal" class="modal fade" style="height: 770px;">
	<div class="modal-dialog" style="width: 700px;">
		<div class="modal-content">
			<div class="modal-body">
				<div style=" margin-left: 25px;width: 100%">
					<form:form id="registrationForm" action="registeruser" method="post"
						class="registrationForm" commandName="user">
						<div style="text-align: center">
							<h2>Register to ToeicTraining</h2>
						</div>
						<div id="usernamegr" class="rp">
							<label style="float: left; margin-top: 0.7%">User name:</label> <input
								id="usernamerp" style="height: 5%; width: 45%; margin-left: 25%;"
								name="usernamerp" type="text" class="form-control" required
								autofocus>
						</div>
						<div id="usererror"
							style="float: right; margin-top: -6%; margin-right: 13%; color: red"></div>
						<div id="passwordgr" class="rp">
							<label style="float: left; margin-top: 1.2%">Password:</label> <input
								id="passwordrp"
								style="height: 5%; width: 40%; margin-top: 0.5%; margin-left: 25%"
								name="passwordrp" type="password" class="form-control" required>
						</div>
						<div id="repasswordgr" class="rp">
							<label style="float: left; margin-top: 1.2%">Re-Password:</label>
							<input id="repasswordrp"
								style="height: 5%; width: 40%; margin-top: 0.5%; margin-left: 25%"
								name="repasswordrp" type="password" class="form-control"
								required>
						</div>
						<div id="repassworderror"
							style="float: right; margin-top: -6%; margin-right: 8%; color: red"></div>
						<div id="firstnamegr" class="rp">
							<label style="float: left; margin-top: 1.2%">First name:</label>
							<input id="firstnamerp"
								style="height: 5%; width: 50%; margin-top: 0.5%; margin-left: 25%"
								name="firstnamerp" type="text" class="form-control" required>
						</div>
						<div id="lastnamegr" class="rp">
							<label style="float: left; margin-top: 1.2%">Last name:</label> <input
								id="lastnamerp"
								style="height: 5%; width: 50%; margin-top: 0.5%; margin-left: 25%"
								name="lastnamerp" type="text" class="form-control" required>
						</div>
						<div id="birthdaygr" class="rp">
							<label style="float: left; margin-top: 1.2%">Birthday:</label> <input
								id="birthdayrp"
								style="height: 5%; width: 35%; margin-top: 0.5%; margin-left: 25%"
								name="birthdayrp" type="text" placeholder="dd/mm/yyyy"
								class="form-control" required>
						</div>
						<div id="emailgr" class="rp">
							<label style="float: left; margin-top: 0.7%">Email:</label> <input
								id="emailrp"
								style="height: 5%; width: 65%; margin-top: 0.5%; margin-left: 25%"
								name="emailrp" type="email" class="form-control" required>
						</div>
						<input id="submitrp"
							style="height: 40px; width: 120px; margin-top: 7px; margin-left: 180px"
							value="Submit" type="submit" class="btn btn-success btn-default">
						<input id="resetrp"
							style="height: 40px; width: 120px; margin-top: 7px; margin-left: 5px"
							value="Reset" type="reset" class="btn btn-danger btn-default">
					</form:form>
				</div>
				<!-- /container -->
			</div>
		</div>
	</div>
</div>