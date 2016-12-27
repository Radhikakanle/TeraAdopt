package com.techm.adopt.bean;

import java.io.Serializable;

public class LoginBean implements Serializable{

	private static final long serialVersionUID = 1L;

	private String username;
	private String password;
	private String userDisplayName;
	private String tabName;
	private String tabDisplayName;
	private String tabUrl;
	private int tabOrder;
	private String roleName;
	private AccessControlBean accessControl;
	
	
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserDisplayName() {
		return userDisplayName;
	}
	public void setUserDisplayName(String userDisplayName) {
		this.userDisplayName = userDisplayName;
	}
	public String getTabName() {
		return tabName;
	}
	public void setTabName(String tabName) {
		this.tabName = tabName;
	}
	public String getTabDisplayName() {
		return tabDisplayName;
	}
	public void setTabDisplayName(String tabDisplayName) {
		this.tabDisplayName = tabDisplayName;
	}
	public String getTabUrl() {
		return tabUrl;
	}
	public void setTabUrl(String tabUrl) {
		this.tabUrl = tabUrl;
	}
	public int getTabOrder() {
		return tabOrder;
	}
	public void setTabOrder(int tabOrder) {
		this.tabOrder = tabOrder;
	}
	public AccessControlBean getAccessControl() {
		return accessControl;
	}
	public void setAccessControl(AccessControlBean accessControl) {
		this.accessControl = accessControl;
	}
		
}
