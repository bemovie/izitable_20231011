package com.izitable.model;

public class User {
	private int userNo;				//회원 번호
	private String userEmail;		//회원 이메일(아이디)
	private String userPwd;			//회원 비밀번호
	private String userPhone;		//회원 전화번호
	private String userPhoneCert;	//회원 전화번호 인증여부
	
	private String loginType;		//로그인 타입
	
	public String getLoginType() {
		return loginType;
	}
	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserPhoneCert() {
		return userPhoneCert;
	}
	public void setUserPhoneCert(String userPhoneCert) {
		this.userPhoneCert = userPhoneCert;
	}
}
