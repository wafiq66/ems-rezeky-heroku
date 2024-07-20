package com.ems.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginEmployeeUI {

	@GetMapping({"/login_employee"})
	public String viewLoginEmployee() {
		return "login_employee";
	}
}
