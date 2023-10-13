package com.izitable.auth.naver;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.github.scribejava.core.model.OAuth2AccessToken;

public interface NaverLoginService {

	/* ?€?΄λ²? ?΄?΄?λ‘? ?Έμ¦? URL ??± Method */
	String getAuthorizationUrl (HttpSession session, String domain, String port);
	
	/* ?€?΄λ²? ??΄?λ‘? Callback μ²λ¦¬ λ°? AccessToken ?? Method */
	OAuth2AccessToken getAccessToken (HttpSession session, String code, String state, String domain, String port) throws IOException;
	
	/* ?Έ? ? ?¨?± κ²?μ¦μ ?? ?? ??±κΈ? */
	String generateRandomString();
	
	/* http session? ?°?΄?° ???₯ */
	void setSession(HttpSession session, String state);
	
	/* http session?? ?°?΄?° κ°?? Έ?€κΈ? */
	String getSession(HttpSession session);
	
	/* Access Token? ?΄?©??¬ ?€?΄λ²? ?¬?©? ?λ‘ν APIλ₯? ?ΈμΆ? */
	String getUserProfile(OAuth2AccessToken oauthToken)throws IOException;
	
}
