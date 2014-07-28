package com.zcnation.zc.domain;

import java.io.Serializable;

import javax.persistence.Entity;

@Entity(name = "zc_user_info")
public class ZcUserInfo implements Serializable {

	private int userCode;
	private String userPhone;
	private String email;
	private String passwork;
	private String userName;
	private String userNname;
	private String remarks;
	private String userType;
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswork() {
		return passwork;
	}
	public void setPasswork(String passwork) {
		this.passwork = passwork;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNname() {
		return userNname;
	}
	public void setUserNname(String userNname) {
		this.userNname = userNname;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}

	
}
