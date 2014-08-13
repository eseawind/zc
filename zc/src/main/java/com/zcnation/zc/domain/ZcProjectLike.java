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

@Entity(name = "zc_project_like")
public class ZcProjectLike implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8465823412125942590L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="LIKE_CODE")
	private int likeCode;
	@Column(name="USER_CODE")
	private int userCode;
	
	@Column(name="LIKE_TIME")
	
	private Date likeTime;
	
	@OneToOne
	@JoinColumn(name="PRO_CODE",referencedColumnName="PRO_CODE")
	private ZcProjectInfo zcProjectInfo;

	public ZcProjectInfo getZcProjectInfo() {
		return zcProjectInfo;
	}

	public void setZcProjectInfo(ZcProjectInfo zcProjectInfo) {
		this.zcProjectInfo = zcProjectInfo;
	}

	public int getLikeCode() {
		return likeCode;
	}

	public void setLikeCode(int likeCode) {
		this.likeCode = likeCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	

	public Date getLikeTime() {
		return likeTime;
	}

	public void setLikeTime(Date likeTime) {
		this.likeTime = likeTime;
	}

	
}
