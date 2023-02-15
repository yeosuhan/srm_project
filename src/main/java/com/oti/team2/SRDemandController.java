package com.oti.team2;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SRDemandController {
	
	private static final Logger logger = LoggerFactory.getLogger(SRDemandController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/SRDemandList", method = RequestMethod.GET)
	public String home( Model model) {		
		return "srDemandList";
	}
	@ResponseBody
	@RequestMapping(value = "/srSearch" , method = RequestMethod.POST )
	public String srSearch(@RequestBody SrDemand srDemand) {
		//System.out.println(srDemand);
		logger.info(srDemand.toString());
		return "success";
	}
}
