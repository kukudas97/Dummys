package kr.or.dummys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	@GetMapping("/test")
	public void  test() {
		System.out.println("admin only");
	}
}
