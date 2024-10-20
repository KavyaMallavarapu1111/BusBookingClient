package com.techwave.busbookingclient.Models.Pojo;


public class Login {
	private String userId;
	private String password;
	private String type;
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Login(String userId, String password, String type) {
		super();
		this.userId = userId;
		this.password = password;
		this.type = type;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
