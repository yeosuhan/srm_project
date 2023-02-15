package com.oti.team2.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oti.team2.HomeController;

@Controller
public class ManagementController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/clientsList", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {		
		return "clientsList";
	}
	
	@RequestMapping(value = "/employeesList", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {		
		return "employeesList";
	}
	
	@RequestMapping(value = "/departmentsList", method = RequestMethod.GET)
	public String home3(Locale locale, Model model) {		
		return "departmentsList";
	}
}
