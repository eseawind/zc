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

	 
}
