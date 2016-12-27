package com.techm.adopt.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.jboss.logging.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.techm.adopt.bean.LoginBean;
import com.techm.adopt.bean.ReportsPageBean;
import com.techm.adopt.service.ProjectDashboardService;

@Service
@Transactional
public class ProjectDashboardServiceImpl implements ProjectDashboardService {

	private static final Logger logger = Logger.getLogger(ProjectDashboardServiceImpl.class);
	
	@Override
	public List<LoginBean> getTabsListFromJSON(JSONArray array) {
		logger.info("Getting TabsList");
		
		List<LoginBean> resultList=null;
		try {
			resultList=new ArrayList<LoginBean>();
			LoginBean defaultBean=new LoginBean();
			defaultBean.setTabDisplayName("Project Home");
			defaultBean.setTabUrl("/Adopt/projecthome");
			defaultBean.setTabOrder(1);
			defaultBean.setTabName("projecthome");
			resultList.add(defaultBean);
			
			for(int i=0; i<array.length(); i++){
				JSONObject object=array.getJSONObject(i);
				LoginBean bean=new LoginBean();
				
				bean.setTabName(object.getString("featureName"));
				bean.setTabDisplayName(object.getString("featureDisplayName"));
				bean.setTabOrder(object.getInt("featureOrder"));
				bean.setTabUrl(object.getString("featureUrl"));
				resultList.add(bean);
			}
		} catch (Exception e) {
			logger.error("@ProjectDashboardServiceImpl/Tabs  :"+e.getMessage());
		}
		return resultList;
	}

	@Override
	public List<LoginBean> getPage(JSONArray array, String pagename) {
		logger.info("Getting Page info for a Tab");
		
		List<LoginBean> resultList=null;
		try {
			if(pagename.equals("projecthome")){
				resultList= new ArrayList<LoginBean>();
				LoginBean bean=new LoginBean();
				
				bean.setTabDisplayName("projecthome");
				bean.setTabUrl("projectdashboardhome");
				bean.setTabOrder(1);
				bean.setTabName("projecthome");
				resultList.add(bean);
			}
			else{
				for(int i=0; i<array.length(); i++){
					JSONObject object=array.getJSONObject(i);
					
					if(object.getString("featureName").equals(pagename)){
						resultList= new ArrayList<LoginBean>();
						LoginBean bean=new LoginBean();
						
						bean.setTabName(object.getString("featureName"));
						bean.setTabDisplayName(object.getString("featureDisplayName"));
						bean.setTabOrder(object.getInt("featureOrder"));
						bean.setTabUrl(object.getString("featureUrl"));
						resultList.add(bean);
					}
				}
			}			
		} catch (Exception e) {
			logger.error("@ProjectDashboardServiceImpl/Page  :"+e.getMessage());
		}
		return resultList;
	}

	@Override
	public List<ReportsPageBean> getReportPageList(JSONArray array) {
		logger.info("Getting Reports List");
		
		List<ReportsPageBean> resultList=null;
		try {
			resultList=new ArrayList<ReportsPageBean>();
			for(int i=0; i<array.length(); i++){
				JSONObject object=array.getJSONObject(i);
				ReportsPageBean reportsBean=new ReportsPageBean();
				
				reportsBean.setId(object.getInt("id"));
				reportsBean.setName(object.getString("name"));
				reportsBean.setPageName(object.getString("pageName"));
				resultList.add(reportsBean);
			}
		} catch (Exception e) {
			logger.error("@ProjectDashboardServiceImpl/ReportPage  :"+e.getMessage());
		}
		return resultList;
	}

}
