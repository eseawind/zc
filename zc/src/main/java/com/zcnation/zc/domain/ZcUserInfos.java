package com.zcnation.zc.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity(name="zc_user_infos")
public class ZcUserInfos implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userCode;
	private String userAddress;
	
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
}
