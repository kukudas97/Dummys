package kr.or.dummys.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.dummys.dto.Tendinous;
import kr.or.dummys.service.tendinous.TendinousService;

@Controller
@RequestMapping("/tendinous/*")
public class TendinousController {
	
	@Autowired
	private TendinousService tendinousservice;
	
	@GetMapping("/tendinous.do")
	public String tendinous() {
				
		return "tendinous/tendinousCreate";
	}
	
	@PostMapping("tendinous.do")
	public String tendinous(@RequestParam("title")String title, @RequestParam("content")String content,
			@RequestParam("userid")String userid) {
		
		Tendinous tendinous = new Tendinous();
		
		tendinous.setTendinous_name(title);
		tendinous.setTendinous_content(content);
		tendinous.setUserid(userid);
		
		int result = tendinousservice.insertTendinous(tendinous);
		
		return (result >=1)?"home":"utils/error";
	}
}
