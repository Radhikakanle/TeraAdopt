package com.techm.adopt.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import org.jboss.logging.Logger;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.techm.adopt.bean.LoginBean;

@Controller
public class HomeController {

	private static final Logger logger = Logger.getLogger(HomeController.class);
	
	@RequestMapping({"home","/"})
	public ModelAndView homePage(Model model){
		logger.info("Displaying Homepage");
		
		Properties prop = new Properties();
		/*//InputStream file=new FileInputStream("WEB-INF/resources/properties/app.properties");
		System.out.println(this.getClass().getClassLoader().getResource("").getPath().split("/WEB-INF/")[0]);
		//prop.load(file);
*/		
		try {
			DefaultResourceLoader loader=new DefaultResourceLoader();
			Resource resource=loader.getResource("classpath:properties/app.properties");
			File file=resource.getFile();
			InputStream inputStream=new FileInputStream(file);
			prop.load(inputStream);
			System.out.println();
			System.out.println(prop.getProperty("shades"));
			System.out.println(prop.getProperty("user.place"));
		} catch (Exception e) {
			logger.info(e.getMessage());
		}
		model.addAttribute("login",new LoginBean());
		return new ModelAndView("home");
	}
	
	/*public void json() {
		JSONObject object=new JSONObject();
		
		JSONObject fieldObject=new JSONObject();
		fieldObject.put("project", new JSONObject().put("key", "SAM"));
		fieldObject.put("summary", "Sample Issue");
		fieldObject.put("issuetype", new JSONObject().put("name", "Task"));
		fieldObject.put("assignee", new JSONObject().put("name", "jayasree"));
		fieldObject.put("description", "Created from Rest API");
		
		object.put("fields", fieldObject);
		
	}*/
	
}
