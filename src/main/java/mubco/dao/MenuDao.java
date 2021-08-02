package mubco.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mubco.entity.Admin;
import mubco.entity.Menu;


public class MenuDao {
	public List getMenu() {

		 List<Menu> menu= new ArrayList<Menu>();
		 try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mubco", "root", "");
				String query = "Select * from menu";
		 PreparedStatement psmt = conn.prepareStatement(query);
		 ResultSet rs = psmt.executeQuery();
		 
		while (rs.next()) {
			Menu m = new Menu(rs.getInt("urun_id"),rs.getString("urun_ad"),rs.getString("urun_aciklama"),rs.getString("urun_fiyat"),rs.getString("urun_gorsel"));
			menu.add(m);
		}
		 
		} catch (Exception e) {
		 e.printStackTrace();
		 }
		 return menu;
		 }
		

	
	public Menu getMenuMe(int urunID) {
		Menu menu = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mubco", "root", "");
			String query = "Select * from menu where urun_id=? ";
			PreparedStatement psmt = conn.prepareStatement(query);
			
			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				menu = new Menu(rs.getInt("urun_id"),rs.getString("urun_ad"),rs.getString("urun_aciklama"),rs.getString("urun_fiyat"),rs.getString("urun_gorsel"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return menu;

	}
}
