package kr.or.dummys.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.dummys.dto.Type;
import kr.or.dummys.dto.Users;
import kr.or.dummys.service.admin.AdminService;
import kr.or.dummys.service.user.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("index.do")
	public String home(Model model ,Principal principal) {
		
		if(principal !=null) {
			String userid = principal.getName();
			userservice.updateLogin_date(userid);
		}
		
		List<Type> list = adminService.typeList();
		
		model.addAttribute("typelist",list);
		
		return "home";
	}
	
	@GetMapping("sleep.do")
	public String sleep(Model model, Principal pri) {
		
		String userid = pri.getName();
		Users users = userservice.getUser(userid);
		
		model.addAttribute("users", users);
		
		return "/sleep";
	}
	//error
	@GetMapping("/error.do")
	public String error() {
		return "utils/error";
	}
	
}
