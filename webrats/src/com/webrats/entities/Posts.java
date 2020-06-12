package com.webrats.entities;

import java.sql.Timestamp;

public class Posts {

	int pId;
	String pTitle;
	String pContent;
	String pCode;
	String pPicture;
	int pcId ;
	Timestamp pdate ;
	int userId;
	int plid ;
	
	
	/**
	 * @param pId
	 * @param pTitle
	 * @param pContent
	 * @param pCode
	 * @param pPicture
	 * @param pcId
	 * @param pdate
	 */
	public Posts(int pId, String pTitle, String pContent, String pPicture, int pcId, Timestamp pdate,int userId) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pPicture = pPicture;
		this.pcId = pcId;
		this.pdate = pdate;
		this.userId = userId;
	}
	/**
	 * 
	 */
	public Posts() {
		super();
	}
	/**
	 * @param pTitle
	 * @param pContent
	 * @param pCode
	 * @param pPicture
	 * @param pcId
	 */
	
	//Add Post Constructor
	public Posts(String pTitle, String pContent, String pPicture, int pcId,int userId ,int plid) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pPicture = pPicture;
		this.pcId = pcId;
		this.userId = userId;
		this.plid = plid;
	}
	
	
	
	//Edit Post Constructor

	public Posts(String pTitle, String pContent,int pId, int pcId, int userId, int plid) {
		super();
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pId =pId;
		this.pcId = pcId;
		this.userId = userId;
		this.plid = plid;
	}
	
	public Posts(int pId, String pTitle, String pContent, String pPicture, int pcId, int userId, int plid) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pPicture = pPicture;
		this.pcId = pcId;
		this.userId = userId;
		this.plid = plid;
	}
	
	
	
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpPicture() {
		return pPicture;
	}
	public void setpPicture(String pPicture) {
		this.pPicture = pPicture;
	}
	public int getPcId() {
		return pcId;
	}
	public void setPcId(int pcId) {
		this.pcId = pcId;
	}
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPlid() {
		return plid;
	}
	public void setPlid(int plid) {
		this.plid = plid;
	}
	@Override
	public String toString() {
		return "Posts [pId=" + pId + ", pTitle=" + pTitle + ", pContent=" + pContent + ", pCode=" + pCode
				+ ", pPicture=" + pPicture + ", pcId=" + pcId + ", pdate=" + pdate + ", userId=" + userId + ", plid="
				+ plid + "]";
	}
	
	
	
	
	
	
}
