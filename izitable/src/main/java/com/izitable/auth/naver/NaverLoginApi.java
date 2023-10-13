package com.izitable.auth.naver;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20{

	protected NaverLoginApi() {}
	 
	    private static class InstanceHolder{
	        private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	    }
	    
	    public static NaverLoginApi instance() {
	        return InstanceHolder.INSTANCE;
	    }
	    
	    //?‚¬?š©? ? ‘ê·¼ê¶Œ?•œ?„ ë°›ëŠ” ì£¼ì†Œ
	    @Override
	    public String getAccessTokenEndpoint() {
	        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	    }
	 
	    //?„¤?´ë²? ?‚¬?š©? ?™?˜?? ?œ¨?Š” ì£¼ì†Œ
	    @Override
	    protected String getAuthorizationBaseUrl() {
	        return "https://nid.naver.com/oauth2.0/authorize";
	    }
	
}
