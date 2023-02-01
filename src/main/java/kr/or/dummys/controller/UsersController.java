package kr.or.dummys.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dummys.service.user.UserService;



@Controller
@RequestMapping("/users")
public class UsersController {
	
	@Autowired
	private UserService userService;
	
	//로그인 처리화면
	/*
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String userConfirm() {
		return "users/login";
	}*/
	
	@GetMapping("/login.do")
	public String login() {

		return "users/login";
	}
	
	@PostMapping("/login.do")
	public String login(Principal pri) {
		
		System.out.println(pri.getName());
		System.out.println("안녕");
		return "redirect:/admin/test";
	}
	
	@GetMapping("/logout.do")
	public String logout() {
		return "home";
	}
	
	@GetMapping("/error.do")
	public String error() {
		return "error";
	}

}
