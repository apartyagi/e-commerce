package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.entities.User;
import com.helper.Factoryprovider;

@WebServlet("/registers")
public class Registerservlet extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("1");
		
		HttpSession session = req.getSession();

		try {
			String email = req.getParameter("email");
			String name = req.getParameter("user");
			String pass = req.getParameter("pass");
			String about = req.getParameter("about");
			String usertype = "normal";
			if(email.equals("") || name.equals("") || pass.equals("") || about.equals("")) {
				
				session.setAttribute("message","Please Provide Proper value");
				resp.sendRedirect("Register.jsp");
			}
			else {
				
				User user = new User(name, email, pass, about, usertype);
				// hibernate
				SessionFactory factory = Factoryprovider.getfactory();
				Session s = factory.openSession();
				Transaction tx = s.beginTransaction();

				Integer userId = (Integer) s.save(user);
				System.out.println(userId + " user added");

				tx.commit();
				s.close();
				session.setAttribute("message", "You have successfully registered !! : " + userId);
				resp.sendRedirect("Register.jsp");
				
				
				
				
			}
				
			
			

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}