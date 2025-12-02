package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	public static Connection connection;
	
	private static String url="jdbc:mysql://localhost:3306/socialnetwork";
	private static String username="root";
	private static String password="root";	
	
	static{
		try{		
			Class.forName("com.mysql.jdbc.Driver");
			connection =DriverManager.getConnection(url,username,password);
			System.out.println("Connection established");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}	
