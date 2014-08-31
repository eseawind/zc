package com.zcnation.zc.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity(name="zc_appraise")
public class ZcAppraise implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ID")
	private Integer id;
	
	@Column(name="INSERT_TIME")
	private Date insertTime;
	@Column(name="REMARKS")
	private String remarks;
	
	@Column(name="APPRAISE_COUNT")
	private String appraiseCount;
	

	@OneToOne
	@JoinColumn(name="USER_CODE",referencedColumnName="USER_CODE")
	private ZcUserInfo zcUserInfo;
	
	@OneToOne
	@JoinColumn(name="PRO_CODE",referencedColumnName="PRO_CODE")
	private ZcProjectInfo zcProjectInfo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	
	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	

	public String getAppraiseCount() {
		return appraiseCount;
	}

	public void setAppraiseCount(String appraiseCount) {
		this.appraiseCount = appraiseCount;
	}

	public ZcUserInfo getZcUserInfo() {
		return zcUserInfo;
	}

	public void setZcUserInfo(ZcUserInfo zcUserInfo) {
		this.zcUserInfo = zcUserInfo;
	}

	public ZcProjectInfo getZcProjectInfo() {
		return zcProjectInfo;
	}

	public void setZcProjectInfo(ZcProjectInfo zcProjectInfo) {
		this.zcProjectInfo = zcProjectInfo;
	}
	
	
	
}
