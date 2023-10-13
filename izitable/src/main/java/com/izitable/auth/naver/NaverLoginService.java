package com.izitable.auth.naver;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.github.scribejava.core.model.OAuth2AccessToken;

public interface NaverLoginService {

	/* ?��?���? ?��?��?���? ?���? URL ?��?�� Method */
	String getAuthorizationUrl (HttpSession session, String domain, String port);
	
	/* ?��?���? ?��?��?���? Callback 처리 �? AccessToken ?��?�� Method */
	OAuth2AccessToken getAccessToken (HttpSession session, String code, String state, String domain, String port) throws IOException;
	
	/* ?��?�� ?��?��?�� �?증을 ?��?�� ?��?�� ?��?���? */
	String generateRandomString();
	
	/* http session?�� ?��?��?�� ???�� */
	void setSession(HttpSession session, String state);
	
	/* http session?��?�� ?��?��?�� �??��?���? */
	String getSession(HttpSession session);
	
	/* Access Token?�� ?��?��?��?�� ?��?���? ?��?��?�� ?��로필 API�? ?���? */
	String getUserProfile(OAuth2AccessToken oauthToken)throws IOException;
	
}
