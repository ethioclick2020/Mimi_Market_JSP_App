package com.hibernate;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import javax.persistence.GenerationType;

@Entity
@Table(name = "itemtb")
public class ItemInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	Integer id;

	@Column(name = "Model")
	String modelName;

	@Column(name = "Brand")
	String brand;

	@Column(name = "Conditions")
	String condition;

	@Column(name = "Price")
	Double price;

	@Column(name = "Quantity")
	Integer quantity;

	@Column(name = "PostDate")
	String postDate;

	@Column(name = "Description")
	String description;

	@Column(name = "Image")
	String image;

	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "itemInfos", fetch = FetchType.EAGER)
	Set<User> users = new HashSet<User>();

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	ElectronicsType electronicsType;

	public ElectronicsType getElectronicsType() {
		return electronicsType;
	}

	public void setElectronicsType(ElectronicsType electronicsType) {
		this.electronicsType = electronicsType;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
