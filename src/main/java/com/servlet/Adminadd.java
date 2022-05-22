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
import org.hibernate.Transaction;

import com.helper.Factoryprovider;
import com.item.Category;

@WebServlet("/addadmin")
public class Adminadd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		try {
             HttpSession se=req.getSession();
			String cat = req.getParameter("Name");
			String desc = req.getParameter("Desc");

			Category cate = new Category();
			cate.setDescription(desc);
			cate.setName(cat);
			SessionFactory fact = Factoryprovider.getfactory();
			Session ses = fact.openSession();

			Transaction trx = ses.beginTransaction();

			ses.save(cate);
			trx.commit();
			ses.close();
			se.setAttribute("message", "Category Added Successfully!..");
			 resp.sendRedirect("Admin.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
