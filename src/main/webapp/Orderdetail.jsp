<%@page import="com.entities.User"%>
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
<title>Order Details</title>
</head>
<body>
	<%
    String fname = request.getParameter("fna");
	String lname = request.getParameter("lna");
	String address = request.getParameter("add");
	String city = request.getParameter("cit");
	String state = request.getParameter("sta");
	int zip = Integer.parseInt(request.getParameter("zip"));
	String phone = request.getParameter("pho");
	String alterphone = request.getParameter("aph");
	String checkbox = request.getParameter("che");
	out.println(fname);
	out.println(lname);
	out.println(address);
	out.println(city);
	out.println(state);
	out.println(zip);
	out.println(phone);
	out.println(alterphone);
	out.println(checkbox);	
	%>


</body>
</html>