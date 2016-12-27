package com.techm.adopt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.techm.adopt.bean.LoginBean;

@Controller
public class LogoutController {
	
	private static final Logger logger = Logger.getLogger(LogoutController.class);
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/invalidlogin")
	public ModelAndView loginInvalid(Model model){
		logger.info("Invalid Login");
		
		model.addAttribute("login",new LoginBean());
		model.addAttribute("msg1","Invalid Credentials!");
		model.addAttribute("msg2","Please Enter the Correct Username and Password to Login.");
		model.addAttribute("title","Invalid Login");
		return new ModelAndView("invalidlogin");
	}
	
	@RequestMapping("/invalidsession")
	public ModelAndView sessionInvalid(Model model){
		logger.info("Session Invalid");
		
		model.addAttribute("login",new LoginBean());
		model.addAttribute("msg1","Session Expired!");
		model.addAttribute("msg2","Kindly Login Again.");
		model.addAttribute("title","Session Invalid");
		return new ModelAndView("invalidlogin");
	}
	
	@RequestMapping("/logout")
	public ModelAndView logoutSession(HttpServletRequest request, HttpServletResponse response){
		logger.info("User is loging out");
		
		session=request.getSession(false);
		if(session!=null){
			response.setHeader("Cache-Control",
					"no-cache, no-store, must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
			session.invalidate();
		}
		
		return new ModelAndView("redirect:home");
	}
}
