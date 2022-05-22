package com.item;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
	
@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
    private String name;
	private String description;
	
	@OneToMany(mappedBy = "cat")
	private List<Products> prduct;
 
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Products> getPrduct() {
		return prduct;
	}
	public void setPrduct(List<Products> prduct) {
		this.prduct = prduct;
	}
	
	public Category(String name, String description, List<Products> prduct) {
		super();
		this.name = name;
		this.description = description;
		this.prduct = prduct;
	}
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
}
