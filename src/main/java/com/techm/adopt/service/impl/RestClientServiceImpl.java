package com.techm.adopt.service.impl;

import org.jboss.logging.Logger;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.techm.adopt.service.RestClientService;

@Service
@Transactional
public class RestClientServiceImpl implements RestClientService {

	private static final Logger logger = Logger.getLogger(RestClientServiceImpl.class);
	
	@Override
	public JSONObject getOutputFromURL(String url) {
		logger.info("Getting output from URL");
		
		JSONObject result=null;
		try{
			RestTemplate restTemplate = new RestTemplate();
			String output=restTemplate.getForObject(url, String.class);
			if(output!=null)
				result=new JSONObject(output);
		}catch (Exception e) {
			logger.error("@RestClientServiceImpl  :"+e.getMessage());
		}	
		return result;
	}

}
