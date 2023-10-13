package com.izitable.auth.naver;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.github.scribejava.core.model.OAuth2AccessToken;

public interface NaverLoginService {

	/* ?„¤?´ë²? ?´?´?””ë¡? ?¸ì¦? URL ?ƒ?„± Method */
	String getAuthorizationUrl (HttpSession session, String domain, String port);
	
	/* ?„¤?´ë²? ?•„?´?””ë¡? Callback ì²˜ë¦¬ ë°? AccessToken ?š?“ Method */
	OAuth2AccessToken getAccessToken (HttpSession session, String code, String state, String domain, String port) throws IOException;
	
	/* ?„¸?…˜ ?œ ?š¨?„± ê²?ì¦ì„ ?œ„?•œ ?‚œ?ˆ˜ ?ƒ?„±ê¸? */
	String generateRandomString();
	
	/* http session?— ?°?´?„° ???¥ */
	void setSession(HttpSession session, String state);
	
	/* http session?—?„œ ?°?´?„° ê°?? ¸?˜¤ê¸? */
	String getSession(HttpSession session);
	
	/* Access Token?„ ?´?š©?•˜?—¬ ?„¤?´ë²? ?‚¬?š©? ?”„ë¡œí•„ APIë¥? ?˜¸ì¶? */
	String getUserProfile(OAuth2AccessToken oauthToken)throws IOException;
	
}
