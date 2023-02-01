package kr.or.dummys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dummys.dto.Users;
import kr.or.dummys.service.user.JoinService;

@Controller
@RequestMapping("/join/")
public class JoinController {
	
	@Autowired
	private JoinService joinService;
	
	//비밀번호 암호화처리
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//회원가입 창 이동
	@GetMapping("/join.do")
	public String joinForm() {
		return "users/joinForm";
	}
	
	//회원가입 처리
	@PostMapping("/join.do")
	public String join(Users users) {
		System.out.println(users.toString());
		int result = 0;
		String viewpage="";
		
		users.setPassword(this.bCryptPasswordEncoder.encode(users.getPassword()));
		
		result = joinService.insertUser(users);
		if(result > 0) {
			System.out.println("삽입 성공");
			viewpage = "redirect:/index.do";
		}
		                
		
		
		return viewpage;
	}
	

}
