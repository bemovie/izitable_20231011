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
	    
	    //?¬?©? ? κ·ΌκΆ?? λ°λ μ£Όμ
	    @Override
	    public String getAccessTokenEndpoint() {
	        return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	    }
	 
	    //?€?΄λ²? ?¬?©? ???? ?¨? μ£Όμ
	    @Override
	    protected String getAuthorizationBaseUrl() {
	        return "https://nid.naver.com/oauth2.0/authorize";
	    }
	
}
