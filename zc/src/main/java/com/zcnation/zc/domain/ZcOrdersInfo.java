package com.zcnation.zc.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "zc_orders_info")
public class ZcOrdersInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1674073270821408740L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer ocodes;
	
	@Column(name="ORDER_CODE")
	private String orderCode;
	@Column(name="USER_CODE")
	private Integer userCode; 
 
	@Column(name="ORDER_STATUS")
	private String orderStatus;
	
	@Column(name="ORDER_TIME")
	private Date orderTime;
	
	
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
	
	@Column(name="ORDER_CANCELTIME")
	private Date orderCancelTime;
	
	@Column(name="ORDER_PAYTIME")
	private Date orderPayTime;
	
	@Column(name="ORDER_SUCCESSTIME")
	private Date orderSuccessTime;

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

	public Integer getOcodes() {
		return ocodes;
	}

	public void setOcodes(Integer ocodes) {
		this.ocodes = ocodes;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public Integer getUserCode() {
		return userCode;
	}

	public void setUserCode(Integer userCode) {
		this.userCode = userCode;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Date getOrderCancelTime() {
		return orderCancelTime;
	}

	public void setOrderCancelTime(Date orderCancelTime) {
		this.orderCancelTime = orderCancelTime;
	}

	public Date getOrderPayTime() {
		return orderPayTime;
	}

	public void setOrderPayTime(Date orderPayTime) {
		this.orderPayTime = orderPayTime;
	}

	public Date getOrderSuccessTime() {
		return orderSuccessTime;
	}

	public void setOrderSuccessTime(Date orderSuccessTime) {
		this.orderSuccessTime = orderSuccessTime;
	}

	 
}
