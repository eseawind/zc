package com.zcnation.zc.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "zc_resource_info")
public class ZcResourceInfo implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int resourceCode;
	private Date uptDate;
	private String uptIp;
	private String resourceName;
	private String resourceUrl;
	private String rstatus;

	public int getResourceCode() {
		return resourceCode;
	}

	public void setResourceCode(int resourceCode) {
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
