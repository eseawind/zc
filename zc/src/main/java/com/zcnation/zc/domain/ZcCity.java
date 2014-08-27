package com.zcnation.zc.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="zc_city")
public class ZcCity implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ID")
	private Integer id;
	@Column(name="NAME")
	private String name;
	@Column(name="LEVEL")
	private Integer level;
	@Column(name="PARENT_ID")
	private Integer parentsID;
	@Column(name="DISPLAYORDER")
	private Integer displayorder;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Integer getParentsID() {
		return parentsID;
	}
	public void setParentsID(Integer parentsID) {
		this.parentsID = parentsID;
	}
	public Integer getDisplayorder() {
		return displayorder;
	}
	public void setDisplayorder(Integer displayorder) {
		this.displayorder = displayorder;
	}


}
