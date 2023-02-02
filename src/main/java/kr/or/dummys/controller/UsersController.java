package kr.or.dummys.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.dummys.dto.Users;
import kr.or.dummys.service.user.UserService;



@Controller
@RequestMapping("/users/*")
public class UsersController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	//로그인 처리화면

	@GetMapping("/login.do")
	public String login() {

		return "users/login";
	}
	
	@PostMapping("/login.do")
	public String loginOK(@RequestParam("password") String rawPassword, Principal pri) {
		String viewpage = "";
		System.out.println(rawPassword);
		
		//회원정보
		Users user = userService.getUser(pri.getName());
		
		String encodedPassword = user.getPassword();
		
		boolean result = bCryptPasswordEncoder.matches(rawPassword, encodedPassword);
		
		if(result) {
			viewpage = "redirect:join.do";
		}else {
			viewpage = "redirect:index.do";
		}
		
		return viewpage;
	}
	
	//error
	@GetMapping("/error.do")
	public String error() {
		return "error";
	}
	
	@GetMapping("/forgetPassword.do")
	public String forgetPassword() {

		return "users/forgetPassword";
	}

}
