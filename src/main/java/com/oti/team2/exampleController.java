package com.oti.team2;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class exampleController {
	
	private static final Logger logger = LoggerFactory.getLogger(exampleController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/example", method = RequestMethod.GET)
	public String home(HttpSession session, Model model,@RequestParam(defaultValue="1") int role) {		
		session.removeAttribute("role");
		session.setAttribute("role", role);
		return "example";
	}
	
}
