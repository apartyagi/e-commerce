package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.User;
import com.helper.Factoryprovider;

@WebServlet("/logins")
public class Loginservlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String mail = req.getParameter("mail");
		String pass = req.getParameter("pass");
         HttpSession session=req.getSession();
	try {
		
		if(mail.equals("") || pass.equals("")) {
		 	
		  session.setAttribute("message", "Please provide Proper Value");	
		   resp.sendRedirect("Login.jsp");
		 }
		
		else {
			
		SessionFactory fact= Factoryprovider.getfactory();
			
			Session ses=fact.openSession();
			
			//HQL  Query
			Query query=  ses.createQuery("from User where email=:e and pass=:p");
			     query.setParameter("e", mail);
			     query.setParameter("p", pass);
			   User user=(User) query.uniqueResult();    
			     if(user==null) {
			    	 session.setAttribute("message","Invalid usernme or password");
			    	  resp.sendRedirect("Login.jsp"); 
			     }
			     else {
			    	  session.setAttribute("currentuser",user);
			    	     if(user.getUsertype().equals("admin")) {
			    	    	 
			    	    	 resp.sendRedirect("Admin.jsp");
			    	     }
			    	     else {
			    	    	 resp.sendRedirect("index.jsp");
			    	     }
			     }
		}
		
	}

    catch(Exception e) {
    	e.printStackTrace();
    }
	
	}
}
