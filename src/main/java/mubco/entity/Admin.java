package mubco.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="admin")
public class Admin {
	@Id
    @Column(name="admin_id",  length=11,unique = true, nullable = false)
	private int adminID;
	 @Column(name="admin_user", length=15)
	private String adminUser;
	 @Column(name="admin_pass", length=15)
	private String adminPass;
	 
	public int getAdminID() {
		return adminID;
	}
	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}
	public String getAdminUser() {
		return adminUser;
	}
	public void setAdminUser(String adminUser) {
		this.adminUser = adminUser;
	}
	public String getAdminPass() {
		return adminPass;
	}
	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}
	public Admin( String adminUser, String adminPass) {
		
		this.adminUser = adminUser;
		this.adminPass = adminPass;
	}
	public Admin() {
		
	}
	
	

}
