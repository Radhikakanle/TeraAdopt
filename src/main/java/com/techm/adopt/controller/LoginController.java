package com.techm.adopt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.techm.adopt.bean.AccessControlBean;
import com.techm.adopt.bean.LoginBean;
import com.techm.adopt.service.AccessControlService;
import com.techm.adopt.service.RestClientService;
import com.techm.adopt.util.Constants;

@Controller
public class LoginController {

	private static final Logger logger = Logger.getLogger(LoginController.class);
	
	@Autowired
	private RestClientService restClientService;
	@Autowired
	private HttpSession session;
	@Autowired
	private AccessControlService accessControlService;
	 
	@RequestMapping(value="/authentication", method=RequestMethod.POST)
	public ModelAndView authenticateUser(@ModelAttribute("login") LoginBean login, BindingResult result, HttpServletResponse response, HttpServletRequest request){
		logger.info("Authenticating the user: "+login.getUsername());
		
		try {
			String url=Constants.USER_AUTH_URL+login.getUsername()+"/"+login.getPassword();
			JSONObject output= restClientService.getOutputFromURL(url);
			if(response!=null){
				Boolean status=(Boolean) output.get("response");
				if(status){
					session=request.getSession();
					response.setHeader("Cache-Control",
					"no-cache, no-store, must-revalidate");
					response.setHeader("Pragma", "no-cache");
					response.setDateHeader("Expires", 0);
					login.setUserDisplayName(output.getString("displayName"));
					session.setAttribute("loginUser", login);
					//return new ModelAndView("redirect:userhome"); 
					return new ModelAndView("redirect:userhome2");
				}
				else{
					return new ModelAndView("redirect:invalidlogin");					
				}
			}
		} catch (Exception e) {
			logger.error("@LoginController/authentication :"+e.getMessage());
		}
		
		
		return new ModelAndView("userrole");
	}
	
	@RequestMapping("/roleslist")
	public void getRoles(HttpServletRequest request, HttpServletResponse response){
		logger.info("Getting Roles for User");
		
		try {
			session=request.getSession(false);
			LoginBean loginUser=(LoginBean) session.getAttribute("loginUser");
			String url=Constants.ROLES_LIST_URL+loginUser.getUsername();
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("message").equals("success");
				if(status){
					JSONArray resultArray=output.getJSONArray("rollName");
					response.setContentType("application/json");
					response.getWriter().write(resultArray.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@LoginController/roleslist :"+e.getMessage());
		}
	}
	
	@RequestMapping("/userhome")
	public ModelAndView getUserHome(HttpServletRequest request){
		logger.info("Displaying Userhome Page");
		
		try {
			session=request.getSession(false);
			LoginBean loginUser=(LoginBean) session.getAttribute("loginUser");
			String url=Constants. USER_PROJ_LIST_URL+loginUser.getUsername();
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("message").equals("success");
				if(status){
					JSONArray responseArray=output.getJSONArray("projectName");
					if(responseArray!=null){
						session.setAttribute("currentProject", responseArray.get(0).toString());
					}	
				}								
			}			
		} catch (Exception e) {
			logger.error("@LoginController/userhome :"+e.getMessage());
		}
		return new ModelAndView("userhome");
	}
	
	@RequestMapping(value="/userhome2")
	public ModelAndView getPostUsername(HttpServletRequest request){
		logger.info("Displaying Userhome Page/PostMethod");
		
		try {
			session=request.getSession(false);
			LoginBean loginUser=(LoginBean) session.getAttribute("loginUser");
			
			/*String role=request.getParameter("usersrole");
			loginUser.setRoleName(role);*/
			String url=Constants. USER_PROJ_LIST_URL+loginUser.getUsername();
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("message").equals("success");
				if(status){
					JSONArray responseArray=output.getJSONArray("projectName");
					if(responseArray!=null){
						session.setAttribute("currentProject", responseArray.get(0).toString());
					}	
				}								
			}

			AccessControlBean accessControlBean=accessControlService.getAccessControlRulesForUser(loginUser.getUsername());
			loginUser.setAccessControl(accessControlBean);
			
			try {
				if(loginUser.getAccessControl().isProgramLevelAccess()){
					/*return new ModelAndView("userhome");*/
					return new ModelAndView("programdashboard");
				}else if(loginUser.getAccessControl().isProjectLevelAccess()){
					/*return new ModelAndView("redirect:projecthome");*/
					return new ModelAndView("redirect:projectsummary2");
				}else{
					return new ModelAndView("unauthorized");
				}
				
			} catch (Exception e) {
				logger.error("Unauthorized Access");
			}
		} catch (Exception e) {
			logger.error("@LoginController/userhomePost :"+e.getMessage());
		}
		
		return new ModelAndView("unauthorized");
	}
}
