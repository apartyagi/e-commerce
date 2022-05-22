<%@page import="javax.websocket.Session"%>
<%@page import="javax.servlet.http.*" %>
<%
   String  se =(String)session.getAttribute("message");
if(se !=null){
%>
<div class="alert alert-warning alert-dismissible fade show"
	role="alert">
	<strong><%=se %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<%
}
  session.removeAttribute("message");
%>