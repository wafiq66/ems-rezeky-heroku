package com.ems.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginManagerUI {

	@GetMapping({"/login_manager"})
	public String viewLoginManager() {
		return "login_manager";
	}
}
