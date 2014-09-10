package com.zcnation.zc.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
@Entity(name="zc_user_infos")
public class ZcUserInfos implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="USER_CODE")
	private Integer userCode;
	@Column(name="USER_ADDRESS")
	private String userAddress;
	@Column(name="USER_NAME")
	private String userName;
	
	@Column(name="USER_PROVINCE")
	private String userProvince;
	
	@Column(name="USER_CITY")
	private String userCity;
	
	@Column(name="USER_AREA")
	private String userArea;
	
	@Column(name="USER_ZIP")
	private String userZip;
	
	@Column(name="USER_MOBILEPHONE")
	private String userMobilephone;
	
	@Column(name="USER_TELEPHONE")
	private String userTelephone;
	
	
	@Column(name="USER_EMAIL")
	private String userEmail;
	
	@Column(name="ISDEFAULT")
	private String isDefault;
	

	
	@ManyToOne
	@JoinColumn(name="USER_OWNER",referencedColumnName="USER_CODE")
	private ZcUserInfo zcUserInfo;

	public ZcUserInfo getZcUserInfo() {
		return zcUserInfo;
	}


	public void setZcUserInfo(ZcUserInfo zcUserInfo) {
		this.zcUserInfo = zcUserInfo;
	}


	public String getIsDefault() {
		return isDefault;
	}


	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}


	public Integer getUserCode() {
		return userCode;
	}


	public void setUserCode(Integer userCode) {
		this.userCode = userCode;
	}


	public String getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
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


	public String getUserArea() {
		return userArea;
	}


	public void setUserArea(String userArea) {
		this.userArea = userArea;
	}


	public String getUserZip() {
		return userZip;
	}


	public void setUserZip(String userZip) {
		this.userZip = userZip;
	}


	public String getUserMobilephone() {
		return userMobilephone;
	}


	public void setUserMobilephone(String userMobilephone) {
		this.userMobilephone = userMobilephone;
	}


	public String getUserTelephone() {
		return userTelephone;
	}


	public void setUserTelephone(String userTelephone) {
		this.userTelephone = userTelephone;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	


}
