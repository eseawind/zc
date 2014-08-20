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
	private Integer userCode;
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
	
	@Column(name="RESOURCE_CODE")
	private Integer resourceCode;
	@Column(name="USER_QQ")
	private String userQq;
	
	
	@Column(name="USER_PROVINCE")
	private String userProvince;
	
	@Column(name="USER_CITY")
	private String userCity;
	
	@Column(name="USER_SEX")
	private String userSex;
	
	@Column(name="LOGIN_TIME")
	private Date loginTime;
	
	@Column(name="USER_SCORE")
	private Integer userScore;
	

	public Integer getUserCode() {
		return userCode;
	}

	public void setUserCode(Integer userCode) {
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

	public String getUserIntroduce() {
		return userIntroduce;
	}

	public void setUserIntroduce(String userIntroduce) {
		this.userIntroduce = userIntroduce;
	}

	public Integer getResourceCode() {
		return resourceCode;
	}

	public void setResourceCode(Integer resourceCode) {
		this.resourceCode = resourceCode;
	}

	public String getUserQq() {
		return userQq;
	}

	public void setUserQq(String userQq) {
		this.userQq = userQq;
	}

	public String getUserProvince() {
		return userProvince;
	}

	public void setUserProvince(String userProvince) {
		this.userProvince = userProvince;
	}

	public String getUserCity() {
		return userCity;
	}

	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public Integer getUserScore() {
		return userScore;
	}

	public void setUserScore(Integer userScore) {
		this.userScore = userScore;
	}
	
	
	
	
}
