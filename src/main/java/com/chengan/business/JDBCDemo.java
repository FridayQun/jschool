package com.chengan.business;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 这是啥？
 */
public class JDBCDemo {
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url = "jdbc:mysql://rm-bp1k8k19df23688cho.mysql.rds.aliyuncs.com/jkxy?useUnicode=true&amp;characterEncoding=UTF-8";
		String username = "root";
		String password = "Kd664783";

		Connection con = null;
		try {
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;

	}
	
	public static void main(String[] args) {
		getConnection();
	}
}
