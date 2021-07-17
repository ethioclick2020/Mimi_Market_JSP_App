package com.hibernate;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import jakarta.servlet.http.HttpSession;

public class Authentication {

	public void SignUp(User user) {

		user.getFirstname();
		user.getPassword();

		Configuration configuration = new Configuration();
		configuration.configure("hibernet.cfg.xml");

		Session session = configuration.buildSessionFactory().openSession();

		Transaction transaction = session.beginTransaction();

		session.save(user);

		transaction.commit();

		session.close();

	}

	public User userInfo(String user, String pass) {

		Configuration configuration = new Configuration();
		configuration.configure("hibernet.cfg.xml");

		Session session = configuration.buildSessionFactory().openSession();

		Transaction transaction = session.beginTransaction();

		User users = (User) session.createQuery("From User Where firstname = :username and password = :password")
				.setParameter("username", user).setParameter("password", pass).uniqueResult();

		transaction.commit();

		session.close();

		return users;

	}

	public boolean SignIn(String name, String pass) {

		User user = null;

		try {
			Configuration configuration = new Configuration();
			configuration.configure("hibernet.cfg.xml");

			Session session = configuration.buildSessionFactory().openSession();

			Transaction transaction = session.beginTransaction();

			user = (User) session.createQuery("FROM User WHERE firstname = :username and password = :password")
					.setParameter("username", name).setParameter("password", pass).uniqueResult();

			if (user != null) {
				return true;
			}

			transaction.commit();

			session.close();

		} catch (Exception e) {
			e.getMessage();
		}

		return false;
	}
}
