<%@page import="com.item.Category"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.helper.Factoryprovider"%>
<%@page import="com.item.Products"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>Home</title>
<%@include file="templates/Boot.jsp"%>
<link rel="stylesheet" href="templates/Boat.css">
</head>
<body>
	<%
		List<Products> fetch = null;
	SessionFactory fact = Factoryprovider.getfactory();
	
	Session ses = fact.openSession();
	String q1 = "from Category";
	Query que1 = ses.createQuery(q1);

	List<Category> cat = (List<Category>) que1.list();

	String cats = request.getParameter("category");

	if (cats == null || cats.trim().equals("all")) {

		String q2 = "from Products";

		Query que2 = ses.createQuery(q2);
		
		fetch = (List<Products>) que2.list();
	} else {
		String q3 = "from Products as p where p.cat.id=:d";
		Query que2 = ses.createQuery(q3);
		int c = Integer.parseInt(cats.trim());
		que2.setParameter("d", c);
		fetch = que2.list();
	}
	ses.close();
	%>
	<%@include file="templates/Navbar.jsp"%>
	<br>
	<%@include file="templates/Banner.jsp"%>

<!-- The actual snackbar -->
<div id="snackbar">Some text some message..</div>

	<div class="container-fluid">
		<div class="row mt-12">
			<div class="col-md-2">


				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All </a>
					<%
						for (Category c : cat) {
					%>
					<a href="index.jsp?category=<%=c.getId()%>"
						class="list-group-item list-group-item-action"> <%=c.getName()%>
					</a>

					<%
						}
					if (cat.size() == 0) {

						out.println("No items");
					}
					%>

				</div>
			</div>
			<div class="col-md-10">
				<div class="row mt-4">
					<%
						for (Products pro : fetch) {
					%>
					<div class="col-md-4 mb-4">
                        
						<div class="card">						 
							<img class="card-img-top"
								style="height: 350px; max-width: 300px; max-height: 550px;"
								src="images/products/<%=pro.getPhoto()%>" alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">
									<%=pro.getPname()%>
								</h5>
								<p class="card-text text-danger">	
									<b>&#x20B9;<%=pro.getSprice()%></b><p><s>&#x20B9;<%=pro.getMprice()%></s></p>
								</p>
								<p class="card-text text-light">
									<a type="button" class="btn btn-primary"
										onclick="addcart(<%=pro.getPid()%>,'<%=pro.getPname()%>',<%=pro.getSprice()%>)">Add
										to cart</a>
								</p>
								 <div class="view_btn"> 
						 <form action="opener.jsp" method="post">
						 <input type="hidden" value="<%=pro.getPid()%>" name="coders">
						 <button class="btn btn-outline-primary">view...</button>
						 </form>
						  </div>
							</div>
							
						</div>
						
					</div>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</div>
	<%@include file="templates/Desc.jsp"%>
	<%@include file="templates/Footer.jsp"%>
	<%@include file="templates/Script.jsp"%>
	<div id="snackbar">Some text some message..</div>
</body>
</html>