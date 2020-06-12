package com.webrats.entities;

public class PostList {

	int plid;
	String plname;
	int pluserid;
	String pldesc;
	public PostList(String plname, int pluserid) {
		super();
		this.plname = plname;
		this.pluserid = pluserid;
	}
	public PostList() {
		super();
	}
	
	
	
	
	public PostList(String plname, String pldesc, int pluserid) {
		super();
		this.plname = plname;
		this.pluserid = pluserid;
		this.pldesc = pldesc;
	}
	public PostList(int plid, String plname, String pldesc, int pluserid) {
		super();
		this.plid = plid;
		this.plname = plname;
		this.pluserid = pluserid;
		this.pldesc = pldesc;
	}
	public PostList(int plid, String plname, int pluserid) {
		super();
		this.plid = plid;
		this.plname = plname;
		this.pluserid = pluserid;
	}
	public int getPlid() {
		return plid;
	}
	public void setPlid(int plid) {
		this.plid = plid;
	}
	public String getPlname() {
		return plname;
	}
	public void setPlname(String plname) {
		this.plname = plname;
	}
	public int getPluserid() {
		return pluserid;
	}
	public void setPluserid(int pluserid) {
		this.pluserid = pluserid;
	}
	public String getPldesc() {
		return pldesc;
	}
	public void setPldesc(String pldesc) {
		this.pldesc = pldesc;
	}
	@Override
	public String toString() {
		return "PostList [plid=" + plid + ", plname=" + plname + ", pluserid=" + pluserid + ", pldesc=" + pldesc + "]";
	}
	
	
	
	
	
}
