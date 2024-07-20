package com.ems.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeUI {
	
	@GetMapping({"/","/welcome"})
	public String viewWelcome() {
		return "welcome";
	}
}
