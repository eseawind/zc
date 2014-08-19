package com.zcnation.zc.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name="zc_project_info")
public class ZcProjectInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="PRO_CODE")
	private Integer proCode;
	@Column(name="USER_CODE")
	private int userCode;
	@Column(name="PRO_NAME")
	private String proName;
	@Column(name="PRO_DAYS")
	private int proDays;
	@Column(name="PRO_UNIT")
	private double proUnit;
	@Column(name="PRO_IMAG")
	private int proImag;
	@Column(name="PRO_REMARKS")
	private String proRemarks;
	@Column(name="PRO_SH_STATUS")
	private int proShStatus;
	@Column(name="PRO_EXE_STATUS")
	private int proExeStatus;
	
	@Column(name=" PRO_TARGET")
	private int proTarget;
	
	@Column(name=" PRO_TIME")
	private Date proTime;
	
	@Column(name=" PRO_TYPE")
	private int proType;
	
	
	
	@Column(name=" PRO_PROVINCE")
	private String proProvince;
	@Column(name=" PRO_CITY")
	private String proCity;
	
	@Column(name=" PRO_FABRIC")
	private int proFabric;
	
	@Column(name=" PRO_SAMPLE")
	private int proSample;
	
	@Column(name=" PRO_TAG")
	private String proTag;
	
	
	@Column(name=" PRO_STARTTIME")
	private Date proStartTime;
	
	@Column(name=" PRO_ENDTIME")
	private Date proEndTime;
	
	@OneToOne
	@JoinColumn(name="RESOURCE_CODE",referencedColumnName="RESOURCE_CODE")
	private ZcResourceInfo resourceInfo;

	public Integer getProCode() {
		return proCode;
	}

	public void setProCode(Integer proCode) {
		this.proCode = proCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getProDays() {
		return proDays;
	}

	public void setProDays(int proDays) {
		this.proDays = proDays;
	}

	public double getProUnit() {
		return proUnit;
	}

	public void setProUnit(double proUnit) {
		this.proUnit = proUnit;
	}

	public int getProImag() {
		return proImag;
	}

	public void setProImag(int proImag) {
		this.proImag = proImag;
	}

	public String getProRemarks() {
		return proRemarks;
	}

	public void setProRemarks(String proRemarks) {
		this.proRemarks = proRemarks;
	}

	public int getProShStatus() {
		return proShStatus;
	}

	public void setProShStatus(int proShStatus) {
		this.proShStatus = proShStatus;
	}

	public int getProExeStatus() {
		return proExeStatus;
	}

	public void setProExeStatus(int proExeStatus) {
		this.proExeStatus = proExeStatus;
	}

	public int getProTarget() {
		return proTarget;
	}

	public void setProTarget(int proTarget) {
		this.proTarget = proTarget;
	}

	public Date getProTime() {
		return proTime;
	}

	public void setProTime(Date proTime) {
		this.proTime = proTime;
	}

	public int getProType() {
		return proType;
	}

	public void setProType(int proType) {
		this.proType = proType;
	}

	public String getProProvince() {
		return proProvince;
	}

	public void setProProvince(String proProvince) {
		this.proProvince = proProvince;
	}

	public String getProCity() {
		return proCity;
	}

	public void setProCity(String proCity) {
		this.proCity = proCity;
	}

	public int getProFabric() {
		return proFabric;
	}

	public void setProFabric(int proFabric) {
		this.proFabric = proFabric;
	}

	public int getProSample() {
		return proSample;
	}

	public void setProSample(int proSample) {
		this.proSample = proSample;
	}

	public String getProTag() {
		return proTag;
	}

	public void setProTag(String proTag) {
		this.proTag = proTag;
	}

	public ZcResourceInfo getResourceInfo() {
		return resourceInfo;
	}

	public void setResourceInfo(ZcResourceInfo resourceInfo) {
		this.resourceInfo = resourceInfo;
	}

	public Date getProStartTime() {
		return proStartTime;
	}

	public void setProStartTime(Date proStartTime) {
		this.proStartTime = proStartTime;
	}

	public Date getProEndTime() {
		return proEndTime;
	}

	public void setProEndTime(Date proEndTime) {
		this.proEndTime = proEndTime;
	}
	
	

}
