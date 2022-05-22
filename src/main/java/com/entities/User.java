package com.entities;

import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {
   public User() {
		super();
		// TODO Auto-generated constructor stub
	}
@Id
   private int id;
   @Column(name = "Username")
   private String name;
   @Column(name = "Email")
   private String  email;
   @Column(name = "Password")
   private String pass;
   @Column(name = "Aboutuser")
   private  String About;
   private String usertype;
public User(String name, String email, String pass, String about, String usertype) {
	super();
     this.id=new Random().nextInt(1000000);
	 this.name = name;
	this.email = email;
	this.pass = pass;
	About = about;
	this.usertype = usertype;
}
public String getUsertype() {
	return usertype;
}
public void setUsertype(String usertype) {
	this.usertype = usertype;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
public String getAbout() {
	return About;
}
public void setAbout(String about) {
	About = about;
}

   
}
