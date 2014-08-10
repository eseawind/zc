package com.zcnation.zc.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Generated;

@Entity(name = "zc_user_info")
public class ZcUserInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8465823412125942590L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="USER_CODE")
	private int userCode;
	@Column(name="USER_PHONE")
	private String userPhone;
	@Column(name="EMAIL")
	private String email;
	@Column(name="PASSWORD")
	private String password;
	@Column(name="USER_NAME")
	private String userName;
	@Column(name="USER_NNAME")
	private String userNname;
	@Column(name="REMARKS")
	private String remarks;
	@Column(name="USER_TYPE")
	private String userType;
	@Column(name="REG_TIME")
	private Date regTime;
	@Column(name="REG_IP")
	private String regIp;
	@Column(name="USER_INTRODUCE")
	private String userIntroduce;
	
	@Column(name="USER_IMAG")
	private String userImag;
	
	@Column(name="USER_QQ")
	private String userQq;
	
	
	
	public String getUserImag() {
		return userImag;
	}
	public void setUserImag(String userImag) {
		this.userImag = userImag;
	}
	public String getUserQq() {
		return userQq;
	}
	public void setUserQq(String userQq) {
		this.userQq = userQq;
	}
	public String getUserIntroduce() {
		return userIntroduce;
	}
	public void setUserIntroduce(String userIntroduce) {
		this.userIntroduce = userIntroduce;
	}
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
	 
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	public String getRegIp() {
		return regIp;
	}
	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}

	
}
