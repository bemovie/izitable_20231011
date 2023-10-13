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
	
	
	/* ?Έμ¦? ?μ²?λ¬Έμ κ΅¬μ±?? ??Όλ―Έν° */
    //client_id: ? ?λ¦¬μ??΄? ?±λ‘? ? λ°κΈλ°μ? ?΄?Ό?΄?Έ?Έ ??΄?
    //response_type: ?Έμ¦? κ³Όμ ? ??? κ΅¬λΆκ°?. codeλ‘? κ°μ΄ κ³ μ ?Ό ??΅??€.
    //redirect_uri: ?€?΄λ²? λ‘κ·Έ?Έ ?Έμ¦μ κ²°κ³Όλ₯? ? ?¬λ°μ μ½λ°± URL(URL ?Έμ½λ©). ? ?λ¦¬μ??΄?? ?±λ‘ν  ? Callback URL? ?€? ? ? λ³΄μ??€.
    //state: ? ?λ¦¬μ??΄??΄ ??±? ?? ? ?°
    private final static String CLIENT_ID = "vBzrSa7Q3a2LO1jDPLdi";
    private final static String CLIENT_SECRET = "K5yUo4PlYm";
    private final static String REDIRECT_URI = "http://localhost:8083/login/naverLogin";
    private final static String SESSION_STATE = "oauth_state";
    /* ?λ‘ν μ‘°ν API URL */
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    /* ?€?΄λ²? ??΄?λ‘? ?Έμ¦? URL ??± Method */
    public String getAuthorizationUrl (HttpSession session, String domain, String port) {
		String redirectUri = "http://" + domain + ":" + port + REDIRECT_URI;
        /* ?Έ? ? ?¨?± κ²?μ¦μ ???¬ ??λ₯? ??± */
        String state = generateRandomString();
        /* ??±? ?? κ°μ session? ???₯ */
        setSession(session, state);
        /* Scribe?? ? κ³΅ν? ?Έμ¦? URL ??± κΈ°λ₯? ?΄?©??¬ ?€?λ‘? ?Έμ¦? URL ??± */
        OAuth20Service oauthService = new ServiceBuilder()
        		.apiKey(CLIENT_ID)
        		.apiSecret(CLIENT_SECRET)
                .callback(REDIRECT_URI)
                .state(state) // ?? ??±? ??κ°μ ?Έμ¦? URL??±? ?¬?©?¨
                .build(NaverLoginApi.instance());
        return oauthService.getAuthorizationUrl();
    }
    
    /* ?€?΄λ²μ?΄?λ‘? Callback μ²λ¦¬ λ°? AccessToken ?? Method */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
        /* Callback?Όλ‘? ? ?¬λ°μ? ?Έ? κ²?μ¦μ© ??κ°κ³Ό ?Έ?? ???₯??΄?? κ°μ΄ ?ΌμΉν?μ§? ??Έ */
        String sessionState = getSession(session);
        if (StringUtils.pathEquals(sessionState, state)) {
            OAuth20Service oauthService = new ServiceBuilder()
            		.apiKey(CLIENT_ID)
            		.apiSecret(CLIENT_SECRET)
                    .callback(REDIRECT_URI)
                    .state(state)
                    .build(NaverLoginApi.instance());
            /* Scribe?? ? κ³΅ν? AccessToken ?? κΈ°λ₯?Όλ‘? ?€?λ‘? Access Token? ?? */
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
            return accessToken;
        }
        return null;
    }
    
    /* ?Έ? ? ?¨?± κ²?μ¦μ ?? ?? ??±κΈ? */
    @Override
    public String generateRandomString() {
        return UUID.randomUUID().toString();
    }
    
    /* http session? ?°?΄?° ???₯ */
    @Override
    public void setSession(HttpSession session, String state) {
        session.setAttribute(SESSION_STATE, state);
    }
    
    /* http session?? ?°?΄?° κ°?? Έ?€κΈ? */
    @Override
    public String getSession(HttpSession session) {
        return (String) session.getAttribute(SESSION_STATE);
    }
    
    /* Access Token? ?΄?©??¬ ?€?΄λ²? ?¬?©? ?λ‘ν APIλ₯? ?ΈμΆ? */
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
