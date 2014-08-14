package com.zcnation.zc.domain;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
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
	@Column(name="DET_ID")
	private Integer detId;
	@Column(name="ORDER_CODE")
	private String orderCode;
	@Column(name="PRO_CODE")
	private Integer proCode;
	@Column(name="ORDER_NUMBER")
	private Integer proNumber;
	@Column(name="PRO_UNIT")
	private BigDecimal proUnit;
	@Column(name="PRO_TYPE")
	private String proType;
	
	
	public String getProType() {
		return proType;
	}
	public void setProType(String proType) {
		this.proType = proType;
	}
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
