package com.helper;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {

	public static void fileuploader(InputStream image ,String path) {
		
		 try {
			byte[] bytearr=new byte[image.available()];
			     image.read(bytearr);
			
			   FileOutputStream fos=new FileOutputStream(path);
			  fos.write(bytearr);
			   fos.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	public static HashMap<String, Long> dynamichelper(SessionFactory fact) {

		Session sess=fact.openSession();
		
		String q1="select count(*) from User";
		String q2="select count(*) from Products";
		
		
		Query que=sess.createQuery(q1);
		Query que2=sess.createQuery(q2);
		
		
		  Long a=  (Long) que.list().get(0);
		  Long b= (Long) que2.list().get(0);
            
		   HashMap<String,Long> map=new HashMap<String, Long>();
		      map.put("user", a);
		      map.put("product", b);
		      
		      sess.close();
		      
		      return map;
		      
		      
		      
		    		
	}
}
