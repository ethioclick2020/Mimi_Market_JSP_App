package com.hibernate;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Insert {

	public static void main(String[] args) {

		System.out.println("working");

		User demo = new User();
		demo.setFirstname("Jote");

		Configuration configuration = new Configuration();
		configuration.configure("hibernet.cfg.xml");

		Session session = configuration.buildSessionFactory().openSession();

		Transaction transaction = session.beginTransaction();

		session.save(demo);

		transaction.commit();

		session.close();

		System.out.println("done");

	}

}
