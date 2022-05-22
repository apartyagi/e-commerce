<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>cart</title>
<%@include file="templates/Boot.jsp"%>
<link rel="stylesheet" href="templates/Boat.css">

</head>
<body>
	<%@include file="templates/Navbarcat.jsp"%>
	<br>
	<br>
      <div class="container mt-5 back">
        
      <div class="card-bod">      
      
      </div>
      
      <div>
      <div class="shadow p-3 mb-5 bg-white rounded text-right">
       <p class="amnt text-left font-weight-bolder"></p>
      <button class="btn btn-outline-primary plo" onclick="transfer()">Place Order</button></div>
      </div>
       
    </div>    
	<%@include file="templates/Script.jsp"%>
	<div id="snackbar">Some text some message..</div>
	
	
</body>
</html>