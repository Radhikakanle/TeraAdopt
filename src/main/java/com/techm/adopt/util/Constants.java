package com.techm.adopt.util;

public class Constants {

	public static final String USER_AUTH_URL="http://172.19.82.61:4040/AdoptRestAPI/services/authentication/isValid/";
	//public static final String USER_PROJ_LIST_URL="http://172.19.82.61:4040/AdoptRestAPI/services/projectdetails/getallprojects/";
	public static final String USER_PROJ_LIST_URL="http://172.19.82.61:4040/AdoptRestAPI/services/authentication/getProjects/";
	public static final String ALL_PROJ_SPRINTS_URL="http://172.19.82.61:4040/AdoptRestAPI/services/project/reports/allProjectSprintDetails";
	public static final String ALL_PROJ_STATES_URL="http://172.19.82.61:4040/AdoptRestAPI/services/project/reports/allprojectsstate";
	public static final String CODE_QUAL_PROJ_URL="http://172.19.82.61:4040/AdoptRestAPI/services/codeanalysis/getcodequalityofproject/";
	public static final String OPEN_ISSUES_URL="http://172.19.82.61:4040/AdoptRestAPI/services/project/reports/openIssues";
	public static final String BUILD_GRAPH_URL="http://172.19.82.61:4040/AdoptRestAPI/services/build/builddetailsgraphs/";
	public static final String DEP_DAILY_GRAPH_URL="http://172.19.82.61:4040/AdoptRestAPI/services/deploy/deploymentdetailsgraph/";
	public static final String DEP_ENV_GRAPH_URL="http://172.19.82.61:4040/AdoptRestAPI/services/deploy/Envdeploymentdetailsgraph/";
	public static final String CODE_ANALYSIS_GRAPH_URL="http://172.19.82.61:4040/AdoptRestAPI/services/codeanalysis/codeanalysisdetailsgraph/";
	public static final String PROJ_BURNDOWN_URL="http://172.19.82.61:4040/AdoptRestAPI/services/project/reports/projectburndown/";
	public static final String SPRINT_BURNDOWN_URL="http://172.19.82.61:4040/AdoptRestAPI/services/project/reports/sprintburndown/";
	public static final String TEST_TREND_URL="http://172.19.82.61:4040/AdoptRestAPI/services/test/testdetails/";
	public static final String TEST_TREND_REPORTS_URL="http://172.19.82.61:4040/AdoptRestAPI/services/test/testdetailsreport/";
	public static final String SPRINT_REPORT_URL="http://172.19.82.61:4040/AdoptRestAPI/services/project/reports/sprintreport/";
	public static final String RELEASE_BURNDOWN_URL="http://172.19.82.61:4040/AdoptRestAPI/services/project/reports/releaseburndown/";
	public static final String DEP_TABLE_URL="http://172.19.82.61:4040/AdoptRestAPI/services/deploy/getdeploymenttable/";
	public static final String BUILD_TABLE_URL="http://172.19.82.61:4040/AdoptRestAPI/services/build/builddetailstable/";
	
	public static final String CODE_ANALY_TABLE_URL="http://172.19.82.61:4040/AdoptRestAPI/services/codeanalysis/getcodeanalysisdetails/";
	public static final String BUILDIDS_PER_PROJ_URL="http://172.19.82.61:4040/AdoptRestAPI/services/deploy/getbuildids/";
	public static final String AUTOBUILD_URL="http://172.19.82.61:4040/AdoptRestAPI/services/build/autobuildpromotion/";
	public static final String ROLES_LIST_URL="http://172.19.82.61:4040/AdoptRestAPI/services/authentication/getRoles/";
	
	public static final String TABS_LIST_URL="http://172.19.82.61:4040/AdoptRestAPI/services/featureperrole/";
	public static final String REPORTS_LIST_URL="http://172.19.82.61:4040/AdoptRestAPI/services/reports/";
	
	public static final String ROLE_ACCESS_URL="http://172.19.82.61:4040/AdoptRestAPI/services/role/access/";
	
	
	
	public static final String TASKS_FOR_BUILD = "http://172.19.82.61:4040/AdoptRestAPI/services/deploy/getTaskDetailsForBuild/";
	public static final String CURRENT_JOB="http://10.53.67.35:8180/Build-CXF-Spring/services/build/getCurrentJobName/";
	public static final String TRUNCATE_TABLE ="http://10.53.67.35:8180/Build-CXF-Spring/services/deploy/truncate/";
	public static final String JOBS_STATUS="http://172.19.82.61:4040/AdoptRestAPI/services/build/getjobsstatus/";
	//public static final String DEPLOYMENT_HISTORY ="http://172.19.82.61:4040/AdoptRestAPI/services/deploy/getdeploymenttablePro/";
	public static final String DEPLOYMENT_HISTORY = "http://172.19.82.61:4040/AdoptRestAPI/services/deploy/getBids/";
	
	public static final String buildids= "http://172.19.82.61:4040/AdoptRestAPI/services/deploy/getBids/";
	public static final String READY_BUILDS = "http://10.53.67.35:8180/Build-CXF-Spring/services/deploy/ReadyBuilds/";
}
