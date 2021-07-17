package com.hibernate;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class DAO {

	public void addItem(ItemInfo itemInfo, User user, ElectronicsType electronicsType, UserAddress address) {

		try {
			itemInfo.getModelName();
			itemInfo.getBrand();
			itemInfo.getCondition();
			itemInfo.getPrice();
			itemInfo.getQuantity();
			itemInfo.getPostDate();
			itemInfo.getDescription();
			itemInfo.getImage();

			Configuration configuration = new Configuration();
			configuration.configure("hibernet.cfg.xml");

			Session session = configuration.buildSessionFactory().openSession();

			Transaction transaction = session.beginTransaction();

			User users = (User) session.createQuery("From User  Where firstname = :username")
					.setParameter("username", user.getFirstname()).getSingleResult();

			ElectronicsType electronicsType1 = (ElectronicsType) session
					.createQuery("From ElectronicsType  Where deviceType = :devicetype")
					.setParameter("devicetype", electronicsType.getDeviceType()).uniqueResult();

			UserAddress userAddress = (UserAddress) session
					.createQuery("From UserAddress  Where Address = :userAddress")
					.setParameter("userAddress", address.getAddress()).uniqueResult();

			// One to One
			users.setAddress(userAddress);

			// One to Many
			itemInfo.setElectronicsType(electronicsType1);

			session.save(itemInfo);

			// Many to Many
			users.getItemInfos().add(itemInfo);
			itemInfo.getUsers().add(users);

			transaction.commit();

			session.close();

		} catch (Exception e) {
			e.getMessage();
		}

	}

	public List<ItemInfo> displayItems() {

		Configuration configuration = new Configuration();
		configuration.configure("hibernet.cfg.xml");

		Session session = configuration.buildSessionFactory().openSession();

		Transaction transaction = session.beginTransaction();

		List<ItemInfo> itemInfos = session.createQuery("From ItemInfo ORDER BY id DESC").list();

		transaction.commit();

		session.close();

		return itemInfos;
	}

	public User onetooneFetch(User user) {
		// TODO Auto-generated method stub
		Configuration configuration = new Configuration();
		configuration.configure("hibernet.cfg.xml");

		Session session = configuration.buildSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();

		User users = (User) session.createQuery("From User  Where id = :username")
				.setParameter("username", user.getId()).uniqueResult();

		transaction.commit();
		session.close();

		return users;

	}

	public ElectronicsType onetomanyFetch(int id) {
		// TODO Auto-generated method stub
		Configuration configuration = new Configuration();
		configuration.configure("hibernet.cfg.xml");

		Session session = configuration.buildSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();

		ElectronicsType electronicsTypes = session.get(ElectronicsType.class, id);

		transaction.commit();
		session.close();

		return electronicsTypes;
	}

	public List<ElectronicsType> deviceTypeFetch() {
		// TODO Auto-generated method stub
		Configuration configuration = new Configuration();
		configuration.configure("hibernet.cfg.xml");

		Session session = configuration.buildSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();

		List<ElectronicsType> electronicsTypes = session.createQuery("From ElectronicsType").list();

		transaction.commit();
		session.close();

		return electronicsTypes;
	}

	public List<DeviceBrand> deviceBrandFetch() {
		// TODO Auto-generated method stub
		Configuration configuration = new Configuration();
		configuration.configure("hibernet.cfg.xml");

		Session session = configuration.buildSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();

		List<DeviceBrand> deviceBrands = session.createQuery("From DeviceBrand").list();

		transaction.commit();
		session.close();

		return deviceBrands;
	}

	public User manytomanyFetch(User user) {
		// TODO Auto-generated method stub
		Configuration configuration = new Configuration();
		configuration.configure("hibernet.cfg.xml");

		Session session = configuration.buildSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();

		User users = (User) session.createQuery("From User Where id = :username").setParameter("username", user.getId())
				.uniqueResult();
		transaction.commit();
		session.close();

		return users;
	}

}
