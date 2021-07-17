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
@Table(name = "brandtb")
public class DeviceBrand {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	Integer id;
	
	@Column(name = "Phone_Tablet")
	String phone_tablet;
	
	@Column(name = "Computer")
	String computer;
	
	@Column(name = "Camera")
	String camera;
	
	@Column(name = "Tv_Other")
	String tv_other;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPhone_tablet() {
		return phone_tablet;
	}

	public void setPhone_tablet(String phone_tablet) {
		this.phone_tablet = phone_tablet;
	}

	public String getComputer() {
		return computer;
	}

	public void setComputer(String computer) {
		this.computer = computer;
	}

	public String getCamera() {
		return camera;
	}

	public void setCamera(String camera) {
		this.camera = camera;
	}

	public String getTv_other() {
		return tv_other;
	}

	public void setTv_other(String tv_other) {
		this.tv_other = tv_other;
	}

	
}
