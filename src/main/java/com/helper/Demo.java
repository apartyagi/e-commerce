package com.helper;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Demo {

public static void main(String[] args) {
    		
	 Configuration cfg=new Configuration();
	    cfg.configure("hibernate.cfg.xml");
	    
	 SessionFactory fact=cfg.buildSessionFactory();
	    
     	Session ses=fact.openSession();
	       Transaction trx=ses.beginTransaction();
	}
}
