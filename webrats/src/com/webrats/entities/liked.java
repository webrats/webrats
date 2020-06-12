package com.webrats.entities;

public class liked {

	
	int lid;
	int uid;
	int pid;
	public liked(int lid, int uid, int pid) {
		super();
		this.lid = lid;
		this.uid = uid;
		this.pid = pid;
	}
	public liked(int uid, int pid) {
		super();
		this.uid = uid;
		this.pid = pid;
	}
	public liked() {
		super();
	}
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return "liked [lid=" + lid + ", uid=" + uid + ", pid=" + pid + "]";
	}
	
}
