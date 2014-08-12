package com.zcnation.zc.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity(name = "zc_resource_info")
public class ZcResourceInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@PrimaryKeyJoinColumn
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="RESOURCE_CODE")
	private Integer resourceCode;
	@Column(name="UPT_DATE")
	private Date uptDate;
	@Column(name="UPT_IP")
	private String uptIp;
	@Column(name="RESOURCE_NAME")
	private String resourceName;
	@Column(name="RESOURCE_URL")
	private String resourceUrl;
	@Column(name="RSTATUS")
	private String rstatus;
	public Integer getResourceCode() {
		return resourceCode;
	}
	public void setResourceCode(Integer resourceCode) {
		this.resourceCode = resourceCode;
	}
	public Date getUptDate() {
		return uptDate;
	}
	public void setUptDate(Date uptDate) {
		this.uptDate = uptDate;
	}
	public String getUptIp() {
		return uptIp;
	}
	public void setUptIp(String uptIp) {
		this.uptIp = uptIp;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getResourceUrl() {
		return resourceUrl;
	}
	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}
	public String getRstatus() {
		return rstatus;
	}
	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}

	

}
