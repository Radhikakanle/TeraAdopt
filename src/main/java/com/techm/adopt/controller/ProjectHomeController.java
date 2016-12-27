package com.techm.adopt.controller;

import java.io.IOException;
import java.util.List;

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

import com.techm.adopt.bean.ReportsPageBean;
import com.techm.adopt.service.ProjectDashboardService;
import com.techm.adopt.service.RestClientService;
import com.techm.adopt.util.Constants;

@Controller
public class ProjectHomeController {

	private static final Logger logger = Logger.getLogger(ProjectHomeController.class);
	
	@Autowired
	private RestClientService restClientService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private ProjectDashboardService projectDashboardService;
	
	@RequestMapping("/projecthome")
	public ModelAndView getProjectHome(){
		logger.info("Getting ProjectHome page");
		
		return new ModelAndView("projecthome");
	}
	
	@RequestMapping("/projectsummary2")
	public ModelAndView getProjectSummary(){
		logger.info("Getting ProjectSummary Page");
		
		List<ReportsPageBean> reportsPageList=null;
		try {
			String url=Constants.REPORTS_LIST_URL;
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("status").equals("success");
				if(status){
					JSONArray result=output.getJSONArray("reponse");
					reportsPageList=projectDashboardService.getReportPageList(result);	
				}
			}
		} catch (Exception e) {
			logger.error("@ProjectDashboardController/projectdashboardhome :"+e.getMessage());
		}
		
		return new ModelAndView("projectsummary2","reportpage",reportsPageList);
	}
	
	@RequestMapping("/buildgraph")
	private void getBuildGraph(HttpServletRequest request, HttpServletResponse response) {
		logger.info("Getting BuildDetails graph");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.BUILD_GRAPH_URL+projectName;
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("status").equals("success");
				if(status){
					JSONArray result=output.getJSONArray("reponse");
					response.setContentType("application/json");
					response.getWriter().write(result.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@ProjectHomeController/buildgraph :"+e.getMessage());
		}
	}
	
	@RequestMapping("/deploymentdailygraph")
	public void deploymentDailyDetailsGraph(HttpServletRequest request,HttpServletResponse response){
		logger.info("Getting DeploymentDailyGraph details");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.DEP_DAILY_GRAPH_URL+projectName;
			JSONObject output= restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponseMap");
					JSONArray array=result.getJSONArray("response");
					response.setContentType("application/json");
					response.getWriter().write(array.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@ProjectHomeController/deploymentdailygraph :"+e.getMessage());
		}
	}
	
	@RequestMapping("/deploymentenvgraph")
	public void deploymentEnvDetailsGraph(HttpServletRequest request,HttpServletResponse response){
		logger.info("Getting DeploymentDetailsPerEnv details");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.DEP_ENV_GRAPH_URL+projectName;
			JSONObject output= restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponseMap");
					JSONArray array=result.getJSONArray("response");
					response.setContentType("application/json");
					response.getWriter().write(array.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@ProjectHomeController/deploymentenvgraph :"+e.getMessage());
		}
	}
	
	@RequestMapping("/codeanalysisissuegraph")
	public void codeAnalysisDetailsGraph(HttpServletRequest request,HttpServletResponse response){
		logger.info("Getting CodeAnalysisGraph details");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.CODE_ANALYSIS_GRAPH_URL+projectName;
			JSONObject output= restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponseMap");
					JSONArray array=result.getJSONArray("response");
					response.setContentType("application/json");
					response.getWriter().write(array.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@ProjectHomeController/codeanalysisissuegraph :"+e.getMessage());
		}
	}
	
	@RequestMapping("/projectburndown")
	public void getProjectBurndownReport(HttpServletRequest request,HttpServletResponse response){
		logger.info("Getting ProjectBurndownReport details");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.SPRINT_BURNDOWN_URL+projectName;
			//String url="http://localhost:8888/AdoptRestAPI/rest/services/project/reports/sprintburndown/"+projectName;
			JSONObject output= restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("status").equals("success");
				if(status){
					JSONArray result=output.getJSONArray("reponse");
					response.setContentType("application/json");
					response.getWriter().write(result.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@ProjectHomeController/projectburndown :"+e.getMessage());
		}
	}
	
	@RequestMapping("/testtrend")
	public void getTrestTrendReport(HttpServletRequest request,HttpServletResponse response){
		logger.info("Getting TestTrend details");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.TEST_TREND_URL+projectName;
			JSONObject output= restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("status").equals("success");
				if(status){
					JSONArray result=output.getJSONArray("reponse");
					response.setContentType("application/json");
					response.getWriter().write(result.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@ProjectHomeController/testtrend :"+e.getMessage());
		}
	}
	
	@RequestMapping(value="/buildIDs")
	public void getBuildIds(HttpServletRequest request,HttpServletResponse response){
		
		String projectname=session.getAttribute("currentProject").toString();
			String url=Constants.BUILDIDS_PER_PROJ_URL+projectname;
			JSONObject output= restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponseMap");
					JSONArray array=result.getJSONArray("response");
					response.setContentType("application/json");
					try {
						response.getWriter().write(array.toString());
					} catch (IOException e) {
						logger.error("@DeploymentReportsController :"+e.getMessage());
					}
				}
			}
	}
	
	@RequestMapping(value="/buildpipeline", method=RequestMethod.POST)
	public void buildPromotion(HttpServletRequest request,HttpServletResponse response){
		session=request.getSession(false);
		String projectname=session.getAttribute("currentProject").toString();
		String bid=request.getParameter("buildid");
			String url=Constants.AUTOBUILD_URL+projectname+"/"+bid;
			JSONObject output= restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("response1");
					response.setContentType("application/json");
					try {
						response.getWriter().write(result.get("jobStatus").toString());
					} catch (IOException e) {
						logger.error("@BuildReportsController :"+e.getMessage());
					}
				}
			}
	}
	
	@RequestMapping("/projectdashboard")
	public ModelAndView getProjectDashboard(HttpServletRequest request){
		logger.info("Getting ProjectDashboard");
		
		session=request.getSession(false);
		if(session!=null){
			String projectName = request.getParameter("projectname");
			session.setAttribute("currentProject", projectName);
			return new ModelAndView("redirect:application?pagename=projecthome");
		}
		else{
			return new ModelAndView("redirect:invalidsession");
		}
	}
}
