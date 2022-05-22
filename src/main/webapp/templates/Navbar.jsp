<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary fixed-top">
	<div class="container">

		<a class="navbar-brand" href="index.jsp">Ecom</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- Side unorder list start  search -->
			<ul class="navbar-nav mr-auto">
				<form class="form-inline my-2 my-lg-0 ">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>

				</form>

			</ul>
			<!-- rSide unorder list end search -->


			<!-- right Side unorder list start -->
			<ul class="navbar-nav ml-auto">
				<%
						User us = (User) session.getAttribute("currentuser");
					if (us == null) {
					%>
				<!-- Drop down button start  2 -->
				<li>
					<!-- Example single danger button -->
					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Login</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="Register.jsp">Register</a> <a
								class="dropdown-item" href="About.jsp">About us</a> 							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="Login.jsp">Login</a>
						</div>
					</div>

				</li>
				<%
					} else {
					%>
                  <li>
					<!-- Example single danger button -->
					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<%=us.getName()%></button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="index.jsp">Home</a> <a
								class="dropdown-item" href="#">Another action</a> 
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="logout">Logout</a>
						</div>
					</div>
				</li>
                   <%
                   	}
                   %>

				<!-- Drop down button END  2 -->

				<!-- Drop down button start  1 -->
				<li>
					<!-- Example single danger button -->
					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							More</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">E-mail</a> <a
								class="dropdown-item" href="index.jsp">Home</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="Coustumer.jsp">24*7 Costumer Support</a>
						</div>
					</div>


				</li>
				<!-- Drop down button END 1 -->


				<!-- Cart button -->
				<li class="nav-item"><a class="nav-link active" href="cart.jsp"
					tabindex="-1" aria-disabled="true"><i
						class="fa fa-shopping-cart" style="font-size: 20px; color: white"></i>Cart</a>
				</li>
				<!-- end Cart button -->

			</ul>
			<!-- right Side unorder list END -->
		</div>

	</div>
</nav>

