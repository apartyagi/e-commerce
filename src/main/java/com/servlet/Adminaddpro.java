package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.helper.Factoryprovider;
import com.helper.Helper;
import com.item.Category;
import com.item.Products;
@WebServlet("/adminaddpro")
@MultipartConfig
public class Adminaddpro extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  
        try {
         HttpSession session=req.getSession();
       	 String prod=req.getParameter("Pro");
       	 String desc=req.getParameter("Des");
       	 String brand=req.getParameter("Bra");
       	 double sprice=Double.parseDouble(req.getParameter("Spr"));
       	 double mprice=Double.parseDouble(req.getParameter("Mpr"));
       	  Part  photo= req.getPart("Pho");
       	 boolean avilble=true;
       	  int cid=Integer.parseInt(req.getParameter("cid").trim());
       	  
       	  //Create Connection
       	 SessionFactory fact= Factoryprovider.getfactory();
       	    Session ses=fact.openSession();
       	     Category c=  ses.get(Category.class, cid);
       	       
       	       
  Products pro=new Products(prod, desc,photo.getSubmittedFileName(), mprice, sprice, brand,new Timestamp( new Date().getTime()), avilble, c);
       
       	       
       	    Transaction trx=ses.beginTransaction();	
       	    
       	       ses.save(pro);
       	       	
       	  String path=req.getServletContext().getRealPath("")+"/images/products/"+photo.getSubmittedFileName();     
       	         System.out.println(path);
       	      Helper.fileuploader(photo.getInputStream(), path);
       	       trx.commit();
       	       ses.close();
       session.setAttribute("message", "Product Add Successfully");
            resp.sendRedirect("Admin.jsp");
       
       	  
       	  
        }catch(Exception e){
       	 e.printStackTrace();
       	 resp.sendRedirect("Admin.jsp");
        }
	}
}
