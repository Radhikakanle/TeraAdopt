package com.techm.adopt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.ModelAndView;

@Component
public class SessionInterceptor extends HandlerInterceptorAdapter{

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView arg3)
			throws Exception {
		/*if(request.getServletPath().equals("/authentication")){
	
		}*/		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session=request.getSession(false);
		String path=request.getServletPath();
		
		if(path.equals("/")){
			response.sendRedirect("home");
			return false;
		}
		
		else if(path.equals("/userhome")){
			boolean loggedIn=session!=null && session.getAttribute("loginUser")!=null;
			if(loggedIn){
				response.setHeader("Cache-Control",
						"no-cache, no-store, must-revalidate");
				response.setHeader("Pragma", "no-cache");
				response.setDateHeader("Expires", 0);
				return true;
			}
			else{
				response.sendRedirect("invalidsession");
				return false;
			}
		}
		
		else if(path.equals("/projecthome")){
			boolean loggedIn=session!=null && session.getAttribute("loginUser")!=null && session.getAttribute("currentProject")!=null;
			if(loggedIn){
				response.setHeader("Cache-Control",
						"no-cache, no-store, must-revalidate");
				response.setHeader("Pragma", "no-cache");
				response.setDateHeader("Expires", 0);
				return true;
			}
			else{
				response.sendRedirect("invalidsession");
				return false;
			}
		}
		
		return true;
	}

}
