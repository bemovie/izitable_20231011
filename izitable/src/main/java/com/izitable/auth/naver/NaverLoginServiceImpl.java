package com.izitable.auth.naver;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginServiceImpl implements NaverLoginService {
	
	
	/* ?¸ì¦? ?š”ì²?ë¬¸ì„ êµ¬ì„±?•˜?Š” ?ŒŒ?¼ë¯¸í„° */
    //client_id: ?• ?”Œë¦¬ì??´?…˜ ?“±ë¡? ?›„ ë°œê¸‰ë°›ì? ?´?¼?´?–¸?Š¸ ?•„?´?””
    //response_type: ?¸ì¦? ê³¼ì •?— ???•œ êµ¬ë¶„ê°?. codeë¡? ê°’ì´ ê³ ì •?¼ ?ˆ?Šµ?‹ˆ?‹¤.
    //redirect_uri: ?„¤?´ë²? ë¡œê·¸?¸ ?¸ì¦ì˜ ê²°ê³¼ë¥? ? „?‹¬ë°›ì„ ì½œë°± URL(URL ?¸ì½”ë”©). ?• ?”Œë¦¬ì??´?…˜?„ ?“±ë¡í•  ?•Œ Callback URL?— ?„¤? •?•œ ? •ë³´ì…?‹ˆ?‹¤.
    //state: ?• ?”Œë¦¬ì??´?…˜?´ ?ƒ?„±?•œ ?ƒ?ƒœ ?† ?°
    private final static String CLIENT_ID = "vBzrSa7Q3a2LO1jDPLdi";
    private final static String CLIENT_SECRET = "K5yUo4PlYm";
    private final static String REDIRECT_URI = "http://localhost:8083/login/naverLogin";
    private final static String SESSION_STATE = "oauth_state";
    /* ?”„ë¡œí•„ ì¡°íšŒ API URL */
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    /* ?„¤?´ë²? ?•„?´?””ë¡? ?¸ì¦? URL ?ƒ?„± Method */
    public String getAuthorizationUrl (HttpSession session, String domain, String port) {
		String redirectUri = "http://" + domain + ":" + port + REDIRECT_URI;
        /* ?„¸?…˜ ?œ ?š¨?„± ê²?ì¦ì„ ?œ„?•˜?—¬ ?‚œ?ˆ˜ë¥? ?ƒ?„± */
        String state = generateRandomString();
        /* ?ƒ?„±?•œ ?‚œ?ˆ˜ ê°’ì„ session?— ???¥ */
        setSession(session, state);
        /* Scribe?—?„œ ? œê³µí•˜?Š” ?¸ì¦? URL ?ƒ?„± ê¸°ëŠ¥?„ ?´?š©?•˜?—¬ ?„¤?•„ë¡? ?¸ì¦? URL ?ƒ?„± */
        OAuth20Service oauthService = new ServiceBuilder()
        		.apiKey(CLIENT_ID)
        		.apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state) // ?•?„œ ?ƒ?„±?•œ ?‚œ?ˆ˜ê°’ì„ ?¸ì¦? URL?ƒ?„±?‹œ ?‚¬?š©?•¨
                .build(NaverLoginApi.instance());
        return oauthService.getAuthorizationUrl();
    }
    
    /* ?„¤?´ë²„ì•„?´?””ë¡? Callback ì²˜ë¦¬ ë°? AccessToken ?š?“ Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
        /* Callback?œ¼ë¡? ? „?‹¬ë°›ì? ?„¸?„ ê²?ì¦ìš© ?‚œ?ˆ˜ê°’ê³¼ ?„¸?…˜?— ???¥?˜?–´?ˆ?Š” ê°’ì´ ?¼ì¹˜í•˜?Š”ì§? ?™•?¸ */
        String sessionState = getSession(session);
        if (StringUtils.pathEquals(sessionState, state)) {
            OAuth20Service oauthService = new ServiceBuilder()
            		.apiKey(CLIENT_ID)
            		.apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());
            /* Scribe?—?„œ ? œê³µí•˜?Š” AccessToken ?š?“ ê¸°ëŠ¥?œ¼ë¡? ?„¤?•„ë¡? Access Token?„ ?š?“ */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }
    
    /* ?„¸?…˜ ?œ ?š¨?„± ê²?ì¦ì„ ?œ„?•œ ?‚œ?ˆ˜ ?ƒ?„±ê¸? */
    @Override
    public String generateRandomString() {
        return UUID.randomUUID().toString();
    }
    
    /* http session?— ?°?´?„° ???¥ */
    @Override
    public void setSession(HttpSession session, String state) {
        session.setAttribute(SESSION_STATE, state);
    }
    
    /* http session?—?„œ ?°?´?„° ê°?? ¸?˜¤ê¸? */
    @Override
    public String getSession(HttpSession session) {
        return (String) session.getAttribute(SESSION_STATE);
    }
    
    /* Access Token?„ ?´?š©?•˜?—¬ ?„¤?´ë²? ?‚¬?š©? ?”„ë¡œí•„ APIë¥? ?˜¸ì¶? */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
        OAuth20Service oauthService = new ServiceBuilder()
        		.apiKey(CLIENT_ID)
        		.apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .build(NaverLoginApi.instance());
        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
    }

	@Override
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state, String domain, String port)
			throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
