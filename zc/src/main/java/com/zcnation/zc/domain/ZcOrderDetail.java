package com.zcnation.zc.domain;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="zc_order_detail")
public class ZcOrderDetail implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer detId;
	private String orderCode;
	private Integer proCode;
	private Integer proNumber;
	private BigDecimal proUnit;
	public Integer getDetId() {
		return detId;
	}
	public void setDetId(Integer detId) {
		this.detId = detId;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public Integer getProCode() {
		return proCode;
	}
	public void setProCode(Integer proCode) {
		this.proCode = proCode;
	}
	public Integer getProNumber() {
		return proNumber;
	}
	public void setProNumber(Integer proNumber) {
		this.proNumber = proNumber;
	}
	public BigDecimal getProUnit() {
		return proUnit;
	}
	public void setProUnit(BigDecimal proUnit) {
		this.proUnit = proUnit;
	}
	

	
}
