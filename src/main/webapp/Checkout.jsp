<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	User users = (User) session.getValue("currentuser");
if (users == null) {
	response.sendRedirect("Login.jsp");
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="templates/Boot.jsp"%>
<link rel="stylesheet" href="templates/Boat.css">
</head>
<body>
	<%@include file="templates/Navbarcat.jsp"%>
	<br>
	<br>
	<hr>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-8">
			<div class="shadow-sm p-3 mb-5 bg-white rounded">
				<div class="container">
					<form action="Orderdetail.jsp" method="post">
						<div class="form-row">
							<div class="col-md-6 mb-3">
								<label for="validationDefault01">First name</label> <input
									type="text" class="form-control" name="fna" placeholder="Ram" required>
							</div>
							<div class="col-md-6 mb-3">
								<label for="validationDefault02">Last name</label> <input
									type="text" class="form-control" name="lna" placeholder="Tyagi" required>
							</div>
						</div>
						<div class="col-md-12 mb-3">
							<label for="validationDefault02">Address</label> <input
								type="text" class="form-control" name="add"
								placeholder="H-no, Street no ,locality ,landmark" required>
						</div>
						<div class="form-row">
							<div class="col-md-6 mb-3">
								<label for="validationDefault03">City</label> <input type="text"
									class="form-control" name="cit" required>
							</div>
							<div class="col-md-3 mb-3">
								<label for="validationDefault04">State</label> <select
									class="custom-select" name="sta" required>
									<option selected disabled value="">Choose...</option>
									<option>Andhra Pradesh(Hyderabad)</option>
									<option>Arunachal Pradesh</option>
									<option>Assam</option>
									<option>Bihar</option>
									<option>Chhattisgarh</option>
									<option>Goa</option>
									<option>Gujarat</option>
									<option>Haryana</option>
									<option>Himachal Pradesh</option>
									<option>Jammu & Kashmir</option>
									<option>Jharkhand</option>
									<option>Karnataka</option>
									<option>Kerala</option>
									<option>Madhya Pradesh</option>
									<option>Maharashtra</option>
									<option>Manipur</option>
									<option>Meghalaya</option>
									<option>Mizoram</option>
									<option>Nagaland</option>
									<option>Odisha</option>
									<option>Punjab</option>
									<option>Rajasthan</option>
									<option>Sikkim</option>
									<option>Tamil Nadu</option>
									<option>Telangana</option>
									<option>Tripura</option>
									<option>Uttarakhand</option>
									<option>Uttar Pradesh</option>
									<option>West Bengal</option>
								</select>
							</div>
							<div class="col-md-3 mb-3">
								<label for="validationDefault05">Zip</label> <input
									type="number" name="zip" class="form-control" required>
							</div>
							<div class="col-md-3 mb-3">
								<label for="validationDefault05">Phone no</label> <input
									type="number" name="pho" class="form-control" required>
							</div>
							<div class="col-md-3 mb-3">
								<label for="validationDefault05">Alternate Phone no</label> <input
									type="number" name="aph" class="form-control" required>
							</div>
						</div>
						<div class="form-group">
						 <div class="custom-control custom-radio custom-control-inline">
  <input type="radio" id="customRadioInline1" name="che" value="home" class="custom-control-input">
  <label class="custom-control-label" for="customRadioInline1">Home (All day Delivery)</label>
</div>
<div class="custom-control custom-radio custom-control-inline">
  <input type="radio" id="customRadioInline2" value="Work" name="che" class="custom-control-input">
  <label class="custom-control-label" for="customRadioInline2">Work (deliver between  10AM -5PM)</label>
</div>
						
						</div>
						
					
				</div>
			</div>
			</div>
			<div class="col-sm-4 shadow p-3 mb-5 bg-white rounded ">
				<h3>Order values</h3>
				<div class="">
				<div class="card-bod ">
					<!-- Set dynaminic value usingg jquery -->
				</div>
				<div class="">
				 <button class="btn btn-outline-primary plo"  type="submit">Place Order</button></div>
				 </form>
				</div>
                </div>
			</div>
		</div>
	
	<div id="snackbar">Some text some message..</div>
	<%@include file="templates/Script.jsp"%>
	<script type="text/javascript" src="templates/changer.js"></script>

</body>
</html>