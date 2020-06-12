package com.webrats.entities;

public class Message {
	
	private String content ;
	private String type ;
	private String Csstype;
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the csstype
	 */
	public String getCsstype() {
		return Csstype;
	}
	/**
	 * @param csstype the csstype to set
	 */
	public void setCsstype(String csstype) {
		Csstype = csstype;
	}
	/**
	 * @param content
	 * @param type
	 * @param csstype
	 */
	public Message(String content, String type, String csstype) {
		super();
		this.content = content;
		this.type = type;
		Csstype = csstype;
	}
	/**
	 * @param content
	 * @param type
	 */
	public Message(String content, String type) {
		super();
		this.content = content;
		this.type = type;
	}
	
	
	

}
