package com.webrats.entities;

public class Categories {
	
	int cId ;
	String cName ;
	String cDesc ;
	/**
	 * @param cId
	 * @param cName
	 * @param cDesc
	 */
	public Categories(int cId, String cName, String cDesc) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cDesc = cDesc;
	}
	/**
	 * 
	 */
	public Categories() {
		super();
	}
	/**
	 * @param cName
	 * @param cDesc
	 */
	
	
	public Categories(String cName, String cDesc) {
		super();
		this.cName = cName;
		this.cDesc = cDesc;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcDesc() {
		return cDesc;
	}
	public void setcDesc(String cDesc) {
		this.cDesc = cDesc;
	}
	
	

}
