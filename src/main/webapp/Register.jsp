<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@include file="templates/Boot.jsp"%>
<style>
.sixty_nin{
 padding: 30px;
margin-left: 50px;
}


</style>
</head>
<body>
	<%@include file="templates/Navbar.jsp"%>
	<br>
	<br>
	<br>
	<div class="container">
	<div class="card sixty_nin" style="width: 58rem;">
		<form action="registers" method="post">
		<%@include file="templates/Mess.jsp" %>
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label> <input
					type="email" name="email" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp"> <small
					id="emailHelp" class="form-text text-muted">We'll never
					share your email with anyone else.</small>
			</div>
			<div class="form-group">
	 			<label for="exampleInputPassword1">User-Name</label> <input
					type="text" name="user" class="form-control"
					id="exampleInputPassword1">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label> <input
					type="password" name="pass" class="form-control"
					id="exampleInputPassword1">
			</div>
			<div class="form-group">
				<textarea name="about" placeholder="About" rows="5" cols="116"></textarea>
			</div>
			<div class="text-center">
			<button type="submit" class="btn btn-primary">Register</button>
			</div>
		</form>
		</div>
	</div>
	<%@include file="templates/Script.jsp"%>
</body>
</html>