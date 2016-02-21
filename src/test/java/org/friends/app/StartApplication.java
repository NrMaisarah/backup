package org.friends.app;

import java.sql.DriverManager;

import org.friends.app.view.Application;

public class StartApplication {

	 public static void main(String[] args) {
	  	System.setProperty("PORT", "8080");
		new Application() {
			protected java.sql.Connection getConnection() throws java.sql.SQLException ,java.net.URISyntaxException {
				try {
					Class.forName("org.h2.Driver");
				} catch (ClassNotFoundException e) {
					throw new RuntimeException("Could not find H2");
				}
		        return DriverManager.getConnection("jdbc:h2:~/test", "sa", "");
			};
		}.start(args);
	}
}