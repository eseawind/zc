package com.zcnation.zc.domain;

import java.io.Serializable;

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
	private String orderCode;
	private int userCode;
	private int proCode;
	private int orderNumbers;
	private String bmType;
	private double orderMoney;
	private int userAddress;
	private int orderStatus;
	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
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
