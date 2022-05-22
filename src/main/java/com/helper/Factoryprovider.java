package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Factoryprovider {

	private static SessionFactory factory;
	public static SessionFactory getfactory() {
    		try {
    		
		if(factory==null) {
			factory=new Configuration().configure().buildSessionFactory();
			
		}
    		}
    		catch(Exception e) {
    		}
    		return factory;
	}
}
