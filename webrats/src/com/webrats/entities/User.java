package com.webrats.entities;

import java.sql.Timestamp;

public class User {
	
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender ;
	private String check;
	private Timestamp datetimTime ;
	private String profile ;
	private String about ;
	
	
	/**
	 * @param id
	 * @param name
	 * @param email
	 * @param password
	 * @param gender
	 * @param check
	 * @param datetimTime
	 */
	public User(int id, String name, String email, String password, String gender, String check,
			Timestamp datetimTime) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.check = check;
		this.datetimTime = datetimTime;
	}


	/**
	 * @param name
	 * @param email
	 * @param password
	 * @param gender
	 * @param check
	 */
	
	
	
	


	/**
	 * @param name
	 * @param email
	 * @param password
	 * @param gender
	 * @param about
	 * @param profile
	 */
	public User(String name, String email, String password, String gender ,String about , String profile) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.profile = profile;
		
	}
	
	
	


	/**
	 * @param name
	 * @param email
	 * @param password
	 * @param gender
	 * @param about
	 */
	public User(String name, String email, String password, String gender, String about) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
	}


	/**
	 * 
	 */
	public User() {
		super();
	}

	
	
	
	
	
	
	
	// Getter and Setter Method

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}


	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}


	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}


	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}


	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}


	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}


	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}


	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}


	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}


	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}


	/**
	 * @return the check
	 */
	public String getCheck() {
		return check;
	}


	/**
	 * @param check the check to set
	 */
	public void setCheck(String check) {
		this.check = check;
	}



	
	
	




	/**
	 * @return the datetimTime
	 */
	public Timestamp getDatetimTime() {
		return datetimTime;
	}


	/**
	 * @param datetimTime the datetimTime to set
	 */
	public void setDatetimTime(Timestamp datetimTime) {
		this.datetimTime = datetimTime;
	}


	/**
	 * @return the profile
	 */
	public String getProfile() {
		return profile;
	}


	/**
	 * @param profile the profile to set
	 */
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	


	/**
	 * @return the about
	 */
	public String getAbout() {
		return about;
	}


	/**
	 * @param about the about to set
	 */
	public void setAbout(String about) {
		this.about = about;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", gender="
				+ gender + ", check=" + check + ", datetimTime=" + datetimTime + ", profile=" + profile + ", about="
				+ about + "]";
	}


	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
