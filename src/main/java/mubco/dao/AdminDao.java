package mubco.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mubco.entity.Admin;

public class AdminDao {
	
	public Admin getAdmin(String username, String password) {
		Admin admin = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mubco", "root", "");
			String query = "Select * from admin where admin_user=? and admin_pass=?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, username);
			psmt.setString(2, password);
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				admin = new Admin(rs.getString("admin_user"),rs.getString("admin_pass"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return admin;

	}

}
