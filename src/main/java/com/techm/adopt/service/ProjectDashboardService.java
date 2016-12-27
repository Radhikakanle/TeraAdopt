package com.techm.adopt.service;

import java.util.List;

import org.json.JSONArray;

import com.techm.adopt.bean.LoginBean;
import com.techm.adopt.bean.ReportsPageBean;

public interface ProjectDashboardService {

	List<LoginBean> getTabsListFromJSON(JSONArray array);

	List<LoginBean> getPage(JSONArray array, String pagename);

	List<ReportsPageBean> getReportPageList(JSONArray array);

}
