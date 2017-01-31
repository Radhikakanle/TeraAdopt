package com.techm.adopt.util;

public class Constants {

	public static final String Rest_API_URL="http://10.53.67.35:4040/AdoptRestAPI/services/";

	public static final String USER_AUTH_URL=Rest_API_URL+"authentication/isValid/";
	//public static final String USER_PROJ_LIST_URL=Rest_API_URL+"http://172.19.82.61:4040/AdoptRestAPI/services/projectdetails/getallprojects/";
	public static final String USER_PROJ_LIST_URL=Rest_API_URL+"authentication/getProjects/";
	public static final String ALL_PROJ_SPRINTS_URL=Rest_API_URL+"project/reports/allProjectSprintDetails";
	public static final String ALL_PROJ_STATES_URL=Rest_API_URL+"project/reports/allprojectsstate";
	public static final String CODE_QUAL_PROJ_URL=Rest_API_URL+"codeanalysis/getcodequalityofproject/";
	public static final String OPEN_ISSUES_URL=Rest_API_URL+"project/reports/openIssues";
	public static final String BUILD_GRAPH_URL=Rest_API_URL+"build/builddetailsgraphs/";
	public static final String DEP_DAILY_GRAPH_URL=Rest_API_URL+"deploy/deploymentdetailsgraph/";
	public static final String DEP_ENV_GRAPH_URL=Rest_API_URL+"deploy/Envdeploymentdetailsgraph/";
	public static final String CODE_ANALYSIS_GRAPH_URL=Rest_API_URL+"codeanalysis/codeanalysisdetailsgraph/";
	public static final String PROJ_BURNDOWN_URL=Rest_API_URL+"project/reports/projectburndown/";
	public static final String SPRINT_BURNDOWN_URL=Rest_API_URL+"project/reports/sprintburndown/";
	public static final String TEST_TREND_URL=Rest_API_URL+"test/testdetails/";
	public static final String TEST_TREND_REPORTS_URL=Rest_API_URL+"test/testdetailsreport/";
	public static final String SPRINT_REPORT_URL=Rest_API_URL+"project/reports/sprintreport/";
	public static final String RELEASE_BURNDOWN_URL=Rest_API_URL+"project/reports/releaseburndown/";
	//public static final String DEP_TABLE_URL=Rest_API_URL+"deploy/getdeploymenttable/";
	public static final String BUILD_TABLE_URL=Rest_API_URL+"build/builddetailstable/";
	
	public static final String CODE_ANALY_TABLE_URL=Rest_API_URL+"codeanalysis/getcodeanalysisdetails/";
	public static final String BUILDIDS_PER_PROJ_URL=Rest_API_URL+"deploy/getbuildids/";
	public static final String AUTOBUILD_URL=Rest_API_URL+"build/autobuildpromotion/";
	public static final String ROLES_LIST_URL=Rest_API_URL+"authentication/getRoles/";
	
	public static final String TABS_LIST_URL=Rest_API_URL+"featureperrole/";
	public static final String REPORTS_LIST_URL=Rest_API_URL+"reports/";
	
	public static final String ROLE_ACCESS_URL=Rest_API_URL+"role/access/";
	
	
	
	public static final String TASKS_FOR_BUILD = Rest_API_URL+"deploy/getTaskDetailsForBuild/";
	public static final String CURRENT_JOB="http://10.53.67.35:8180/Build-CXF-Spring/services/build/getCurrentJobName/";
	public static final String TRUNCATE_TABLE ="http://10.53.67.35:8180/Build-CXF-Spring/services/deploy/truncate/";
	public static final String JOBS_STATUS=Rest_API_URL+"build/getjobsstatus/";
	//public static final String DEPLOYMENT_HISTORY ="http://172.19.82.61:4040/AdoptRestAPI/services/deploy/getdeploymenttablePro/";
	public static final String DEPLOYMENT_HISTORY = Rest_API_URL+"deploy/getBids/";
	
	public static final String buildids= Rest_API_URL+"deploy/getBids/";
	//public static final String READY_BUILDS = "http://10.53.67.35:8180/Build-CXF-Spring/services/deploy/ReadyBuilds/";
	public static final String READY_BUILDS = "http://10.53.67.35:8180/NewCXF-RS-SH/services/deploy/ReadyBuilds/";
	public static final String DEP_TABLE_URL="http://10.53.67.35:8180/NewCXF-RS-SH/services/deploy/getdeploymenttable/";
	//public static final String DEPLOYED_ENVIRONMENTS = " http://10.53.67.35:8180/Build-CXF-Spring/services/deploy/deployEnv/";
	public static final String DEPLOYED_ENVIRONMENTS = " http://10.53.67.35:8980/AdoptRestAPI/services/deploy/deployEnv/";
	public static final String DEP_IN_ENV ="http://10.53.67.35:8180/NewCXF-RS-SH/services/deploy/deployApplication/";
}
