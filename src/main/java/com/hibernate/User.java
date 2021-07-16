package com.hibernate;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import javax.persistence.GenerationType;

@Entity
@Table(name = "usertb")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	Integer id;

	@Column(name = "Name")
	String firstname;

	@Column(name = "Password")
	String password;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	UserAddress address;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "User_Item", joinColumns = { @JoinColumn(name = "User_id") }, inverseJoinColumns = {
			@JoinColumn(name = "ItemInfo_id") })
	Set<ItemInfo> itemInfos = new HashSet<ItemInfo>();

	public Set<ItemInfo> getItemInfos() {
		return itemInfos;
	}

	public void setItemInfos(Set<ItemInfo> itemInfos) {
		this.itemInfos = itemInfos;
	}

	public UserAddress getAddress() {
		return address;
	}

	public void setAddress(UserAddress address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

}
