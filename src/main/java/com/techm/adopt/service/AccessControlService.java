package com.techm.adopt.service;

import com.techm.adopt.bean.AccessControlBean;

public interface AccessControlService {

	public AccessControlBean getAccessControlRules(String roleName);
	public AccessControlBean getAccessControlRulesForUser(String userName);

}
