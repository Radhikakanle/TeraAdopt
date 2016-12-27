package com.techm.adopt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.techm.adopt.bean.LoginBean;
import com.techm.adopt.service.RestClientService;
import com.techm.adopt.util.Constants;

@Controller
public class UserHomeController {

	private static final Logger logger = Logger.getLogger(UserHomeController.class);
	
	@Autowired
	private RestClientService restClientService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/selectrole")
	public ModelAndView getSelectRolePage(){
		logger.info("Displaying Select Role page");
		
		return new ModelAndView("selectrole");
	}
	
	@RequestMapping("/allProjSprintDetails")
	public void getAllProjectsSprintDetails(HttpServletResponse response){
		logger.info("Getting SprintDetails of all the projects");
		
		try{
			String url=Constants.ALL_PROJ_SPRINTS_URL;
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponse");
					response.setContentType("application/json");
					response.getWriter().write(result.toString());
				}
			}
		}catch (Exception e) {
			logger.error("@UserHomeController/allProjSprintDetails :"+e.getMessage());
		}
	}
	
	@RequestMapping("/codeQualityProject")
	public void getCodeQualityProjectReport(HttpServletRequest request, HttpServletResponse response){
		logger.info("Getting CodeQuality Reports for projects");
		
		try {
			HttpSession session=request.getSession(false);
			LoginBean loginUser=(LoginBean) session.getAttribute("loginUser");
			String url=Constants.CODE_QUAL_PROJ_URL+loginUser.getUsername();
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponse");
					response.setContentType("application/json");
					response.getWriter().write(result.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@CodeAnalysisReportsController/codeQualityProject :"+e.getMessage());
		}
	}
	
	@RequestMapping("/allProjectsState")
	public void getAllProjectsStates(HttpServletResponse response){
		logger.info("Getting states of all the projects");
		
		try {
			String url=Constants.ALL_PROJ_STATES_URL;
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status= output.getString("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponse");
					response.setContentType("application/json");
					response.getWriter().write(result.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@UserHomeController/allProjectsState :"+e.getMessage());
		}
	}
	
	@RequestMapping("/openIssues")
	public void getOPenIssues(HttpServletResponse response){
		logger.info("Getting OpenIssues details");
		
		try {
			String url=Constants.OPEN_ISSUES_URL;
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponse");
					response.setContentType("application/json");
					response.getWriter().write(result.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@UserHomeController/openissues :"+e.getMessage());
		}
	}
	
	@RequestMapping("/projectlist")
	public void  getProjectsList(HttpServletRequest request, HttpServletResponse response){
		logger.info("Getting the Projects list");
		
		try{
			HttpSession session=request.getSession(false);
			LoginBean loginUser=(LoginBean) session.getAttribute("loginUser");
			String url=Constants. USER_PROJ_LIST_URL+loginUser.getUsername();
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("message").equals("success");
				if(status){
					JSONArray responseArray=output.getJSONArray("projectName");
					response.setContentType("application/json");
					response.getWriter().write(responseArray.toString());
				}
			}
		}catch (Exception e) {
			logger.error("@UserHomeController/projectlist :"+e.getMessage());
		}
	}
	
	@RequestMapping(value="/projectformsubmit", method=RequestMethod.POST)
	public void submitProjectListForm(HttpServletResponse response, HttpServletRequest request){
		logger.info("Submitting the Project form");
		
		try {
			String projectname=request.getParameter("projectname");		
			session = request.getSession(false);
			session.setAttribute("currentProject", projectname);
			
			LoginBean loginUser=(LoginBean) session.getAttribute("loginUser");
			try {
				if(loginUser.getAccessControl().isProjectLevelAccess()){
					//response.sendRedirect("projecthome");
					response.sendRedirect("projectsummary2");
				}
				else{
					response.sendRedirect("userhome");
				}
			} catch (Exception e) {
				logger.error(e.getMessage());
			}	
			
			response.sendRedirect("userhome");
		} catch (Exception e) {
			logger.error("@UserHomeController/projectformsubmit :"+e.getMessage());
		}	
		
	}
}
