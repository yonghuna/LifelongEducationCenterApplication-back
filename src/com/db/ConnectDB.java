/**
 * 
 */
/**
 * @author kooaa
 *
 */
package com.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectDB {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	

	public ConnectDB() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/lifelongeducationcenterapp?serverTimezone=Asia/Seoul&useSSL=false";
			String dbID = "root";
			String dbPassword = "0000";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			System.out.println(">>>DBConnection Consumer Err<<<");
			System.out.println(e.getMessage());
		}
	}
		
	
	public String exmaple() {
		String id = null;
		String pw = null;
		String plus;
		String SQL = "SELECT * FROM  example";
		
		try {
		pstmt = conn.prepareStatement(SQL);
		System.out.println(" >>> SQL : " + SQL + "<<<");
		rs = pstmt.executeQuery();
		while(rs.next()) {
			id = rs.getString(1);
			pw = rs.getString(2);
		}
		
	} catch (Exception e) {
		System.out.println("fail");
		System.out.println(e.getMessage());
	}
	plus = id + "/" + pw; 
	return plus;
}
}




