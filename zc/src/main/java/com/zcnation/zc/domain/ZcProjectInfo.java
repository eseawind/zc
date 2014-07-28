package com.zcnation.zc.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="zc_project_info")
public class ZcProjectInfo implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int proCode;
	@Column(name="USER_CODE")
	private String userCode;
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
	private String proShStatus;
	@Column(name="PRO_EXE_STATUS")
	private String proExeStatus;
	public int getProCode() {
		return proCode;
	}
	public void setProCode(int proCode) {
		this.proCode = proCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
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
	public String getProShStatus() {
		return proShStatus;
	}
	public void setProShStatus(String proShStatus) {
		this.proShStatus = proShStatus;
	}
	public String getProExeStatus() {
		return proExeStatus;
	}
	public void setProExeStatus(String proExeStatus) {
		this.proExeStatus = proExeStatus;
	}

}
