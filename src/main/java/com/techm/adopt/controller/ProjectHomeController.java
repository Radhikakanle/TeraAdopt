package com.techm.adopt.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
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
	
	
	
	
	
	
	
	@RequestMapping(value="/buildIDs", method=RequestMethod.GET)
	public void getBuildIds(HttpServletRequest request,HttpServletResponse response){
		String projectname=session.getAttribute("currentProject").toString();
			//String url=Constants.BUILDIDS_PER_PROJ_URL+projectname;
		
		String url=Constants.buildids+projectname;
			JSONObject output= restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponseMap");
					JSONArray array=result.getJSONArray("response");
					System.out.println("response tab map:"+array);
					response.setContentType("application/json");
					try {
						response.getWriter().write(array.toString());
					} catch (IOException e) {
						// TODO Auto-generated catch block
						logger.error("@DeploymentReportsController :"+e.getMessage());
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
	
////////////////////////////////////
	
	
//////////////////////////////////



	
	@RequestMapping(value="/buildpipeline", method=RequestMethod.GET)
	public ModelAndView buildPromotion(HttpServletRequest request,HttpServletResponse response){
		String projectname=session.getAttribute("currentProject").toString();
		System.out.println("inside controller");
		String bid=request.getParameter("buildid");
		if(bid!=null){
			/*String parameter= projectname+"_VERSION";
			String url="http://172.19.82.18:8080/job/"+projectname+"_UAT"+"/buildWithParameters?"+parameter+"="+bid;
			  
			RestTemplate restTemplate=new RestTemplate();
			
			System.out.println("return of triggering jenkins url:"+restTemplate.getForObject(url,String.class));*/
			String trun = Constants.TRUNCATE_TABLE+projectname;
			JSONObject output1= restClientService.getOutputFromURL(trun);
			
			
			String url=Constants.AUTOBUILD_URL+projectname+"/"+bid;
			JSONObject output= restClientService.getOutputFromURL(url);
			
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					try {
						Thread.sleep(10000);
					}
					catch(Exception e)
					{
						System.out.println(e);
					}
					return new ModelAndView("temp");
					}
				else {
					return new ModelAndView("temp");
				}
			
			
	   }
			return new ModelAndView("temp");
		}
	   else{
			return new ModelAndView("temp","errmsg","please select valid Id");
	   }
}
	

	
	@RequestMapping(value="/displaystatus", method=RequestMethod.GET)
	public ModelAndView displaystatus(HttpServletRequest request,HttpServletResponse response){
		String projectname=session.getAttribute("currentProject").toString();
		
		String url=Constants.CURRENT_JOB+projectname;
		JSONObject output= restClientService.getOutputFromURL(url);
		if(output!=null){
			Boolean status=(Boolean) output.get("status").equals("success");
			
			if(status){
				JSONObject result=output.getJSONObject("reponseMap");
				JSONArray array=result.getJSONArray("response");
				System.out.println("response array :"+array);
				String runJob="";
				try {
					if(null!=String.valueOf(array.get(0))){
						runJob=String.valueOf(array.get(0));
					}
					else{
						runJob="";
						
					}
				} catch (JSONException e) {
					logger.error(e.getMessage());
					runJob="";
				}
				
				return new ModelAndView("JobStatus","jname",runJob);
			}
			else
			{
				return new ModelAndView("JobStatus");
			}
		
		}
		else{
		return new ModelAndView("JobStatus");
		}
	
	}
	
	
	
	@RequestMapping(value="/taskHistory", method=RequestMethod.POST)
	public void taskDetails(HttpServletRequest request,HttpServletResponse response){
		System.out.println("inside task history");
		String projectname=session.getAttribute("currentProject").toString();
		String bid=request.getParameter("name");
		System.out.println("bid in task history servlet:  "+ bid);
		String url=Constants.TASKS_FOR_BUILD+projectname+"/"+bid;
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
					logger.error("@DeploymentReportsController:Task Details :"+e.getMessage());
				}
			}
		}
	}
	
	
	@RequestMapping(value="/pielinejobs", method=RequestMethod.GET)
	public void getJobsStatus(HttpServletRequest request,HttpServletResponse response){
		String projectname=session.getAttribute("currentProject").toString();
		System.out.println(projectname);
		String url=Constants.JOBS_STATUS+projectname;
		JSONObject output= restClientService.getOutputFromURL(url);
		System.out.println("inside pipeline jobs controller");
		if(output!=null){
			Boolean status=(Boolean) output.get("status").equals("success");
			if(status){
				JSONObject result=output.getJSONObject("reponseMap");
				JSONArray array=result.getJSONArray("response");
				response.setContentType("application/json");
				try {
					response.getWriter().write(array.toString());
				} catch (IOException e) {
					logger.error("@DeploymentReportsController:Jobs Details :"+e.getMessage());
				}
			}
		}
	}
	
	
	/*
	@RequestMapping(value="/getbuilds")
	public void getbuilds(HttpServletRequest request,HttpServletResponse response){
		
		String projectname=session.getAttribute("currentProject").toString();
			String url=Constants.DEPLOYMENT_HISTORY+projectname;
			JSONObject output= restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponseMap");
					JSONArray array=result.getJSONArray("response");
					System.out.println("result is"+result);
					System.out.println("response is"+result);
					response.setContentType("application/json");
					try {
						response.getWriter().write(array.toString());
					} catch (IOException e) {
						logger.error("@DeploymentReportsController :"+e.getMessage());
					}
				}
			}*/
	
	
	
	

	@RequestMapping(value="/getbuilds")
	public void getbuilds(HttpServletRequest request,HttpServletResponse response){
		
		String projectname=session.getAttribute("currentProject").toString();
			String url=Constants.READY_BUILDS +projectname;
			JSONObject output= restClientService.getOutputFromURL(url);
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					JSONObject result=output.getJSONObject("reponseMap");
					JSONArray array=result.getJSONArray("response");
					System.out.println("result is"+result);
					System.out.println("response is"+result);
					response.setContentType("application/json");
					try {
						response.getWriter().write(array.toString());
					} catch (IOException e) {
						logger.error("@DeploymentReportsController :"+e.getMessage());
					}
				}
			}
	
	}
	
	
	@RequestMapping(value="/DepBuild", method=RequestMethod.GET)
	public ModelAndView depBuild(HttpServletRequest request,HttpServletResponse response){
		String projectname=session.getAttribute("currentProject").toString();
		System.out.println("inside controller");
		String bid=request.getParameter("buildid");
		if(bid!=null){
			/*String parameter= projectname+"_VERSION";
			String url="http://172.19.82.18:8080/job/"+projectname+"_UAT"+"/buildWithParameters?"+parameter+"="+bid;
			  
			RestTemplate restTemplate=new RestTemplate();
			
			System.out.println("return of triggering jenkins url:"+restTemplate.getForObject(url,String.class));*/
			String trun = Constants.TRUNCATE_TABLE+projectname;
			JSONObject output1= restClientService.getOutputFromURL(trun);
			String url=Constants.AUTOBUILD_URL+projectname+"/"+bid;
			JSONObject output= restClientService.getOutputFromURL(url);
			
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					try {
						Thread.sleep(10000);
					}
					catch(Exception e)
					{
						System.out.println(e);
					}
					return new ModelAndView("temp");
					}
				else {
					return new ModelAndView("temp");
				}
			
			
	   }
			return new ModelAndView("temp");
		}
	   else{
			return new ModelAndView("temp","errmsg","please select valid Id");
	   }
	}
	
	
	
	
	
	@RequestMapping(value="/deployedEnvironments", method=RequestMethod.POST) //to get the environments where app deployed
	public void deployedEnvironments(HttpServletRequest request,HttpServletResponse response){
		System.out.println("deployed Environments");
		String projectname=session.getAttribute("currentProject").toString();
		String bid=request.getParameter("name");
		System.out.println(bid);
		String url="http://10.53.67.35:8180/NewCXF-RS-SH/services/deploy/deployEnv/"+projectname+"/"+bid;
		JSONObject output= restClientService.getOutputFromURL(url);
		if(output!=null){
			System.out.println("output is not null");
			Boolean status=(Boolean) output.get("status").equals("success");
			if(status){
				System.out.println("status is not null");
				JSONObject result=output.getJSONObject("reponseMap");
				JSONArray array=result.getJSONArray("response");
				response.setContentType("application/json");
				try {
					response.getWriter().write(array.toString());
				} catch (IOException e) {
					logger.error("@DeploymentReportsController:Task Details :"+e.getMessage());
				}
			}
		}
	}
	
	
	@RequestMapping(value="/deployInEnv", method=RequestMethod.GET)
	public void deployInEnv(HttpServletRequest request,HttpServletResponse response){
		String projectname=session.getAttribute("currentProject").toString();
		System.out.println("inside controller");
	String bid=request.getParameter("buildid");
	Object env =  request.getAttribute("id");
	System.out.println((String)env);
	
	System.out.println("bid is"+bid);
		System.out.println("inside deploy Environment sep");
		//if(bid!=null){
			/*String parameter= projectname+"_VERSION";
			String url="http://172.19.82.18:8080/job/"+projectname+"_UAT"+"/buildWithParameters?"+parameter+"="+bid;
			  
			RestTemplate restTemplate=new RestTemplate();
			
			System.out.println("return of triggering jenkins url:"+restTemplate.getForObject(url,String.class));*/
			
			//String url="http://10.53.67.35:8180/NewCXF-RS-SH/services/deploy/deployApplication/"+projectname+"/"+"2.0.0.78"+"/"+"UAT";
		String url = Constants.DEP_IN_ENV+projectname+"/"+bid;
		System.out.println(url);
			JSONObject output= restClientService.getOutputFromURL(url);
			
			if(output!=null){
				Boolean status=(Boolean) output.get("status").equals("success");
				if(status){
					
			try {
				response.sendRedirect("http://172.19.81.113:9093/jenkins/view/Tera_Adopt_UAT/?fullscreen=true");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
	  // }
			}
	   }
}
	
	
	
	
	
}
