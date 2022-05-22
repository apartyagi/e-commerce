<%@page import="java.util.HashMap"%>
<%@page import="com.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session,org.hibernate.query.*"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.helper.Factoryprovider"%>
<%@page import="com.item.Category"%>
<%@page import="com.entities.User"%>
<%
User user=(User)session.getAttribute("currentuser");   
   if(user==null){
	   response.sendRedirect("Login.jsp");
          return;
   }
   else{
	   if(user.getUsertype().equals("normal"))
	      response.sendRedirect("Login.jsp");
   }
    
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<%@include file="templates/Boot.jsp"%>
</head>
<body>
	<%@include file="templates/Navbar.jsp"%>
	<br>
	<br>
		
<%
SessionFactory fact=Factoryprovider.getfactory();
    Session sess=fact.openSession();
     
  Query que= sess.createQuery("from Category");
        List<Category> list  = que.list();
 HashMap<String,Long> dyn= Helper.dynamichelper(Factoryprovider.getfactory());  
%>
	
	<div class="container mt-5">
		<div class="card-deck card text-center">
			<div class="card card border-primary ">
				<img src="images/employee.png" class="card-img-top" alt="..."
					style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Current user</h5>
					<p class="card-text">Current user Who register in this Ecom Project::<%=dyn.get("user") %></p>
					<p class="card-text">
						<small class="text-muted">Just now...</small>
					</p>
				</div>
			</div>
			<div class="card card border-primary">
				<img src="images/marketing.png" class="card-img-top" alt="..."
					style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Active Products</h5>
					<p class="card-text">Total Active Products::<%=dyn.get("product") %></p>
					<p class="card-text">
						<small class="text-muted">Just now..</small>
					</p>
				</div>
			</div>
			<div class="card card border-primary">
				<img src="images/list.png" class="card-img-top" alt="..."
					style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Active Category</h5>
					<p class="card-text">Total Active Category ::<%=list.size() %> </p>
					<p class="card-text">
						<small class="text-muted">just now...</small>
					</p>
				</div>
			</div>
		</div>
		<div class="card-deck mt-5 text-center">
			<div class="card card border-primary" data-toggle="modal" data-target="#category">
				<img src="images/new-window.png" class="card-img-top " alt="..."
					style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Add Category</h5>
					<p class="card-text">To Add more category in program click here but all data enter carefully because you are a admin and all responcibilty is yours</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<div class="card card border-primary" data-toggle="modal" data-target="#products ">
				<img src="images/shopping-cart.png" class="card-img-top" alt="..."
					style="width: 18rem;">
				<div class="card-body">
					<h5 class="card-title">Add Products</h5>
					<p class="card-text">To Add more Products in program click here but all data enter carefully because you are a admin and all responcibilty is yours</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>


		</div>
	</div>	 	
	<!-- Modal for add products -->
<div class="modal fade" id="products" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="productslabel">Add Products</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form method="post" action="adminaddpro" enctype="multipart/form-data">
         <div class="form-group">
        <select  name="cid"  class="form-control">
            <%
       for(Category c:list){
    	    %>
    	    <option class="form-control" value="<%=c.getId()%>"><%=c.getName()%></option>
            <%
              }
            %>
              
        </select>
         </div>
         <div class="form-group">
         <input class="form-control" name="Pro" type="text" placeholder="Name of Product">
         </div>
         <div class="form-group">
         <input class="form-control" name="Des" type="text" placeholder="Enter Product Description">
         </div>
         <div class="form-group">
         <input class="form-control" name="Bra" type="text" placeholder="Name of Manufacturer(Brand)">
         </div>
         <div class="form-group">
 			<input class="form-control" name="Spr" type="number" placeholder="Selling Price">
         </div>
         <div class="form-group">       
		  <input class="form-control" name="Mpr" type="number" placeholder="Markiting Price">
         </div>
         <div class="form-group">
          <div class="custom-file">
  		<input type="file" name="Pho"  class="custom-file-input" id="customFile">
 		 <label class="custom-file-label" for="customFile">Choose file</label>
		</div>		
         </div>
         <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Add</button>
      </div>
       </form> 
      </div>
      
    </div>
  </div>
</div>
<!-- Modal For Add Category -->
	<div class="modal fade" id="category" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="categorylabel">Add Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form method="post" action="addadmin">
       <input type="hidden" name="checker" value="add_pro">
       <div class="form-group">
         <input class="form-control" name="Name" type="text" placeholder="Category Name">
         </div>
         <div class="form-group">
         <input class="form-control" name="Desc"  type="text" placeholder="Description">
         </div>
         <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class=" btn btn-primary">Add</button>
      </div>
       </form> 
      </div>
    </div>
  </div>
</div>
	<%@include file="templates/Script.jsp"%>
</body>
</html>