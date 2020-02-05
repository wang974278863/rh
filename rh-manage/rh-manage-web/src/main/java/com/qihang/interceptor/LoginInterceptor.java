package com.qihang.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	private List<String> commonUrl; 
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String requestUrl = request.getRequestURI();
		for (String url : commonUrl) {
			if(requestUrl.contains(url)){
				return true;
			}
		}
		
		if(request.getSession().getAttribute("admin") != null){
			return true;
		}
		response.sendRedirect("login");
		return false;
	}
	
	
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}


	public List<String> getCommonUrl() {
		return commonUrl;
	}

	public void setCommonUrl(List<String> commonUrl) {
		this.commonUrl = commonUrl;
	}

	
	
}
