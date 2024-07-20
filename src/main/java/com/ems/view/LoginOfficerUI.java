package com.ems.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginOfficerUI {
	
	@GetMapping({"/login_officer"})
	public String viewLoginOfficer() {
		return "login_officer";
	}
}
