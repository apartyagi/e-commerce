package com.item;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sun.istack.NotNull;
@Entity
public class Products{
    
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int pid;
	private String pname;
	private String pdescribe;
	private String photo;
	private double mprice;
	private double sprice;
    private String brand;
    private Timestamp pdate;
	private boolean avilable;
	@ManyToOne
	private Category cat;
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPdescribe() {
		return pdescribe;
	}
	public void setPdescribe(String pdescribe) {
		this.pdescribe = pdescribe;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public double getMprice() {
		return mprice;
	}
	public void setMprice(double mprice) {
		this.mprice = mprice;
	}
	public double getSprice() {
		return sprice;
	}
	public void setSprice(double sprice) {
		this.sprice = sprice;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public boolean isAvilable() {
		return avilable;
	}
	public void setAvilable(boolean avilable) {
		this.avilable = avilable;
	}
	public Category getCat() {
		return cat;
	}
	public void setCat(Category cat) {
		this.cat = cat;
	}
	public Products(String pname, String pdescribe, String photo, double mprice, double sprice, String brand,
			Timestamp pdate, boolean avilable, Category cat) {
		super();
		this.pname = pname;
		this.pdescribe = pdescribe;
		this.photo = photo;
		this.mprice = mprice;
		this.sprice = sprice;
		this.brand = brand;
		this.pdate = pdate;
		this.avilable = avilable;
		this.cat = cat;
	}
	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
