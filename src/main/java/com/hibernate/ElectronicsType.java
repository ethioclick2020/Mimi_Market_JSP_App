package com.hibernate;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class ElectronicsType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	Integer id;

	@Column(name = "DeviceType")
	String deviceType;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "electronicsType", fetch = FetchType.EAGER)
	List<ItemInfo> itemInfo;

	public List<ItemInfo> getItemInfo() {
		return itemInfo;
	}

	public void setItemInfo(List<ItemInfo> itemInfo) {
		this.itemInfo = itemInfo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}

}
