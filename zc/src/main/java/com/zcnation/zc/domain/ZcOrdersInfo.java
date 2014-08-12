package com.zcnation.zc.domain;

import java.io.Serializable;

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
	@Column(name="ORDER_CODE")
	private String orderCode;
	@Column(name="USER_CODE")
	private Integer userCode;
	@Column(name="PRO_CODE")
	private int proCode;
	@Column(name="ORDER_NUMBERS")
	private int orderNumbers;
	@Column(name="BM_TYPE")
	private String bmType;
	@Column(name="ORDER_MONEY")
	private double orderMoney;
	@Column(name="USER_ADDRESS")
	private int userAddress;
	@Column(name="ORDER_STATUS")
	private int orderStatus;
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
	public int getProCode() {
		return proCode;
	}
	public void setProCode(int proCode) {
		this.proCode = proCode;
	}
	public int getOrderNumbers() {
		return orderNumbers;
	}
	public void setOrderNumbers(int orderNumbers) {
		this.orderNumbers = orderNumbers;
	}
	public String getBmType() {
		return bmType;
	}
	public void setBmType(String bmType) {
		this.bmType = bmType;
	}
	public double getOrderMoney() {
		return orderMoney;
	}
	public void setOrderMoney(double orderMoney) {
		this.orderMoney = orderMoney;
	}
	public int getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(int userAddress) {
		this.userAddress = userAddress;
	}
	public int getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	

}
