package com.techm.adopt.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.techm.adopt.bean.LoginBean;
import com.techm.adopt.bean.ReportsPageBean;
import com.techm.adopt.service.ProjectDashboardService;
import com.techm.adopt.service.RestClientService;
import com.techm.adopt.util.Constants;

@Controller
public class ProjectDashboardController {
	
	private static final Logger logger = Logger.getLogger(ProjectDashboardController.class);

	@Autowired
	private RestClientService restClientService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ProjectDashboardService projectDashboardService;
	
	@RequestMapping("/application")
	public ModelAndView getProjectDashboardView(HttpServletRequest request){
		logger.info("Getting ProjectDashboard page");
		
		List<LoginBean> iframeUrl=null;
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String pagename = request.getParameter("pagename");
			LoginBean loginUser=(LoginBean) session.getAttribute("loginUser");
			String url=Constants.TABS_LIST_URL+loginUser.getRoleName()+"/"+projectName;	
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("status").equals("success");
				if(status){
					JSONArray result=output.getJSONArray("reponse");
					List<LoginBean> tabsList=projectDashboardService.getTabsListFromJSON(result);
					if(tabsList!=null){
						session.setAttribute("tabsList", tabsList);
						iframeUrl=projectDashboardService.getPage(result,pagename);
					}
				}
				else{
					JSONArray result=new JSONArray();
					List<LoginBean> tabsList=projectDashboardService.getTabsListFromJSON(result);
					if(tabsList!=null){
						session.setAttribute("tabsList", tabsList);
						iframeUrl=projectDashboardService.getPage(result,pagename);
					}
				}
			}
			
		} catch (Exception e) {
			logger.error("@ProjectDashboardController/application :"+e.getMessage());
		}
		return new ModelAndView("dashboard","iframeurl",iframeUrl);
	}
	
	@RequestMapping("/projectdashboardhome")
	public ModelAndView getProjectHomeDashboard(){
		logger.info("Getting Project Dashboard Home Page");
		
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
		
		return new ModelAndView("projectdashboardhome","reportpage",reportsPageList);
	}
	
	@RequestMapping("/projectsummary")
	public ModelAndView getProjectSummaryPage() {
		logger.info("Displaying ProjectSummary");
		
		return new ModelAndView("projectsummary");
	}
	
	@RequestMapping("/sprintreport")
	public void getSprintReport(HttpServletRequest request, HttpServletResponse response){
		logger.info("Getting Sprint Report Graph");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.SPRINT_REPORT_URL+projectName;
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
			logger.error("@ProjectDashboardController/sprintreport :"+e.getMessage());
		}
	}
	
	@RequestMapping("/releaseburndown")
	public void getReleaseBurndownReport(HttpServletRequest request, HttpServletResponse response){
		logger.info("Getting ReleaseBurndown Report");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.RELEASE_BURNDOWN_URL+projectName;
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
			logger.error("@ProjectDashboardController/releaseburndown :"+e.getMessage());
		}
	}
	
	@RequestMapping("/deploymenttable")
	public void getDeploymentTableDetails(HttpServletRequest request, HttpServletResponse response){
		logger.info("Getting Deployment Table Details");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.DEP_TABLE_URL+projectName;
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponseMap");
					JSONArray resultArray=result.getJSONArray("response");
					response.setContentType("application/json");
					response.getWriter().write(resultArray.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@ProjectDashboardController/deploymenttable :"+e.getMessage());
		}
	}
	
	@RequestMapping("/buildreports")
	public ModelAndView getBuildReportsPage() {
		logger.info("Displaying BuildReports");
		
		return new ModelAndView("buildreports");
	}
	
	@RequestMapping("/buildtable")
	public void getBuildTableDetails(HttpServletRequest request, HttpServletResponse response){
		logger.info("Getting BuildTable Details");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.BUILD_TABLE_URL+projectName;
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
			logger.error("@ProjectDashboardController/buildtable :"+e.getMessage());
		}
	}	
	
	@RequestMapping("/codequalityreports")
	public ModelAndView getCodeQualityReportsPage() {
		logger.info("Displaying CodeQuality Reports");
		
		return new ModelAndView("codequalityreports");
	}
	
	@RequestMapping("/codeanalysistable")
	public void getCodeAnalysisTableDetails(HttpServletRequest request, HttpServletResponse response){
		logger.info("Getting CodeAnalysis Table Details");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.CODE_ANALY_TABLE_URL+projectName;
			JSONObject output=restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=output.getString("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponseMap");
					JSONArray resultArray=result.getJSONArray("response");
					response.setContentType("application/json");
					response.getWriter().write(resultArray.toString());
				}
			}
		} catch (Exception e) {
			logger.error("@ProjectDashboardController/codeanalysistable :"+e.getMessage());
		}
	}
	
	@RequestMapping("/deploymentreports")
	public ModelAndView getDeploymentReportsPage() {
		logger.info("Displaying Deployment Reports");
		
		return new ModelAndView("deploymentreports");
	}
	
	@RequestMapping("/testingreports")
	public ModelAndView getTestingReportsPage() {
		logger.info("Displaying Testing Reports");
		
		return new ModelAndView("testreports");
	}
	
	@RequestMapping("/testtrendtable")
	public void getTrestTrendReport(HttpServletRequest request,HttpServletResponse response){
		logger.info("Getting TestTrend details");
		
		try {
			session=request.getSession(false);
			String projectName=session.getAttribute("currentProject").toString();
			String url=Constants.TEST_TREND_REPORTS_URL+projectName;
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
	
}
