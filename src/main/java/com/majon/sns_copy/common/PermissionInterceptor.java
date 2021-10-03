package com.majon.sns_copy.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


@Component
public class PermissionInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		
		String uri = request.getRequestURI();
		
		// 비로그인 경우 
		if(session.getAttribute("userId")==null) {
			
			if(uri.startsWith("/feed")) {
				response.sendRedirect("/user/signin_view");
				return false;
			}
			
		}else {
		//로그인 경우
			if(uri.startsWith("/user")) {
				response.sendRedirect("/feed/main_view");
				return false;
			}
			
		}
		
		return true;
		
	}
	
	@Override
	public void postHandle(HttpServletRequest requset
			,HttpServletResponse response
			,Object handler
			,ModelAndView modelAndView) {
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request
			,HttpServletResponse response
			,Object handler
			,Exception ex) {
		
	}
	
}
