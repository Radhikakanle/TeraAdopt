package com.techm.adopt.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.jboss.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techm.adopt.bean.AccessControlBean;
import com.techm.adopt.service.AccessControlService;
import com.techm.adopt.service.RestClientService;
import com.techm.adopt.util.Constants;

@Service
@Transactional
public class AccessControlServiceImpl implements AccessControlService {
	
	@Autowired
	private RestClientService restClientService;
	
	private static final Logger logger = Logger.getLogger(AccessControlServiceImpl.class);

	@Override
	public AccessControlBean getAccessControlRules(String roleName) {
		logger.info("Getting Role Based Access Controls");
		
		AccessControlBean resultBean=null;
		try {
			String url=Constants.ROLE_ACCESS_URL+roleName;
			JSONObject result=restClientService.getOutputFromURL(url);
			if(result!=null){
				resultBean=new AccessControlBean();
				Boolean status=result.getString("status").equals("success");
				if(status){					
					JSONArray resultArray=result.getJSONArray("reponse");
					JSONObject roleAccessObject=resultArray.getJSONObject(0);
					resultBean.setProgramLevelAccess(roleAccessObject.getBoolean("programLevelAccess"));
					resultBean.setProjectLevelAccess(roleAccessObject.getBoolean("projectLevelAccess"));
					resultBean.setProjectDashboardAccess(roleAccessObject.getBoolean("projectDashboardAccess"));
					resultBean.setAutoBuildAccess(roleAccessObject.getBoolean("autoBuildAccess"));
				}
			}
		} catch (Exception e) {
			logger.error("@AccessControlServiceImpl/getAccessControlRules :"+e.getMessage());
		}
		return resultBean;
	}

	@Override
	public AccessControlBean getAccessControlRulesForUser(String userName) {
		logger.info("Getting Role Based Access Controls");
		
		AccessControlBean defaultBean = new AccessControlBean();
		try {
			String url=Constants.ROLES_LIST_URL+userName;
			JSONObject output=restClientService.getOutputFromURL(url);
			List<String> rolesList=new ArrayList<String>();
			if(output!=null){
				Boolean status=output.getString("message").equals("success");
				if(status){
					JSONArray resultArray=output.getJSONArray("rollName");
					for(int i=0; i<resultArray.length(); i++){
						rolesList.add(resultArray.get(i).toString());
					}
				}
			}
			
			
			for(int i=0; i<rolesList.size(); i++){
				String url2=Constants.ROLE_ACCESS_URL+rolesList.get(i);
				JSONObject result=restClientService.getOutputFromURL(url2);
				if(result!=null){
					Boolean status=result.getString("status").equals("success");
					if(status){
						JSONArray resultArray=result.getJSONArray("reponse");
						JSONObject roleAccessObject=resultArray.getJSONObject(0);
						defaultBean.setProjectLevelAccess(defaultBean.isProjectLevelAccess() || roleAccessObject.getBoolean("projectLevelAccess"));
						defaultBean.setProgramLevelAccess(defaultBean.isProgramLevelAccess() || roleAccessObject.getBoolean("programLevelAccess"));
						defaultBean.setProjectDashboardAccess(defaultBean.isProjectDashboardAccess() || roleAccessObject.getBoolean("projectDashboardAccess"));
						defaultBean.setAutoBuildAccess(defaultBean.isAutoBuildAccess() || roleAccessObject.getBoolean("autoBuildAccess"));
						defaultBean.setSprintReportAccess(defaultBean.isSprintReportAccess() || roleAccessObject.getBoolean("sprintReportAccess"));
						defaultBean.setVelocityChartAccess(defaultBean.isVelocityChartAccess() || roleAccessObject.getBoolean("velocityChartAccess"));
						defaultBean.setSprintSummaryAccess(defaultBean.isSprintSummaryAccess() || roleAccessObject.getBoolean("sprintSummaryAccess"));
						defaultBean.setReleaseBurndownAccess(defaultBean.isReleaseBurndownAccess() || roleAccessObject.getBoolean("releaseBurndownAccess"));
						defaultBean.setDeploymentSummaryAccess(defaultBean.isDeploymentSummaryAccess() || roleAccessObject.getBoolean("deploymentSummaryAccess"));
						defaultBean.setBuildGraph(defaultBean.isBuildGraph() || roleAccessObject.getBoolean("buildGraph"));
						defaultBean.setBuildDetails(defaultBean.isBuildDetails() || roleAccessObject.getBoolean("buildDetails"));
						defaultBean.setcASummaryGraph(defaultBean.iscASummaryGraph() || roleAccessObject.getBoolean("cASummaryGraph"));
						defaultBean.setcASummaryAccess(defaultBean.iscASummaryAccess() || roleAccessObject.getBoolean("cASummaryAccess"));
						defaultBean.setDeploymentDaywiseAccess(defaultBean.isDeploymentDaywiseAccess() || roleAccessObject.getBoolean("deploymentDaywiseAccess"));
						defaultBean.setDeploymentEnvironmentAccess(defaultBean.isDeploymentEnvironmentAccess() || roleAccessObject.getBoolean("deploymentEnvironmentAccess"));
						defaultBean.setTestTrendAccess(defaultBean.isTestTrendAccess() || roleAccessObject.getBoolean("projectLevelAccess"));
					}
					
				}
			}
		} catch (JSONException e) {
			logger.error("@AccessControlServiceImpl/getAccessControlRulesForUser :"+e.getMessage());
		}
		
		return defaultBean;
	}

}
