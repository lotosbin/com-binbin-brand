package com.binbin.brand;

import java.io.IOException;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.binbin.guestbook.PMF;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class ThirdBrandAddServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		String name = req.getParameter("name");
		Date date = new Date();
		ThirdBrand thirdBrand = new ThirdBrand(user, name, date);

		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			pm.makePersistent(thirdBrand);
		} finally {
			pm.close();
		}

		resp.sendRedirect("/brand/index.jsp");
	}

}
