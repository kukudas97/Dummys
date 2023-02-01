package kr.or.dummys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.dummys.service.users.UsersService;

@Controller
@RequestMapping("/users/")
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	//로그인 처리화면
	/*
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String userConfirm() {
		return "users/login";
	}*/
	
	@GetMapping("/login.do")
	public String login() {
		System.out.println("들어옴??");
		return "users/login";
	}
	
	@GetMapping("/logout.do")
	public String logout() {
		return null;
	}

}
