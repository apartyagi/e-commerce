<%@page import="com.item.Products"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>opener</title>
<%@include file="templates/Boot.jsp"%>
<link rel="stylesheet" href="templates/Boat.css">
</head>
<body>
<%@include file="templates/Navbar.jsp"%>
  <%
    int code=Integer.parseInt(request.getParameter("coders"));
      out.println(code);
 
      Configuration cfg=new Configuration();
 	 cfg.configure("hibernate.cfg.xml");
 	SessionFactory fact=cfg.buildSessionFactory();
 	 Session ses=fact.openSession();
 	 
 	 String kd="from Products where pid = :ps";

 	 Query query=ses.createQuery(kd);
 	    query.setParameter("ps", code);
 	 
 	  List <Products> pal=(List <Products>) query.list();
      
 	  ses.close();
      
      %>
  
   <%
 
   for(Products pas:pal){
  
   %>
    <div id="snackbar">Some text some message..</div>
     <div class="jumbotron">
     <div class="text-center shadow p-3 mb-5 bg-white rounded">
       <img class="img-thumbnail" src="images/products/<%=pas.getPhoto()%>" alt="loading......."/>   
     </div>
  
  <h1 class="display-4 font-weight-bolder"><%=pas.getPname() %></h1>
  <p class="lead"><%=pas.getPdescribe() %>.</p>
  <hr class="my-4">
  <p>&#x20B9;<%=pas.getSprice() %></p><p class="text-danger font-weight-bold"><s><%=pas.getMprice() %></s></p>
    <a class="btn btn-primary btn-lg" type="button" role="button" onclick="addcart(<%=pas.getPid()%>,'<%=pas.getPname()%>',<%=pas.getSprice()%>)">Add To Cart</a>
</div>   

   <%
   }
   %>



	<%@include file="templates/Script.jsp"%>
	

</body>
</html>